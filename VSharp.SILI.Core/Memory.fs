﻿namespace VSharp.Core

#nowarn "69"

open VSharp
open VSharp.Core.Types
open VSharp.Core.Types.Constructor
open System.Collections.Immutable

module internal Memory =
    open System.Net.Mime
    open Terms
    open Merging
    open State
    open MemoryCell

// ------------------------------- Primitives -------------------------------

    let private pointer = persistent<int>(always 0, id)
    let private timestamp = persistent<timestamp>(always Timestamp.zero, id)
    let freshAddress() =
        pointer.Mutate(pointer.Value + 1)
        pointer.Value
    let tick() =
        timestamp.Mutate(timestamp.Value |> Timestamp.inc)
        timestamp.Value
    let reset() =
        pointer.Reset()
        timestamp.Reset()
    let saveConfiguration() =
        pointer.Save()
        timestamp.Save()
    let restore() =
        pointer.Restore()
        timestamp.Restore()

    let npe mtd state = State.createInstance mtd typeof<System.NullReferenceException> [] state

    let private npeTerm mtd state _ =
        let exn, state = npe mtd state
        Error mtd exn, state

    let rec private referenceSubLocations locations term =
        match term.term with
        | Error _ -> term
        | Ref(tl, path) -> Ref term.metadata tl (List.append path locations)
        | Ptr(tl, path, typ, shift) -> AnyPtr term.metadata tl (List.append path locations) typ shift
        | GuardedValues(gs, vs) -> vs |> List.map (referenceSubLocations locations) |> List.zip gs |> Union term.metadata
        | _ -> internalfailf "expected reference, but got %O" term

    let referenceArrayLowerBound arrayRef (indices : term) =
        referenceSubLocations [ArrayLowerBound indices] arrayRef

    let referenceArrayLength arrayRef (indices : term) =
        referenceSubLocations [ArrayLength indices] arrayRef

// ------------------------------- Traversal -------------------------------

    // TODO: path should NOT be accumulated, but taken from key metainfo
    let inline private foldHeapLocationsRec folder acc loc typ heap =
        Heap.foldFQL (fun acc subloc cell -> folder acc loc typ (snd <| getFQLOfKey subloc) cell) acc heap

    let rec private foldSubLocations folder acc loc typ path cell = // TODO: get rid of typ
        let foldHeap acc target = foldHeapLocationsRec (foldSubLocations folder) acc loc typ target
        match cell.value.term with
        | Struct(contents, _) ->
            foldHeap acc contents
        | Array(_, _, lower, _, contents, lengths, _) ->
            let acc = foldHeap acc lower
            let acc = foldHeap acc lengths
            foldHeap acc contents
        | _ -> folder acc loc typ path cell

    let private foldHeapLocations folder acc heap =
        Heap.fold (fun acc loc cell -> foldSubLocations folder acc loc (typeOf cell.value) [] cell) acc heap

    let private foldStackLocations folder acc stack =
        stackFold (fun acc loc cell -> foldSubLocations folder acc loc (typeOf cell.value) [] cell) acc stack

// ------------------------------- Instantiation (lazy & default) -------------------------------

    [<StructuralEquality;NoComparison>]
    type private lazyInstantiation<'a when 'a : equality> =
        {location : term; heap : 'a generalizedHeap option; extractor : TermExtractor; typeExtractor : TypeExtractor}
        interface IExtractingSymbolicConstantSource with
            override x.SubTerms = Seq.singleton x.location
            override x.WithExtractor e = {x with extractor = e} :> IExtractingSymbolicConstantSource
        interface IExtractingSymbolicTypeSource with
            override x.WithTypeExtractor e = {x with typeExtractor = e} :> IExtractingSymbolicTypeSource
            override x.TypeCompose ctx state =
                (x :> IStatedSymbolicConstantSource).Compose ctx state |> typeOf |> x.typeExtractor.TypeExtract
            override x.TypeEquals other =
                match other with
                | :? lazyInstantiation<'a> as li -> x.location = li.location
                | _ -> false
    let (|LazyInstantiation|_|) (src : ISymbolicConstantSource) =
        match src with
        | :? lazyInstantiation<_> as li -> Some(li.location, li.heap, li.extractor :? IdTermExtractor)
        | _ -> None

    let private mkStruct metadata time isStatic mkField dotNetType typ fql =
        let mkFieldKey typ name = StructField(name, typ)
        let fields = Types.fieldsOf dotNetType isStatic
        let contents =
            fields
            |> FSharp.Collections.Array.fold (fun acc (name, typ) ->
                let value = mkField metadata name typ
                Heap.add (makePathKey fql (mkFieldKey typ) name) { value = value; created = time; modified = time } acc) Heap.empty
        Struct metadata contents typ

    let rec private defaultOf time metadata typ fql =
        match typ with
        | Bool -> makeFalse metadata
        | Numeric t when t.IsEnum -> CastConcrete (System.Activator.CreateInstance t) t metadata
        | Numeric t -> CastConcrete 0 t metadata
        | Func _
        | Reference _
        | ClassType _
        | ArrayType _
        | InterfaceType _ -> makeNullRef metadata
        | TypeVariable _ ->
            Common.statelessConditionalExecution
                (fun k -> k <| Common.isValueType metadata typ)
                (fun k -> k <| Struct metadata Heap.empty typ)
                (fun k -> k <| makeNullRef metadata)
                Merging.merge Merging.merge2Terms id
        | StructType(dotNetType, _) ->
            mkStruct metadata time false (fun m name t -> StructField(name, t) |> addToOptionFQL fql |> defaultOf time m t) dotNetType typ fql
        | Pointer typ -> makeNullPtr metadata typ
        | _ -> __notImplemented__()

    let mkDefault metadata typ fql =
        defaultOf (tick()) metadata typ fql

    let mkDefaultStruct metadata isStatic targetType fql =
        let dnt = toDotNetType targetType
        let time = tick()
        mkStruct metadata time isStatic (fun m name t -> StructField(name, t) |> addToOptionFQL fql |> defaultOf time m t) dnt targetType fql

    let private makeSymbolicHeapReference metadata (source : IExtractingSymbolicConstantSource) name typ construct =
        let source' = source.WithExtractor(Pointers.HeapAddressExtractor())
        let constant = Constant metadata name source' pointerType
        construct metadata constant typ typ []

    let private makeSymbolicOveralArrayLength metadata (source : IExtractingSymbolicConstantSource) arrayName =
        Constant metadata (sprintf "|%s|" arrayName) (source.WithExtractor(Arrays.LengthExtractor())) Arrays.lengthTermType

    let private makeSymbolicArrayRank metadata (source : IExtractingSymbolicConstantSource) arrayName =
        Constant metadata ("RankOf_%s" + arrayName) (source.WithExtractor(Arrays.RankExtractor())) Arrays.lengthTermType

    let private makeSymbolicArrayLowerBound metadata time name fql heap =
        match Options.ExplorationMode() with
        | TrustConventions -> defaultOf time metadata Arrays.lengthTermType <| Some fql
        | CompleteExploration ->
            Constant metadata name {location = makeFQLRef metadata fql; heap = heap; extractor = IdTermExtractor(); typeExtractor = IdTypeExtractor()} Arrays.lengthTermType

    let private makeSymbolicArrayLength metadata name fql heap =
        Constant metadata name {location = makeFQLRef metadata fql; heap = heap; extractor = IdTermExtractor(); typeExtractor = IdTypeExtractor()} Arrays.lengthTermType

    let private makeSymbolicArrayLowerBounds metadata (source : IExtractingSymbolicConstantSource) arrayName dimension fql =
        match source with
        | :? lazyInstantiation<term> as liSource ->
            match Options.ExplorationMode() with
            | TrustConventions -> Arrays.zeroLowerBound metadata dimension fql
            | CompleteExploration ->
                let idOfBound i = sprintf "%s.%i_LowerBound" arrayName i
                let mkLowerBound i = Constant metadata (idOfBound i) {liSource with location = referenceArrayLowerBound liSource.location (makeNumber i metadata)} Arrays.lengthTermType
                Seq.foldi (fun h i l -> Heap.add (makePathNumericKey fql ArrayLowerBound i metadata) { value = l; created = Timestamp.zero; modified = Timestamp.zero } h) Heap.empty (Seq.init dimension mkLowerBound)
        | _ -> __notImplemented__()

    let private makeSymbolicArrayLengths metadata (source : IExtractingSymbolicConstantSource) arrayName dimension fql =
        match source with
        | :? lazyInstantiation<term> as liSource ->
            let idOfLength i = sprintf "%s.%i_Length" arrayName i
            let mkLength i = Constant metadata (idOfLength i) {liSource with location = referenceArrayLength liSource.location (makeNumber i metadata)} Arrays.lengthTermType
            let lengths = Seq.init dimension mkLength
            let length = Seq.reduce (mul metadata) lengths
            Seq.foldi (fun h i l -> Heap.add (makePathNumericKey fql ArrayLength i metadata) { value = l; created = Timestamp.zero; modified = Timestamp.zero } h) Heap.empty lengths, length
        | _ -> __notImplemented__()

    let private makeSymbolicArray metadata source dimension elemTyp typ arrayName fql =
        let arrayConstant = Constant metadata arrayName source typ
        let instantiator = [True, LazyInstantiator(arrayConstant, elemTyp)]
        let lowerBound, arrayLengths, arrayLength, dim =
            let makeConcrete d =
                let lb = makeSymbolicArrayLowerBounds metadata source arrayName d fql
                let al, length = makeSymbolicArrayLengths metadata source arrayName d fql
                lb, al, length, makeNumber d metadata
            match dimension with
            | Vector -> makeConcrete 1
            | ConcreteDimension d -> makeConcrete d
            | SymbolicDimension _ ->
                let length = makeSymbolicOveralArrayLength metadata source arrayName
                Heap.empty, Heap.empty, length, makeSymbolicArrayRank metadata source arrayName
        Array metadata dim arrayLength lowerBound instantiator Heap.empty arrayLengths typ

    let makeSymbolicInstance metadata source typeSource name fql = function
        | Pointer typ -> makeSymbolicHeapReference metadata source name typ (fun mtd tl bTyp sTyp path -> HeapPtr mtd tl bTyp sTyp path sTyp)
        | Reference typ -> makeSymbolicHeapReference metadata source name typ HeapRef
        | t when Types.isPrimitive t || Types.isFunction t -> Constant metadata name source t
        | StructType _ // TODO: initialize all fields of struct symbolicly (via mkStruct). Warning: `source` should be updated!
        | InterfaceType _
        | TypeVariable _
        | ClassType _ as t ->
            let t = Types.Variable.fromTermType name typeSource t
            Struct metadata Heap.empty t
        | ArrayType(_, d) as t ->
            let t = Types.Variable.fromTermType name typeSource t
            let e = ArrayTypeExtractor().TypeExtract t
            makeSymbolicArray metadata source d e t name fql
        | Void -> Nop
        | _ -> __notImplemented__()

    let private genericLazyInstantiator<'a when 'a : equality> metadata heap fql typ () =
        let source : 'a lazyInstantiation = {location = makeFQLRef metadata fql; heap = heap; extractor = IdTermExtractor(); typeExtractor = IdTypeExtractor()}
        makeSymbolicInstance metadata source source (nameOfLocation fql) (Some fql) typ

    let () =
        State.genericLazyInstantiator <- fun mtd -> genericLazyInstantiator mtd None

    let private arrayElementLazyInstantiator metadata instantiator typ heap time fql idx = function
        | DefaultInstantiator(_, concreteType) -> fun () -> defaultOf time metadata (typ |?? concreteType) <| Some fql
        | LazyInstantiator(array, concreteType) -> instantiator |?? fun () ->
            let id = sprintf "%s[%s]" (toString array) (idx.term.IndicesToString())
            let source = {location = makeFQLRef metadata fql; heap = heap; extractor = IdTermExtractor(); typeExtractor = IdTypeExtractor()}
            makeSymbolicInstance metadata source source id (Some fql) concreteType
    let private arrayLowerBoundLazyInstantiator metadata instantiator _ heap time fql (idx : term) = function
        | DefaultInstantiator(_, _) -> fun () -> defaultOf time metadata Arrays.lengthTermType <| Some fql
        | LazyInstantiator(array, _) -> instantiator |?? fun () ->
            let name = sprintf "%O.%s_LowerBound" array (idx.term.IndicesToString())
            makeSymbolicArrayLowerBound metadata time name fql heap

    let private arrayLengthLazyInstantiator metadata instantiator _ heap _ fql (idx : term) = function
        | DefaultInstantiator(_, _) -> fun () ->
            // In case when array was allocated during the interpretation (and thus has default instantiator) lengths by
            // all dimensions are known (they can be symbolic, but still defined). If this code triggers then we have
            // requested length by a greater dimension than our array has. That can happen in case of comparison of array
            // lengths when arrays have different ranks. In that case we consider lengths in all other dimensions equal to 1.
            makeNumber 1 metadata
        | LazyInstantiator(array, _) -> instantiator |?? fun () ->
            let name = sprintf "%O.%s_Length" array (idx.term.IndicesToString())
            makeSymbolicArrayLength metadata name fql heap

    let private staticMemoryLazyInstantiator metadata typ () =
        Struct metadata Heap.empty typ

    let private selectLazyInstantiator<'a when 'a : equality> metadata (heap : 'a generalizedHeap option) time fql typ =
        match fql with
        | _, (_::_ as path) when isArrayLengthSeg <| List.last path -> fun () -> makeSymbolicArrayLength metadata (nameOfLocation fql + "_Length") fql heap
        | _, (_::_ as path) when isArrayLowerBoundSeg <| List.last path -> fun () -> makeSymbolicArrayLowerBound metadata time (nameOfLocation fql + "_LowerBound") fql heap
        | TopLevelStatics _, [] -> staticMemoryLazyInstantiator metadata typ
        | _ -> genericLazyInstantiator<'a> metadata heap fql typ

// ------------------------------- Locations comparison -------------------------------

    type private 'key pointerInfo = { location : 'key; fullyQualifiedLocation : fql; typ : termType; time : timestamp; path : pathSegment list }

    let private canPoint mtd keyCompare pointerAddr pointerType locationAddr locationValue =
        // TODO: what if locationType is Null?
        let addrEqual = keyCompare mtd pointerAddr locationAddr
        let typeSuits v = Common.typesEqual mtd (typeOf v) pointerType
        let typeEqual =
            match locationValue.term with
            | Union gvs ->
                gvs |> List.map (fun (g, v) -> (g, typeSuits v)) |> Merging.merge
            | _ -> typeSuits locationValue
        if isConcrete addrEqual then addrEqual else addrEqual &&& typeEqual

    let private findSuitableLocations<'key when 'key : equality> mtd h keyCompare contextList mapper (ptr : 'key pointerInfo) =
        let filterMapKey (k : heapKey<'key, fql>, cell) =
            let k, v = List.fold mapper (k.key, cell.value) contextList
            let cell = {cell with value = v}
            let guard = canPoint mtd keyCompare ptr.location ptr.typ k v
            match guard with
            | False -> None
            | _ -> Some(guard, k, cell)
        let gvs = h |> Heap.toSeq |> List.ofSeq |> List.choose filterMapKey
        let baseGvs, restGvs = gvs |> List.partition (fst3 >> isTrue) |> mapfst (List.map (fun (_, a, v) -> a, v))
        assert(List.length baseGvs <= 1)
        List.tryHead baseGvs, restGvs

// ------------------------------- Primitive read/write -------------------------------

    let private stackDeref time instantiateLazy state location =
        if isAllocatedOnStack state location then
            (readStackLocation state location, state)
        else
            let lazyInstance = {value = instantiateLazy(); created = time; modified = time }
            (lazyInstance, writeStackLocation state location lazyInstance)

    let private writeHeap time guard h addr newValue fql =
        assert(Heap.contains addr h)
        let oldCell = Heap.find addr h
        let cell = merge2Cells guard !!guard { oldCell with value = newValue; modified = time } oldCell
        Heap.add (makeKey addr <| Some fql) cell h

    let private isTopLevelHeapConcreteAddr = function
        | TopLevelHeap(addr, _, _), [] when isConcrete addr -> true
        | _ -> false

// ------------------------------- Core -------------------------------

    let rec private accessHeap<'a, 'key when 'a : equality and 'key : equality> read restricted metadata (groundHeap:'a generalizedHeap option) guard update (h : heap<'key, term, fql>) time keyCompare contextList mapper lazyInstantiator ptr =
        let accessRec gvas lazyValue h =
            let accessLocation (h, minCreatedTime, maxModifeiedTime) (guard', addr, cell) =
                let guard'' = guard &&& guard'
                let accessedCell, newBaseValue = accessTerm read metadata groundHeap guard'' update contextList lazyInstantiator ptr.time ptr.fullyQualifiedLocation ptr.path cell
                let h' = if read || cell.value = newBaseValue then h else writeHeap accessedCell.modified guard'' h addr newBaseValue ptr.fullyQualifiedLocation
                (guard'', accessedCell.value), (h', min minCreatedTime accessedCell.created, max maxModifeiedTime accessedCell.modified)
            let gvs, (h', minCreated, maxModified) = List.mapFold accessLocation (h, Timestamp.infinity, Timestamp.zero) gvas
            let minCreated, maxModified = Option.fold (fun (c, m) _ -> min time c, max time m) (minCreated, maxModified) lazyValue
            { value = merge (optCons gvs lazyValue); created = minCreated; modified = maxModified }, h'
        if Heap.contains ptr.location h then
            accessRec [(makeTrue metadata, ptr.location, Heap.find ptr.location h)] None h
        else
            let baseGav, restGavs = findSuitableLocations metadata h keyCompare contextList mapper ptr
            match baseGav with
            | None when read && restricted ->
                // TODO: undefined behaviour detected!
                __notImplemented__()
            | None ->
                let baseGuard = restGavs |> List.map (fst3 >> (!!)) |> conjunction metadata
                let lazyValue =
                    if read && isTopLevelHeapConcreteAddr ptr.fullyQualifiedLocation then Union metadata []
                    else lazyInstantiator |?? genericLazyInstantiator metadata groundHeap ptr.fullyQualifiedLocation ptr.typ |> eval
                let baseCell = { value = lazyValue; created = time; modified = time}
                let gavs = if read then restGavs else (baseGuard, ptr.location, baseCell)::restGavs
                let lv = if read then Some(baseGuard, lazyValue) else None
                let h = if read then h else h.Add(makeKey ptr.location <| Some ptr.fullyQualifiedLocation, baseCell)
                accessRec gavs lv h
            | Some(a, v) -> accessRec ((makeTrue metadata, a, v)::restGavs) None h

    and private accessTerm read metadata (groundHeap: 'a generalizedHeap option) guard (update : term -> timestamp -> term * timestamp) contextList lazyInstantiator ptrTime ptrFql path ({value = v; created = c; modified = m} as cell) =
        match path with
        | [] ->
            let newTerm, newModified = update v m
            { cell with value = newTerm; modified = newModified}, newTerm
        | location :: path' ->
            match v.term with
            | Error _ -> cell, v
            | Struct(fields, t) ->
                let fql' = addToFQL location ptrFql
                match location with
                | StructField(name, typ) ->
                    let instantiator = if read then lazyInstantiator else Some <| genericLazyInstantiator<'a> v.metadata groundHeap fql' typ
                    let ptr' = {location = name; fullyQualifiedLocation = fql'; typ = typ; time = ptrTime; path = path' }
                    let mapper (k, v) (ctx, s) = k, fillHoles ctx s v
                    let resultCell, newFields = accessHeap<'a, string> read false metadata groundHeap guard update fields c compareStringKey contextList mapper instantiator ptr'
                    resultCell, Struct v.metadata newFields t
                | _ -> __unreachable__()
            | Array(dimension, length, lower, constant, contents, lengths, arrTyp) ->
                let fql' = addToFQL location ptrFql
                let newHeap heap instor keyCompare ptr = accessHeap<'a, term> read false metadata groundHeap guard update heap c keyCompare contextList termKeyMapper (Some instor) ptr
                let makePtr key typ = {location = key; fullyQualifiedLocation = fql'; typ = typ; time = ptrTime; path = path' }
                let makeInstantiator key instantiator =
                    let realInstantiator, targetType = if read then lazyInstantiator, Some(path |> List.last |> typeOfPathSegment) else None, None
                    let doJob = lazy(Merging.guardedMap (fun c -> instantiator v.metadata realInstantiator targetType groundHeap m fql' key c ()) constant)
                    doJob.Force
                match location with
                | ArrayIndex(key, typ) ->
                    let instantiator = makeInstantiator key arrayElementLazyInstantiator
                    let resultCell, newContents = newHeap contents instantiator Arrays.equalsArrayIndices <| makePtr key typ
                    resultCell, Array v.metadata dimension length lower constant newContents lengths arrTyp
                | ArrayLength key ->
                    let instantiator = makeInstantiator key arrayLengthLazyInstantiator
                    let resultCell, newLengths = newHeap lengths instantiator fastNumericCompare <| makePtr key indexType
                    resultCell, Array v.metadata dimension length lower constant contents newLengths arrTyp
                | ArrayLowerBound key ->
                    let instantiator = makeInstantiator key arrayLowerBoundLazyInstantiator
                    let resultCell, newLower = newHeap lower instantiator fastNumericCompare <| makePtr key indexType
                    resultCell, Array v.metadata dimension length newLower constant contents lengths arrTyp
                | _ -> __unreachable__()
            | Union gvs ->
                let internalMerge gvs =
                    let gs, (cells, newVs) = mapsnd List.unzip <| List.unzip gvs
                    mergeCells <| List.zip gs cells, merge <| List.zip gs newVs
                let createCell v = { cell with value = v }
                commonGuardedMapk (Cps.ret <| accessTerm read metadata groundHeap guard update contextList lazyInstantiator ptrTime ptrFql path << createCell) gvs internalMerge id
            | t ->
                internalfailf "expected complex type, but got %O" t

    and private compareStringKey mtd loc key = makeBool (loc = key) mtd

    and private removeTypeVariable = function // TODO: temporary hack! Refactor this!
        | ArrayType(TypeVariable(Implicit(_, _, typ)), d) -> ArrayType(typ, d)
        | TypeVariable(Implicit(_, _, typ)) -> typ
        | typ -> typ

    and private changeType typ' = function
        | StructField(f, _) -> StructField(f, typ')
        | ArrayIndex(i, _) -> ArrayIndex(i, typ')
        | ArrayLowerBound _
        | ArrayLength _ as seg -> seg

    and private readTerm mtd (_ : bool) cell fql typ =
        let segment = snd fql |> List.last
        let typ = removeTypeVariable typ
        let path = [changeType typ segment]
        let lazyInstor = Some <| genericLazyInstantiator mtd None fql typ
        fst <| accessTerm true mtd None (makeTrue mtd) makePair [] lazyInstor Timestamp.infinity fql path cell

    and private commonHierarchicalStackAccess read update metadata state location path =
        let firstLocation = TopLevelStack location, []
        let time = frameTime state location
        let cell, _ = stackDeref time (fun () -> getValue <| stackLazyInstantiator state time location) state location
        let termLazyInstantiator = if read && not (List.isEmpty path) then genericLazyInstantiator metadata None (TopLevelStack location, path) (path |> List.last |> typeOfPathSegment) else __unreachable__
        let accessedCell, newBaseValue = accessTerm read metadata None (makeTrue metadata) update [] (Some termLazyInstantiator) time firstLocation path cell
        let newState = if read || cell.value = newBaseValue then state else writeStackLocation state location { cell with value = newBaseValue; modified = accessedCell.modified }
        accessedCell.value, newState

    and private termKeyMapper (k, v) (ctx, s) = fillHoles ctx s k, fillHoles ctx s v

    and private commonHierarchicalHeapAccess read restricted update metadata groundHeap heap contextList lazyInstantiator addr typ path time =
        let firstLocation = TopLevelHeap(addr, typ, typ), []
        let typ' = if List.isEmpty path then typ else path |> List.last |> typeOfPathSegment
        let readInstor = lazyInstantiator |?? selectLazyInstantiator<term> metadata groundHeap time.v (TopLevelHeap(addr, typ, typ'), path) typ'
        let lazyInstantiator = if read then Some readInstor else None
        let ptr = {location = addr; fullyQualifiedLocation = firstLocation; typ = typ; time = time.v; path = path}
        accessHeap<term, term> read restricted metadata groundHeap (makeTrue metadata) update heap Timestamp.zero fastNumericCompare contextList termKeyMapper lazyInstantiator ptr

    and readHeap metadata restricted heap key typ =
        let typ' = removeTypeVariable typ
        let lazyInst = if isConcrete key then Some <| fun () -> Union metadata [] else None
        fst <| commonHierarchicalHeapAccess true restricted makePair metadata None heap [] lazyInst key typ' [] {v = Timestamp.infinity}

    and private commonHierarchicalStaticsAccess read restricted update metadata groundHeap statics contextList lazyInstantiator typ path =
        let typ' = if List.isEmpty path then typ else path |> List.last |> typeOfPathSegment
        let readInstor = lazyInstantiator |?? selectLazyInstantiator<termType> metadata groundHeap Timestamp.infinity (TopLevelStatics typ, path) typ'
        let lazyInstantiator = if read then Some readInstor else None
        let ptr = {location = typ; fullyQualifiedLocation = TopLevelStatics typ, []; typ = typ; time = Timestamp.infinity; path = path}
        let mapper (k, v) (ctx, s) = substituteTypeVariables ctx s k, fillHoles ctx s v
        accessHeap<termType, termType> read restricted metadata groundHeap (makeTrue metadata) update statics Timestamp.zero Common.typesEqual contextList mapper lazyInstantiator ptr

    and readStatics metadata restricted statics key _ =
        fst <| commonHierarchicalStaticsAccess true restricted makePair metadata None statics [] None key []

    and mutateStack metadata state location path time value =
        snd <| commonHierarchicalStackAccess false (fun _ _ -> value, time) metadata state location path

    and private mutateHeap restricted metadata h loc typ path time value =
        snd <| commonHierarchicalHeapAccess false restricted (fun _  _ -> value, time) metadata None h [] None loc typ path {v=time}

    and private mutateStatics restricted metadata statics location _ path time value =
        snd <| commonHierarchicalStaticsAccess false restricted (fun _ _ -> value, time) metadata None statics [] None location path

    and private independent (exploredRecursiveIds : ImmutableHashSet<IFunctionIdentifier>) (exploredLocations : ImmutableHashSet<term>) read funcId location : bool =
        exploredLocations.Contains(location) ||
        let exploredRecursiveIds = exploredRecursiveIds.Add funcId
        match Database.querySummary funcId with
        | Some summary ->
            let t, _ = read exploredRecursiveIds summary.state
            match t.term with
            | Constant(_, LazyInstantiation(location', None, true), _) when location = location' -> true
            |_ -> false
        | None -> false

    and private accessGeneralizedHeapRec<'a when 'a : equality> (exploredIds : ImmutableHashSet<IFunctionIdentifier>) contextList lazyInstantiator read readHeap (getter : state -> 'a generalizedHeap) location accessDefined = function
        | Defined(r, h) ->
            let result, heap = accessDefined contextList lazyInstantiator None r h
            result, Defined r heap
        | Merged ghs ->
            let gs, hs = List.unzip ghs
            let rs, hs' = hs |> List.map (accessGeneralizedHeapRec exploredIds contextList lazyInstantiator read readHeap getter location accessDefined) |> List.unzip
            let grs = List.zip gs rs
            merge grs, mergeGeneralizedHeaps readHeap gs hs'
        | Mutation(h, h') as m ->
            let result, h'' = accessDefined contextList lazyInstantiator (Some h) false h'
            if read then
                let accessH = lazy(accessGeneralizedHeapRec exploredIds contextList lazyInstantiator read readHeap getter location accessDefined h |> fst)
                let simplifyInstantiated term =
                    match term.term with
                    | Constant(_, LazyInstantiation(loc, Some heap, _), _) when loc = location && heap = h ->
                        accessH.Force()
                    | _ -> term
                Substitution.substitute simplifyInstantiated id result, m
            else
                result, Mutation(h, h'')
        | Composition(_, _, Defined _) ->
            internalfail "composition with the defined heap should not be met, it must be simplified to a simple mutation!"
        | Composition(s, ctx, h) when read ->
            let lazyInstantiator' = lazy(accessGeneralizedHeapRec exploredIds contextList lazyInstantiator read readHeap getter location accessDefined (getter s) |> fst)
            accessGeneralizedHeapRec exploredIds ((ctx, s) :: contextList) (Some lazyInstantiator'.Force) read readHeap getter location accessDefined h
        | RecursiveApplication(f, _, _) as h
                when not <| exploredIds.Contains(f) && read &&
                     independent exploredIds ImmutableHashSet.Empty
                                 (fun ids s -> accessGeneralizedHeapRec ids contextList lazyInstantiator read readHeap getter location accessDefined (getter s)) f location ->
            let r, _ = accessDefined contextList lazyInstantiator None false Heap.empty
            r, h
        | RecursiveApplication _
        | HigherOrderApplication _ as h ->
            let r, e = accessDefined contextList lazyInstantiator (Some h) false Heap.empty
            r, if read then h else Mutation(h, e)
        | _ -> __unreachable__()

    and private accessGeneralizedHeap<'a when 'a : equality> = accessGeneralizedHeapRec<'a> ImmutableHashSet.Empty [] None

    and private hierarchicalAccess read actionNull updateDefined metadata state term =
        match term.term with
        | Error _ -> (term, state)
        | Ref(NullAddress, _) -> actionNull metadata state Null
        | Ref(TopLevelStack location, path) ->
            commonHierarchicalStackAccess read updateDefined metadata state location path
        | Ref(TopLevelHeap(addr, bT, _), path) ->
            Common.statedConditionalExecution state
                (fun state k -> k (Pointers.isZeroAddress metadata addr, state))
                (fun state k -> k (actionNull metadata state bT))
                (fun state k ->
                    let accessDefined contextList lazyInstantiator groundHeap r h = //TODO: get rid of time
                        mapfst getValue <| commonHierarchicalHeapAccess read r updateDefined metadata groundHeap h contextList lazyInstantiator addr bT path {v = Timestamp.zero}
                    let result, h' = accessGeneralizedHeap<term> read (readHeap metadata) heapOf term accessDefined (heapOf state)
                    k (result, withHeap state h'))
                merge merge2Terms id id
        | Ref(TopLevelStatics location, path) ->
            let accessDefined contextList lazyInstantiator groundHeap r h =
                mapfst getValue <| commonHierarchicalStaticsAccess read r updateDefined metadata groundHeap h contextList lazyInstantiator location path
            let result, m' = accessGeneralizedHeap read (readStatics metadata) staticsOf term accessDefined (staticsOf state)
            result, withStatics state m'
        | Union gvs -> guardedStateMap (hierarchicalAccess read actionNull updateDefined metadata) gvs state
        | Ptr(_, _, viewType, _) ->
            let ref = getReferenceFromPointer metadata term
            let term, state = hierarchicalAccess read actionNull updateDefined metadata state ref
            if typeOf term = viewType
            then term, state
            else __notImplemented__() // TODO: [columpio] [Reinterpretation]
        | t -> internalfailf "expected reference or pointer, but got %O" t

// ------------------------------- Composition -------------------------------

    and private fillHole (ctx : compositionContext) state term =
        match term.term with
        | Constant(_, source, _) ->
            match source with
            | :? IStatedSymbolicConstantSource as source -> source.Compose ctx state
            | :? INonComposableSymbolicConstantSource -> term
            | _ -> __notImplemented__()
        | Concrete(:? concreteHeapAddress as addr', t) ->
            Concrete ctx.mtd (composeAddresses ctx.addr addr') t
        | Pointers.SymbolicThisOnStack(token, path) ->
            let id = ("this", token)
            let reference = referenceLocalVariable term.metadata state id false |> deref term.metadata state |> fst
            referenceSubLocations path reference
        | _ -> term

    and fillHoles ctx state term =
        Substitution.substitute (fillHole ctx state) (substituteTypeVariables ctx state) term

    and fillHolesInHeap fillHolesInKey ctx state heap =
        Heap.map (fun k cell -> (fillHolesInKey ctx state k, {cell with value = fillHoles ctx state cell.value})) heap

    and fillHolesInPathSegment ctx source = function
        | StructField(addr, typ) -> StructField(addr, substituteTypeVariables ctx source typ)
        | ArrayIndex(addr, typ) -> ArrayIndex(fillHoles ctx source addr, substituteTypeVariables ctx source typ)
        | ArrayLowerBound addr -> ArrayLowerBound(fillHoles ctx source addr)
        | ArrayLength addr -> ArrayLength(fillHoles ctx source addr)

    and private fillAndMutateStack (ctx : compositionContext) source target addr _ path cell =
        let time = Timestamp.compose ctx.time cell.modified
        let path = List.map (fillHolesInPathSegment ctx source) path
        let v = fillHoles ctx source cell.value
        mutateStack ctx.mtd target addr path time v

    and private fillAndMutateCommon<'a when 'a : equality> mutateHeap (fillKey : compositionContext -> state -> 'a -> 'a) (ctx : compositionContext) restricted source (target : heap<'a, term, fql>) addr typ path cell : heap<'a, term, fql> =
        let time = Timestamp.compose ctx.time cell.modified
        let addr = fillKey ctx source addr
        let path = List.map (fillHolesInPathSegment ctx source) path
        let v = fillHoles ctx source cell.value
        mutateHeap restricted ctx.mtd target addr typ path time v

    and private composeDefinedHeaps writer restricted s h h' =
        foldHeapLocations (writer restricted s) h h'

    and private composeGeneralizedHeaps<'key when 'key : equality> writer fillHolesInKey readHeap (ctx : compositionContext) getter setter s (h' : 'key generalizedHeap) =
        match getter s, h' with
        | Defined(r, h), Defined(r', h') ->
            assert(not r')
            composeDefinedHeaps (writer fillHolesInKey ctx) r s h h' |> Defined r
        | Merged ghs, _ ->
            let gs, hs = List.unzip ghs
            hs |> List.map (fun h -> composeGeneralizedHeaps writer fillHolesInKey readHeap ctx getter setter (setter s h) h') |> mergeGeneralizedHeaps (readHeap ctx.mtd) gs
        | _, Merged ghs' ->
            let gs, hs' = List.unzip ghs'
            let gs' = List.map (fillHoles ctx s) gs
            hs' |> List.map (composeGeneralizedHeaps writer fillHolesInKey readHeap ctx getter setter s) |> mergeGeneralizedHeaps (readHeap ctx.mtd) gs'
        | Defined _, Composition(s', ctx', h')
        | Mutation _, Composition(s', ctx', h')
        | Composition _, Composition(s', ctx', h') ->
            let s = composeStates ctx s s'
            composeGeneralizedHeaps writer fillHolesInKey readHeap ctx' getter setter s h'
        | Defined _, Mutation(h', h'')
        | RecursiveApplication _, Mutation(h', h'')
        | HigherOrderApplication _, Mutation(h', h'')
        | Composition _, Mutation(h', h'')
        | Mutation _, Mutation(h', h'') ->
            let res = composeGeneralizedHeaps writer fillHolesInKey readHeap ctx getter setter s h'
            let res' = fillHolesInHeap fillHolesInKey ctx s h''
            Mutation(res, res')
        | Defined _, HigherOrderApplication _
        | Defined _, RecursiveApplication _
        | Composition _, HigherOrderApplication _
        | Composition _, RecursiveApplication _
        | RecursiveApplication _, RecursiveApplication _
        | HigherOrderApplication _, HigherOrderApplication _ ->
            Composition(s, ctx, h')
        | Composition(s', ctx', h') as h, Defined(r'', h'') ->
            assert(not r'')
            match h' with
            | Defined(r, h') ->
                let ctx'' = decomposeContexts ctx ctx'
                let h = composeDefinedHeaps (writer fillHolesInKey ctx'') r s h' h'' |> Defined r
                composeGeneralizedHeaps writer fillHolesInKey readHeap ctx' getter setter s' h
            | _ ->
                let h'' = fillHolesInHeap fillHolesInKey ctx s h''
                Mutation(h, h'')
        | (HigherOrderApplication _ as h), Defined(r, h')
        | (RecursiveApplication _ as h), Defined(r, h') ->
            assert(not r)
            let h' = fillHolesInHeap fillHolesInKey ctx s h'
            Mutation(h, h')
        | Mutation(h, h'), Defined(r, h'') ->
            // TODO: this is probably wrong!
            assert(not r)
            Mutation(h, composeDefinedHeaps (writer fillHolesInKey ctx) false s h' h'')
        | RecursiveApplication _, Composition _ -> __notImplemented__()
        | HigherOrderApplication _, Composition _ -> __notImplemented__()
        | RecursiveApplication _, HigherOrderApplication _ -> __notImplemented__()
        | HigherOrderApplication _, RecursiveApplication _ -> __notImplemented__()
        | Mutation _, RecursiveApplication _ -> __notImplemented__()
        | Mutation _, HigherOrderApplication _ -> __notImplemented__()

    and composeStacksOf ctx state state' =
        (foldStackLocations (fillAndMutateStack ctx state) state state'.stack).stack

    and composeHeapsOf ctx state heap =
        composeGeneralizedHeaps (fillAndMutateCommon mutateHeap) fillHoles readHeap ctx heapOf withHeap state heap

    and composeStaticsOf ctx state statics =
        composeGeneralizedHeaps (fillAndMutateCommon mutateStatics) substituteTypeVariables readStatics ctx staticsOf withStatics state statics

    and composeStates ctx state state' =
        let stack = composeStacksOf ctx state state'
        let heap = composeHeapsOf ctx state state'.heap
        let statics = composeStaticsOf ctx state state'.statics
        assert(state'.typeVariables |> snd |> Stack.isEmpty)
        { stack = stack; heap = heap; statics = statics; frames = state.frames; pc = state.pc; typeVariables = state.typeVariables }

// ------------------------------- High-level read/write -------------------------------

    and deref metadata state location =
        hierarchicalAccess true npeTerm makePair metadata state location

    and derefWith actionNull metadata state location = hierarchicalAccess true actionNull makePair metadata state location

    and mutate metadata state reference value =
        assert(value <> Nop)
        let time = tick()
        hierarchicalAccess false npeTerm (fun _ _ -> (value, time)) metadata state reference

// ------------------------------- Referencing -------------------------------

    and private referenceTerm name followHeapRefs term =
        match term.term with
        | Ref _ when followHeapRefs -> term
        | Union gvs -> guardedMap (referenceTerm name followHeapRefs) gvs
        | _ -> StackRef term.metadata name []

    and referenceLocalVariable metadata state location followHeapRefs =
        let reference = StackRef metadata location []
        let term, _ = deref metadata state reference
        referenceTerm location followHeapRefs term

    let rec private referenceFieldOf state field parentRef reference =
        match reference.term with
        | Error _ -> reference, state
        | Ref(TopLevelHeap(addr, bT, sT), path) ->
            assert(List.isEmpty path)
            HeapRef reference.metadata addr bT sT [field], state
        | Null ->
            let term, state = State.createInstance reference.metadata typeof<System.NullReferenceException> [] state
            Error reference.metadata term, state
        | Struct _ -> referenceSubLocations [field] parentRef, state
        | Union gvs -> guardedStateMap (fun state term -> referenceFieldOf state field parentRef term) gvs state
        | t -> internalfailf "expected reference or struct, but got %O" t, state

    let rec private followOrReturnReference metadata state reference =
        let term, state = deref metadata state reference
        match term.term with
        | Error _
        | Ref _
        | Ptr _ -> term, state
        | Union gvs when List.forall (fun (_, t) -> isError t || isRefOrPtr t) gvs ->
            guardedStateMap (followOrReturnReference metadata) gvs state
        | _ -> reference, state

    let referenceField metadata state followHeapRefs name typ parentRef =
        let typ = Types.wrapReferenceType typ
        let term, state = deref metadata state parentRef
        let reference, newState = referenceFieldOf state (StructField(name, typ)) parentRef term
        if followHeapRefs then followOrReturnReference metadata newState reference
        else (reference, newState)

    let referenceStaticField metadata state followHeapRefs fieldName fieldType targetType =
        let fieldType = Types.wrapReferenceType fieldType
        let reference = StaticRef metadata targetType [StructField(fieldName, fieldType)]
        if followHeapRefs then followOrReturnReference metadata state reference
        else (reference, state)

    let private checkIndices mtd state arrayRef (indices : term list) k =
        let intToTerm i = makeNumber i mtd
        let idOfDimensionsForLowerBounds = Seq.init indices.Length (intToTerm >> referenceArrayLowerBound arrayRef)
        let idOfDimensionsForLengths = Seq.init indices.Length (intToTerm >> referenceArrayLength arrayRef)
        Cps.Seq.mapFold (deref mtd) state idOfDimensionsForLowerBounds (fun (lowerBoundsList, state') ->
        Cps.Seq.mapFold (deref mtd) state' idOfDimensionsForLengths (fun (lengthsList, state'') ->
        let bounds =
            Seq.map3
                (fun idx low len ->
                    let up = add mtd low len
                    Arithmetics.simplifyGreaterOrEqual mtd idx low (fun bigEnough ->
                    Arithmetics.simplifyLess mtd idx up (fun smallEnough ->
                    bigEnough &&& smallEnough)))
                indices lowerBoundsList lengthsList
            |> List.ofSeq
        k (conjunction mtd bounds |> unguard |> merge , state'')))

    let referenceArrayIndex metadata state arrayRef (indices : term list) =
        let array, state = deref metadata state arrayRef
        // TODO: what about followHeapRefs?
        let rec reference state term =
            match term.term with
            | Error _ -> (term, state)
            | Array(_, _, _, _, _, _, ArrayType(elementType, _)) ->
                Common.statedConditionalExecution state
                    (fun state k -> checkIndices metadata state arrayRef indices k)
                    (fun state k ->
                        let location = Arrays.makeIndexArray metadata (fun i -> indices.[i]) indices.Length
                        let result = referenceSubLocations [ArrayIndex(location, elementType)] arrayRef
                        k (result, state))
                    (fun state k ->
                        let exn, state = State.createInstance metadata typeof<System.IndexOutOfRangeException> [] state
                        k (Error metadata exn, state))
                    merge merge2Terms id id
            | Union gvs -> guardedStateMap reference gvs state
            | t -> internalfailf "accessing index of non-array term %O" t
        reference state array

    let () =
        State.readHeap <- readHeap
        State.readStatics <- readStatics
        State.readTerm <- readTerm

// ------------------------------- Allocation -------------------------------

    let newStackFrame state metadata funcId frame = State.newStackFrame (tick()) metadata state funcId frame
    let newScope metadata state frame = State.newScope (tick()) metadata state frame

    let freshHeapLocation metadata =
        Concrete metadata ([freshAddress()]) pointerType

    let allocateOnStack metadata s key term =
        let time = tick()
        let { func = frameMetadata; entries = oldFrame; time = frameTime } = Stack.peek s.frames.f
        let newStack = pushToCurrentStackFrame s key { value = term; created = time; modified = time }
        let newEntries = { key = key; mtd = metadata; typ = typeOf term }
        let stackFrames = Stack.updateHead s.frames.f { func = frameMetadata; entries = newEntries :: oldFrame; time = frameTime }
        { s with stack = newStack; frames = { s.frames with f = stackFrames } }

    let private allocateInDefinedHeap (h : heap<'a, term, fql>) heapKey term time =
        Heap.add heapKey { value = term; created = time; modified = time } h

    let rec private allocateInGeneralizedHeap readHeap heapKey term time = function
        | Defined(r, h) -> allocateInDefinedHeap h heapKey term time |> Defined r
        | Composition _
        | RecursiveApplication _
        | HigherOrderApplication _ as h ->
            let mutatedHeap = allocateInDefinedHeap Heap.empty heapKey term time
            Mutation(h, mutatedHeap)
        | Mutation(gh, h) -> Mutation(gh, allocateInDefinedHeap h heapKey term time )
        | Merged gvh ->
            commonGuardedMapk (fun h k -> k <| allocateInGeneralizedHeap readHeap heapKey term time h) gvh
                (fun gvh ->
                    let g, h = List.unzip gvh
                    mergeGeneralizedHeaps readHeap g h) id

    let allocateInHeap metadata s address term : term * state =
        let time = tick()
        let typ = typeOf term
        let ref = HeapRef metadata address typ typ []
        let heapKey = makeKey address <| makeTopLevelFQL TopLevelHeap (address, typ, typ)
        (ref, { s with heap = allocateInGeneralizedHeap (readHeap metadata) heapKey term time s.heap } )

    let allocateInStaticMemory metadata (s : state) address term =
        let time = tick()
        let heapKey = makeTopLevelKey TopLevelStatics address
        { s with statics = allocateInGeneralizedHeap (readStatics metadata) heapKey term time s.statics }

    let makeSymbolicThis metadata state token typ =
        let isRef = isReferenceType typ
        let thisKey = ((if isRef then "this" else Pointers.symbolicThisStackKey), token)
        let thisStackRef = StackRef metadata thisKey []
        let source = {location = thisStackRef; heap = None; extractor = IdTermExtractor(); typeExtractor = IdTypeExtractor()}
        let instance = makeSymbolicInstance metadata source source "this" None (wrapReferenceType typ)
        if isRef
            then instance, state, false
            else
                let key = (Pointers.symbolicThisStackKey, token)
                let state = newStackFrame state metadata (EmptyIdentifier()) [(key, Specified instance, typ)]
                referenceLocalVariable metadata state key true, state, true

// ------------------------------- Static Memory Initialization -------------------------------

    [<StructuralEquality;NoComparison>]
    type internal keyInitializedSource<'a when 'a : equality> =
        {heap : 'a generalizedHeap; key : 'a; getter : (state -> 'a generalizedHeap) transparent; fillHolesInKey : (compositionContext -> state -> 'a -> 'a) transparent }
        interface IStatedSymbolicConstantSource with
            override x.SubTerms = seq []

    let mutable counter = 0
    let private mkKeyGuard mtd fillHolesInKey getter heap (key : 'a) =
        Constant mtd (IdGenerator.startingWith "hasKey#") ({ heap = heap; key = key; getter = {v=getter}; fillHolesInKey = {v=fillHolesInKey} } : 'a keyInitializedSource) Bool

    let private guardOfDefinedHeap mtd fillHolesInKey getter key r (h : heap<'key, term, fql>) =
        if Heap.contains key h then Merging.guardOf h.[key].value
        elif r then False
        else mkKeyGuard mtd fillHolesInKey getter (Defined r h) key

    let rec private guardOfHeap (exploredRecursiveIds : ImmutableHashSet<IFunctionIdentifier>) mtd fillHolesInKey getter key = function
        | Defined(r, h) -> guardOfDefinedHeap mtd fillHolesInKey getter key r h
        | Merged ghs -> guardedMap (guardOfHeap exploredRecursiveIds mtd fillHolesInKey getter key) ghs
        | Mutation(h, h') ->
            guardOfHeap exploredRecursiveIds mtd fillHolesInKey getter key h ||| guardOfDefinedHeap mtd fillHolesInKey getter key false h'
        | Composition(s, ctx, h) ->
            guardOfHeap exploredRecursiveIds mtd fillHolesInKey getter key (getter s) ||| guardOfHeap exploredRecursiveIds mtd fillHolesInKey getter (fillHolesInKey ctx s key) h
        | RecursiveApplication(f, _, _) when exploredRecursiveIds.Contains f -> False
        | RecursiveApplication(f, _, _) ->
            match Database.querySummary f with
            | Some summary ->
                guardOfHeap (exploredRecursiveIds.Add f) mtd fillHolesInKey getter key <| getter summary.state
            | None -> True
        | HigherOrderApplication _ as h ->
            mkKeyGuard mtd fillHolesInKey getter h key

    let private keyInitialized mtd key fillHolesInKey getter heap =
        guardOfHeap ImmutableHashSet<IFunctionIdentifier>.Empty mtd fillHolesInKey getter key heap

    let internal termTypeInitialized mtd termType state =
        keyInitialized mtd termType substituteTypeVariables staticsOf state.statics

    let internal termLocInitialized mtd loc state =
        keyInitialized mtd loc fillHoles heapOf state.heap

// ------------------------------- Compositions of constants -------------------------------

    type lazyInstantiation<'a when 'a : equality> with
        interface IExtractingSymbolicConstantSource with
            override x.Compose ctx state =
                let state' =
                    match x.heap with
                    | Some heap ->
                        // TODO: make it more effective (use lower-level functions to access heap directly instead of creating fresh state)
                        match x.location.term with // TODO: get rid of box someday
                        | Ref(TopLevelHeap _, _) -> { State.empty with heap = composeHeapsOf ctx state (box heap :?> term generalizedHeap) }
                        | Ref(TopLevelStatics _, _) -> { State.empty with statics = composeStaticsOf ctx state (box heap :?> termType generalizedHeap) }
                        | _ -> __notImplemented__()
                    | None -> state
                let loc = fillHoles ctx state x.location
                deref ctx.mtd state' loc |> fst |> x.extractor.Extract

    type keyInitializedSource<'a when 'a : equality> with
        interface IStatedSymbolicConstantSource with
            override x.Compose ctx state =
                keyInitialized ctx.mtd x.key x.fillHolesInKey.v x.getter.v (x.getter.v state)
