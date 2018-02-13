﻿namespace VSharp

open VSharp.State
open Types
open Types.Constructor
open MemoryCell

module internal Memory =

// ------------------------------- Primitives -------------------------------

    let private pointer = ref 0
    let internal ZeroTime = State.zeroTime
    let private infiniteTime : Timestamp = System.UInt32.MaxValue
    let private timestamp = ref ZeroTime
    let private freshAddress () =
        pointer := !pointer + 1
        !pointer
    let internal tick () =
        timestamp := !timestamp + 1u
        !timestamp
    let public reset () =
        pointer := 0
        timestamp := ZeroTime

    type private LazyInstantiation(location : Term, isTopLevelHeapAddress : bool) =
        inherit SymbolicConstantSource()
        member x.Location = location
        member x.IsTopLevelHeapAddress = isTopLevelHeapAddress

    // Marks concrete numeric term as heap address in its metadata
    type private AddressMarker() = class end

    type private ArrayElementLazyInstantiation(location : Term, isTopLevelHeapAddress : bool, array : Term, index : Term) =
        inherit LazyInstantiation(location, isTopLevelHeapAddress)

    type private ArrayLengthLazyInstantiation(location : Term, isTopLevelHeapAddress : bool, array : Term, dim : Term) =
        inherit LazyInstantiation(location, isTopLevelHeapAddress)

    type private ArrayLowerBoundLazyInstantiation(location : Term, isTopLevelHeapAddress : bool, array : Term, dim : Term) =
        inherit LazyInstantiation(location, isTopLevelHeapAddress)

    let private isStaticLocation = function
        | StaticRef _ -> true
        | _ -> false

    let rec internal defaultOf time metadata = function
        | Bool -> MakeFalse metadata
        | Numeric t when t.IsEnum -> CastConcrete (System.Activator.CreateInstance(t)) t metadata
        | Numeric t -> CastConcrete 0 t metadata
        | StringType -> Terms.MakeNullRef stringType metadata
        | Reference t -> Terms.MakeNullRef t metadata
        | ClassType _ as t ->Terms.MakeNullRef t metadata
        | ArrayType _ as t -> Terms.MakeNullRef t metadata
        | SubType(dotNetType, _, _,  _) as t when dotNetType.IsValueType -> Struct Heap.empty t metadata
        | SubType _ as t -> Terms.MakeNullRef t metadata
        | Func _ -> Terms.MakeNullRef (FromGlobalSymbolicDotNetType typedefof<System.Delegate>) metadata
        | StructType(dotNetType, _, _) as t ->
            let fields = Types.GetFieldsOf dotNetType false
            let contents = Seq.map (fun (k, v) -> (Terms.MakeConcreteString k metadata, { value = defaultOf time metadata v; created = time; modified = time })) (Map.toSeq fields) |> Heap.ofSeq
            Struct contents t metadata
        | _ -> __notImplemented__()

    let internal mkDefault metadata typ =
        defaultOf (tick()) metadata typ

    let internal mkDefaultStatic metadata qualifiedTypeName =
        let t = qualifiedTypeName |> System.Type.GetType |> FromConcreteDotNetType
        let time = tick()
        let fields = DecompilerServices.getDefaultFieldValuesOf true false qualifiedTypeName
        let contents =
            fields
                |> List.map (fun (n, (t, _)) ->
                                let key = Terms.MakeConcreteString n metadata
                                let value = mkDefault metadata (FromConcreteMetadataType t)
                                (key, { value = value; created = time; modified = time }))
                |> Heap.ofSeq
        fields, t, Struct contents t metadata

    let internal makeSymbolicInstance metadata time source name = function
        | Reference t ->
            let source' =
                match source :> SymbolicConstantSource with
                | :? LazyInstantiation as li -> LazyInstantiation(li.Location, true) :> SymbolicConstantSource
                | _ -> source
            let constant = Constant name source' pointerType metadata
            HeapRef ((constant, t), []) time metadata
        | t when Types.IsPrimitive t || Types.IsFunction t -> Constant name source t metadata
        | ArrayType(e, d) as t -> Arrays.makeSymbolic metadata source d e t name
        | StringType ->
            let e, d = Numeric typedefof<char>, ConcreteDimension 1
            let array = Arrays.makeSymbolic metadata source d e (ArrayType (e, d)) <| IdGenerator.startingWith("m_FirstChar")
            let length = Constant (IdGenerator.startingWith("m_StringLength")) source (Numeric typedefof<int>) metadata
            let fields = Heap.ofSeq (seq [ MakeStringKey "System.String.m_StringLength", { value = length; created = time; modified = time };
                                           MakeStringKey "System.String.m_FirstChar", { value = array; created = time; modified = time } ])
            Struct fields stringType metadata
        | StructType _
        | SubType _
        | ClassType _ as t -> Struct Heap.empty t metadata
        | _ -> __notImplemented__()

    let internal genericLazyInstantiator =
        let instantiator metadata time fullyQualifiedLocation typ () =
            makeSymbolicInstance metadata time (LazyInstantiation(fullyQualifiedLocation, false)) (nameOfLocation fullyQualifiedLocation) typ
        State.genericLazyInstantiator <- instantiator
        instantiator

    let rec private referenceSubLocation location term =
        match term.term with
        | Error _ -> term
        | StackRef(var, path, None) -> StackRef var (List.append path [location]) term.metadata
        | StaticRef(var, path, None) -> StaticRef var (List.append path [location]) term.metadata
        | HeapRef((addr, path), t, None) -> HeapRef (addr, List.append path [location]) t term.metadata
        | Terms.GuardedValues(gs, vs) -> vs |> List.map (referenceSubLocation location) |> List.zip gs |> Union term.metadata
        | _ -> internalfailf "expected reference, but got %O" term

// ------------------------------- Comparison -------------------------------

    let npe mtd state = State.activator.CreateInstance mtd typeof<System.NullReferenceException> [] state

    let private canPoint mtd pointerAddr pointerType pointerTime locationAddr locationValue locationTime =
        // TODO: what if locationType is Null?
        if locationTime > pointerTime then Terms.MakeFalse mtd
        else
            let addrEqual = Pointers.locationEqual Operators.simplifyArraysEquality mtd locationAddr pointerAddr
            let typeSuits v =
                let locationType = TypeOf v
                Common.is mtd locationType pointerType &&& Common.is mtd pointerType locationType
            let typeEqual =
                match locationValue.term with
                | Union gvs ->
                    gvs |> List.map (fun (g, v) -> (g, typeSuits v)) |> Merging.merge
                | _ -> typeSuits locationValue
            addrEqual &&& typeEqual

// ------------------------------- Dereferencing/mutation -------------------------------

    let private stackDeref time instantiateLazy state location =
        if isAllocatedOnStack state location then
            (readStackLocation state location, state)
        else
            let lazyInstance = {value = instantiateLazy(); created = time; modified = time }
            (lazyInstance, writeStackLocation state location lazyInstance)

    let private findSuitableLocations mtd h ptr ptrType ptrTime =
        let filterMapKey (k, cell) =
            let guard = canPoint mtd ptr ptrType ptrTime k cell.value cell.created
            match guard with
            | False -> None
            | _ -> Some(guard, k, cell)
        let gvs = h |> Heap.toSeq |> List.ofSeq |> List.filterMap filterMapKey
        let baseGvs, restGvs = gvs |> List.partition (fst3 >> IsTrue)
        assert(List.length baseGvs <= 1)
        List.tryHead baseGvs, restGvs

    let rec internal heapDeref metadata time instantiateLazy h ptr ptrType ptrTime =
        let exists = Heap.contains ptr h
        if IsConcrete ptr && exists then
            [(MakeTrue metadata, ptr, Heap.find ptr h)], h
        else
            let baseGav, restGavs = findSuitableLocations metadata h ptr ptrType ptrTime
            let baseGuard = restGavs |> List.map (fst3 >> (!!)) |> conjunction metadata
            let baseAddr, baseValue, h' =
                match baseGav with
                | None ->
                    let baseCell, h' = instantiateLazy()
                    ptr, baseCell, h'
                | Some(_, a, v) -> a, v, h
            (baseGuard, baseAddr, baseValue)::restGavs, h'

    let private mutateHeap metadata time guard h addr newValue =
        assert(Heap.contains addr h)
        let oldCell = Heap.find addr h
        let cell = Merging.merge2Cells guard !!guard { oldCell with value = newValue; modified = time } oldCell
        Heap.add addr cell h

    let private structLazyInstantiator metadata fullyQualifiedLocation field fieldType () =
        makeSymbolicInstance metadata ZeroTime (LazyInstantiation(fullyQualifiedLocation, false)) (toString field) fieldType

    let private arrayElementLazyInstantiator metadata time location (idx: Term) = function
        | DefaultInstantiator(_, concreteType) -> fun () -> defaultOf time metadata concreteType
        | LazyInstantiator(array, concreteType) -> fun () ->
            let id = sprintf "%s[%s]" (toString array) (idx.term.IndicesToString()) |> IdGenerator.startingWith
            makeSymbolicInstance metadata time (ArrayElementLazyInstantiation(location, false, array, idx)) id concreteType

    let private arrayLowerBoundLazyInstantiator metadata time location idx = function
        | DefaultInstantiator(_, concreteType) -> fun () -> defaultOf time metadata Arrays.lengthTermType
        | LazyInstantiator(array, _) -> fun () ->
            match Options.SymbolicArrayLowerBoundStrategy() with
            | Options.AlwaysZero -> defaultOf time metadata Arrays.lengthTermType
            | Options.AlwaysSymbolic ->
                let id = sprintf "%s.GetLowerBound(%s)" (toString array) (toString idx)
                makeSymbolicInstance metadata time (ArrayLowerBoundLazyInstantiation (location, false, array, idx)) id Arrays.lengthTermType

    let private arrayLengthLazyInstantiator metadata time location idx = function
        | DefaultInstantiator (_, concreteType) -> fun () -> MakeNumber 1 metadata
        | LazyInstantiator(array, _) -> fun () ->
            let id = sprintf "%s.GetLength(%s)" (toString array) (toString idx)
            makeSymbolicInstance metadata time (ArrayLengthLazyInstantiation(location, false, array, idx)) id Arrays.lengthTermType

    let private staticMemoryLazyInstantiator metadata t location () =
        Struct Heap.empty (FromConcreteDotNetType t) metadata

    let rec private accessTerm metadata guard update created modified ptrTime ctx path term =
        match path with
        | [] ->
            let newTerm, newTime = update term modified
            newTerm, newTerm, newTime
        | ((key, typ) as location)::path' ->
            match term.term with
            | Error _ -> term, term, modified
            | Struct(fields, t) ->
                let ctx' = referenceSubLocation location ctx
                let instantiator = structLazyInstantiator term.metadata ctx' key typ
                let result, newFields, newTime =
                    accessHeap metadata guard update fields created (fun loc -> referenceSubLocation (loc, typ) ctx) instantiator key typ ptrTime path'
                result, Struct newFields t term.metadata, newTime
            | Array(dimension, length, lower, constant, contents, lengths, arrTyp) ->
                let ctx' = referenceSubLocation location ctx
                let makeInstantiator key instantiator = always <| Merging.guardedMap (fun c -> instantiator term.metadata modified ctx' key c ()) constant
                let newHeap heap key instantiator = accessHeap metadata guard update heap created (fun loc -> referenceSubLocation (loc, typ) ctx) instantiator key typ ptrTime path'
                match key with
                | _ when key.metadata.misc.Contains Arrays.ArrayIndicesType.LowerBounds ->
                    let instantiator = makeInstantiator key arrayLowerBoundLazyInstantiator
                    let result, newLower, newTime = newHeap lower key instantiator
                    result, Array dimension length newLower constant contents lengths arrTyp term.metadata, newTime
                | _ when key.metadata.misc.Contains Arrays.ArrayIndicesType.Lengths ->
                    let instantiator = makeInstantiator key arrayLengthLazyInstantiator
                    let result, newLengths, newTime = newHeap lengths key instantiator
                    result, Array dimension length lower constant contents newLengths arrTyp term.metadata, newTime
                | _ when key.metadata.misc.Contains Arrays.ArrayIndicesType.Contents ->
                    let instantiator = makeInstantiator key arrayElementLazyInstantiator
                    let result, newContents, newTime = newHeap contents key instantiator
                    result, Array dimension length lower constant newContents lengths arrTyp term.metadata, newTime
                | _ -> __notImplemented__()
            | Union gvs ->
                internalfail "unexpected union of complex types! Probably merge function implemented incorrectly."
            | t ->
                internalfailf "expected complex type, but got %O" t

    and private accessHeap metadata guard update h time mkCtx lazyInstantiator ptr ptrType ptrTime path =
        let cell = { value = lazyInstantiator(); created = time; modified = time }
        let lazyInstantiator = fun () -> cell, h.Add(ptr, cell)
        let gvas, h = heapDeref metadata time lazyInstantiator h ptr ptrType ptrTime
        let gvs, (h', newTime) = gvas |> ((h, ZeroTime) |> List.mapFold (fun (h, maxTime) (guard', addr, cell) ->
            let ctx = mkCtx addr
            let guard'' = guard &&& guard'
            let accessedValue, newBaseValue, newTime = accessTerm metadata guard update cell.created cell.modified ptrTime ctx path cell.value
            let h' = if cell.value = newBaseValue then h else mutateHeap metadata newTime guard'' h addr newBaseValue
            ((guard, accessedValue), (h', max maxTime newTime))))
        (Merging.merge gvs, h', newTime)

    let rec private commonHierarchicalAccess actionNull update metadata state term =
        match term.term with
        | Error _ -> (term, state)
        | StackRef(location, path, None) ->
            let firstLocation = StackRef location [] term.metadata
            let time = frameTime state location
            let cell, h' = stackDeref time (fun () -> (stackLazyInstantiator state time location).value) state location
            let accessedValue, newBaseValue, newTime = accessTerm metadata (Terms.MakeTrue metadata) update cell.created cell.modified time firstLocation path cell.value
            let newState = if cell.value = newBaseValue then state else writeStackLocation state location { cell with value = newBaseValue; modified = newTime }
            accessedValue, newState
        | StaticRef(location, path, None) ->
            let firstLocation = Terms.term >> function
                | Concrete(location, StringType) -> StaticRef (location :?> string) [] term.metadata
                | _ -> __notImplemented__()
            let addr = Terms.MakeStringKey location
            let dnt = System.Type.GetType(location)
            let t = FromConcreteDotNetType dnt
            let result, m', _ = accessHeap metadata (Terms.MakeTrue metadata) update (staticsOf state) ZeroTime firstLocation (staticMemoryLazyInstantiator Metadata.empty dnt location) addr t infiniteTime path
            result, withStatics state m'
        | HeapRef(((addr, t) as location, path), time, None) ->
            let mkFirstLocation location = HeapRef ((location, t), []) time term.metadata
            let firstLocation = HeapRef (location, []) time term.metadata
            Common.statedConditionalExecution state
                (fun state k -> k (Arithmetics.simplifyEqual metadata addr (Concrete 0 pointerType metadata) id, state))
                (fun state k -> k (actionNull metadata state t))
                (fun state k ->
                    let result, h', _ = accessHeap metadata (Terms.MakeTrue metadata) update (heapOf state) ZeroTime mkFirstLocation (genericLazyInstantiator Metadata.empty time firstLocation t) addr t time path
                    k (result, withHeap state h'))
                Merging.merge Merging.merge2Terms id id
        | Union gvs -> Merging.guardedStateMap (commonHierarchicalAccess actionNull update metadata) gvs state
        | t -> internalfailf "expected reference, but got %O" t

    let internal hierarchicalAccess = commonHierarchicalAccess (fun m s _ ->
        let res, state = npe m s
        Error res m, state)

    let internal deref = hierarchicalAccess makePair

    let internal derefWith actionNull = commonHierarchicalAccess actionNull makePair

//    let internal fieldOf term name = termDeref [Terms.MakeConcreteString name] term

    let internal mutate metadata state reference value =
        assert(value <> Nop)
        let time = tick()
        hierarchicalAccess (fun _ _ -> (value, time)) metadata state reference

// ------------------------------- Referencing -------------------------------

    let rec private referenceTerm state name followHeapRefs term =
        match term.term with
        | Error _
        | StackRef _
        | StaticRef _
        | HeapRef _ when followHeapRefs -> term
        | Union gvs -> Merging.guardedMap (referenceTerm state name followHeapRefs) gvs
        | _ -> StackRef name [] term.metadata

    let internal referenceLocalVariable metadata state location followHeapRefs =
        let reference = StackRef location [] metadata
        let term, state = deref metadata state reference
        referenceTerm state location followHeapRefs term

    let rec private referenceFieldOf state field parentRef reference =
        match reference with
        | ErrorT _ -> reference, state
        | { term = HeapRef((addr, path), t, None) } ->
            assert(List.isEmpty path) // TODO: will this really be always empty?
            HeapRef (addr, [field]) t reference.metadata, state
        | Null ->
            let term, state = State.activator.CreateInstance reference.metadata typeof<System.NullReferenceException> [] state
            Error term reference.metadata, state
        | { term = Struct _ } -> referenceSubLocation field parentRef, state
        | UnionT gvs -> Merging.guardedStateMap (fun state term -> referenceFieldOf state field parentRef term) gvs state
        | t -> internalfailf "expected reference or struct, but got %O" t, state

    let rec private followOrReturnReference metadata state reference =
        let term, state = deref metadata state reference
        match term.term with
        | Error _
        | StackRef _
        | StaticRef _
        | HeapRef _ -> term, state
        | Union gvs when List.forall (fun (_, t) -> IsError t || IsRef t) gvs ->
            Merging.guardedStateMap (followOrReturnReference metadata) gvs state
        | _ -> reference, state

    let internal referenceField metadata state followHeapRefs name typ parentRef =
        let typ = Types.WrapReferenceType typ
        let term, state = deref metadata state parentRef
        let reference, newState = referenceFieldOf state (Terms.MakeStringKey name, typ) parentRef term
        if followHeapRefs then followOrReturnReference metadata newState reference
        else (reference, newState)

    let internal referenceStaticField metadata state followHeapRefs fieldName typ typeName =
        let typ = Types.WrapReferenceType typ
        let reference = StaticRef typeName [(Terms.MakeStringKey fieldName, typ)] metadata
        if followHeapRefs then followOrReturnReference metadata state reference
        else (reference, state)

    let internal referenceArrayLowerBound metadata arrayRef indices =
        let newIndices = { indices with metadata = Metadata.clone indices.metadata}
        Metadata.addMisc newIndices Arrays.ArrayIndicesType.LowerBounds
        referenceSubLocation (newIndices, Arrays.lengthTermType) arrayRef

    let internal referenceArrayLength metadata arrayRef indices =
        let newIndices = { indices with metadata = Metadata.clone indices.metadata}
        Metadata.addMisc newIndices Arrays.ArrayIndicesType.Lengths
        referenceSubLocation (newIndices, Arrays.lengthTermType) arrayRef

    let linearIndex indices =
        let mtd = Metadata.empty
        Seq.foldi (fun s i index -> mul mtd (MakeNumber i mtd) s |> add mtd index) (Concrete 0 Arrays.lengthTermType mtd) indices

    let internal checkIndices mtd state arrayRef dimension (indices : Term list) k =
        let intToTerm i = MakeNumber i mtd
        let idOfDimensionsForLowerBounds = Seq.init indices.Length (intToTerm >> referenceArrayLowerBound mtd arrayRef)
        let idOfDimensionsForLengths = Seq.init indices.Length (intToTerm >> referenceArrayLength mtd arrayRef)
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
        k (conjunction mtd bounds |> Merging.unguardTerm |> Merging.merge , state'')))

    let internal referenceArrayIndex metadata state arrayRef (indices : Term list) =
        let array, state = deref metadata state arrayRef
        // TODO: what about followHeapRefs?
        let rec reference state term =
            match term.term with
            | Error _ -> (term, state)
            | Array(dimension, _, _, _, _, _, ArrayType(elementType, _)) ->
                Common.statedConditionalExecution state
                    (fun state k -> checkIndices metadata state arrayRef dimension indices k)
                    (fun state k ->
                        let location = Arrays.makeIntegerArray metadata (fun i -> indices.[i]) indices.Length
                        let newLocation = { location with metadata = Metadata.clone location.metadata}
                        Metadata.addMisc newLocation Arrays.ArrayIndicesType.Contents
                        k (referenceSubLocation (newLocation, elementType) arrayRef, state))
                    (fun state k ->
                        let exn, state = State.activator.CreateInstance metadata typeof<System.IndexOutOfRangeException> [] state
                        k (Error exn metadata, state))
                    Merging.merge Merging.merge2Terms id id
            | Union gvs -> Merging.guardedStateMap reference gvs state
            | t -> internalfailf "accessing index of non-array term %O" t
        reference state array

    let internal derefLocalVariable metadata state id =
        referenceLocalVariable metadata state id false |> deref metadata state

// ------------------------------- Allocation -------------------------------

    let internal newStackFrame state metadata funcId frame = State.newStackFrame (tick()) metadata state funcId frame
    let internal newScope state frame = State.newScope (tick()) state frame

    let internal allocateOnStack metadata (s : state) key term : state =
        let time = tick()
        let { func = frameMetadata; entries = oldFrame; time = frameTime } = Stack.peak s.frames.f
        let newStack = pushToCurrentStackFrame s key { value = term; created = time; modified = time }
        let newEntries = { key = key; mtd = metadata; typ = None }
        let stackFrames = Stack.updateHead s.frames.f { func = frameMetadata; entries = newEntries :: oldFrame; time = frameTime }
        { s with stack = newStack; frames = { s.frames with f = stackFrames } }

    let internal allocateInHeap metadata (s : state) term : Term * state =
        let address = Concrete (freshAddress()) pointerType metadata
        Metadata.addMisc address AddressMarker
        let time = tick()
        let pointer = HeapRef ((address, Terms.TypeOf term), []) time metadata
        (pointer, { s with heap = s.heap.Add(address, { value = term; created = time; modified = time }) } )

    let internal allocateInStaticMemory metadata (s : state) typeName term =
        let time = tick()
        let address = Terms.MakeConcreteString typeName metadata
        { s with  statics = s.statics.Add(address, { value = term; created = time; modified = time }) }

    let internal allocateSymbolicInstance metadata state t =
        match t with
        | TermType.ClassType(tp, arg, interfaces) ->
            let contents = makeSymbolicInstance metadata ZeroTime (LazyInstantiation(Nop, false)) "" (StructType(tp, arg, interfaces))
            allocateInHeap metadata state contents
        | StructType _ ->
            makeSymbolicInstance metadata ZeroTime (LazyInstantiation(Nop, false)) "" t, state
        | _ -> __notImplemented__()

// ------------------------------- Comparison -------------------------------

    type internal StateDiff =
        | Mutation of Term * Term
        | Allocation of Term * Term

    let private compareHeaps h1 h2 =
        assert(Heap.size h1 <= Heap.size h2)
        let oldValues, newValues = Heap.partition (fun (k, _) -> Heap.contains k h1) h2
        let changedValues = List.filter (fun (k, v) -> h1.[k].value <> v) oldValues
        changedValues, newValues

    let rec private addrLess addr1 addr2 =
        match addr1.term, addr2.term with
        | Concrete(a1, t1), Concrete(a2, t2) ->
            match t1, t2 with
            | _ when t1 = t2 && t1 = pointerType -> compare (a1 :?> int) (a2 :?> int)
            | StringType, StringType -> compare (a1 :?> string) (a2 :?> string)
            | _, StringType when t1 = pointerType -> -1
            | StringType, _ when t2 = pointerType -> 1
            | _ -> __notImplemented__()
        | Constant(name1, _, _), Constant(name2, _, _) -> compare name1 name2
        | Concrete _, _ -> -1
        | _, Concrete _ -> 1
        | _ -> __notImplemented__()

    let private comparePaths = List.compareWith (fun (a1, _) (a2, _) -> addrLess a1 a2)

    let rec internal compareRefs ref1 ref2 =
        match ref1, ref2 with
        | _ when ref1 = ref2 -> 0
        | HeapRef(((addr1, _), path1), _, _), HeapRef(((addr2, _), path2), _, _) ->
            let h = addrLess addr1 addr2
            if h = 0 then comparePaths path1 path2 else h
        | StackRef(name1, path1, _), StackRef(name2, path2, _) ->
            let h = compare name1 name2
            if h = 0 then comparePaths path1 path2 else h
        | StaticRef(name1, path1, _), StaticRef(name2, path2, _) ->
            let h = compare name1 name2
            if h = 0 then comparePaths path1 path2 else h
        | StackRef _, _ -> -1
        | _, StackRef _ -> 1
        | HeapRef _, _ -> -1
        | _, HeapRef _ -> 1
        | _ -> internalfail "compareRefs called with non-reference terms"

    let private sortMap mapper = List.sortWith (fun (k1, _) (k2, _) -> addrLess k1 k2) >> List.map mapper

    //let rec private structDiff key val1 val2 =
    //    match val1, val2 with
    //    | Struct(fields1, _), Struct(fields2, _) ->
    //        let mutatedFields, addedFields = compareHeaps fields1 fields2
    //        let innerMutatedFields, innerAddedFields =
    //            mutatedFields |> sortMap (fun (k, v) -> structDiff (referenceSubLocation (k, Terms.TypeOf v) key) (fst3 fields1.[k]) v) |> List.unzip
    //
    //        let overalMutatedFields = List.concat innerMutatedFields
    //        let overalAddedFields =
    //            List.append
    //                (sortMap (fun (k, v) -> (referenceSubLocation (k, Terms.TypeOf v) key, v)) addedFields)
    //                (List.concat innerAddedFields)
    //
    //        (overalMutatedFields, overalAddedFields)
    //    | _ ->
    //        [(key, val2)], []

    //let internal diff ((s1, h1, m1, _, _) as state : state) ((s2, h2, m2, _, _) : state) =
    //    let mutatedStack = compareStacks s1 s2
    //    let mutatedHeap, newHeap = compareHeaps h1 h2
    //    let mutatedStatics, newStatics = compareHeaps m1 m2
    //    let mapper (key, newValue) =
    //        let oldValue, _ = deref state key
    //        structDiff key oldValue newValue
    //    let mutatedStackFieldss,  newStackFieldss   = mutatedStack   |> sortMap mapper |> List.unzip
    //    let mutatedHeapFieldss,   newHeapFieldss    = mutatedHeap    |> sortMap mapper |> List.unzip
    //    let mutatedStaticFieldss, newStaticFieldss  = mutatedStatics |> sortMap mapper |> List.unzip
    //    let overalMutatedValues =
    //        List.append3
    //            (List.concat mutatedStackFieldss)
    //            (List.concat mutatedHeapFieldss)
    //            (List.concat mutatedStaticFieldss)
    //
    //    let newHeapTopLevel = sortMap (fun (k, v) -> (HeapRef(((k, Terms.TypeOf v), []), 0u), v)) newHeap
    //    let newStaticsTopLevel = sortMap (fun (k, v) -> (HeapRef(((k, Terms.TypeOf v), []), 0u), v)) newStatics
    //    let allocatedValues = newHeapTopLevel::newStaticsTopLevel::newHeapFieldss |> List.concat
    //    List.append
    //        (List.map Mutation overalMutatedValues)
    //        (List.map Allocation allocatedValues)
