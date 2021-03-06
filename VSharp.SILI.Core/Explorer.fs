﻿namespace VSharp.Core

#nowarn "69"

open VSharp
open System.Collections.Generic

type public IInterpreter =
    abstract member Reset : ('a -> 'b) -> ('a -> 'b)
    abstract member InitEntryPoint : state -> string -> (state -> 'a) -> 'a
    abstract member Invoke : IFunctionIdentifier -> state -> term option -> (statementResult * state -> 'a) -> 'a
type IMethodIdentifier =
    inherit IFunctionIdentifier
    abstract IsStatic : bool
    abstract DeclaringTypeAQN : string
    abstract Token : string
type IDelegateIdentifier =
    inherit IFunctionIdentifier
    abstract ContextFrames : frames

module internal Explorer =
    open System

    let private currentlyExploredFunctions = new HashSet<IFunctionIdentifier>()
    let private currentlyCalledFunctions = new HashSet<IFunctionIdentifier>()

    type private NullInterpreter() =
        interface IInterpreter with
            member this.Reset _ = internalfail "interpreter is not ready"
            member this.InitEntryPoint _ _ _ = internalfail "interpreter is not ready"
            member this.Invoke _ _ _ _ = internalfail "interpreter is not ready"
    let mutable private interpreter : IInterpreter = new NullInterpreter() :> IInterpreter
    let configure itprtr = interpreter <- itprtr

    let private formInitialStatics metadata typ =
        let staticMemoryEntry = Struct metadata Heap.empty typ
        Heap.empty.Add(makeTopLevelKey TopLevelStatics typ, { value = staticMemoryEntry; created = Timestamp.zero; modified = Timestamp.zero })

    let private invoke id state this k =
        interpreter.Invoke id state this k

    let interpretEntryPoint (id : IFunctionIdentifier) k =
        let initialState = State.emptyRestricted
        match id with
        | :? IMethodIdentifier as m ->
            assert(m.IsStatic)
            interpreter.InitEntryPoint initialState m.DeclaringTypeAQN (fun state ->
            interpreter.Invoke id state None (fun (result, state) -> k { result = ControlFlow.resultToTerm result; state = state }))
        | _ -> internalfailf "unexpected entry point: expected regular method, but got %O" id

    let explore (id : IFunctionIdentifier) k =
        match Database.querySummary id with
        | Some r -> k r
        | None ->
            let k = interpreter.Reset k
            let metadata = Metadata.empty
            currentlyExploredFunctions.Add id |> ignore
            let this, state, isMethodOfStruct =
                match id with
                | :? IMethodIdentifier as m ->
                    let declaringQualifiedName = m.DeclaringTypeAQN
                    let declaringType = declaringQualifiedName |> System.Type.GetType |> Types.Constructor.fromDotNetType
                    let initialState = { State.empty with statics = State.Defined false (formInitialStatics metadata declaringType) }
                    if m.IsStatic then (None, initialState, false)
                    else
                        Memory.makeSymbolicThis metadata initialState m.Token declaringType
                        |> (fun (f, s, flag) -> Some f, s, flag)
                | :? IDelegateIdentifier as dlgt ->
                    let state = dlgt.ContextFrames.f |> List.rev |> List.fold (fun state frame ->
                        let fr = frame.entries |> List.map (fun e -> e.key, Unspecified, e.typ)
                        match frame.func with
                        | Some(f, p) ->
                            let state = {state with pc = p}
                            Memory.newStackFrame state metadata f fr
                        | None -> Memory.newScope metadata state fr) State.empty
                    let state = { state with pc = List.empty; frames = dlgt.ContextFrames}
                    // TODO: Create dummy frame
                    (None, state, false)
                | _ -> __notImplemented__()
            let state = if Option.isSome this then State.withPathCondition state (!!( Pointers.isNull metadata (Option.get this))) else state
            invoke id state this (fun (res, state) ->
                let state = if Option.isSome this then State.popPathCondition state else state
                let state = if isMethodOfStruct then State.popStack state else state
                currentlyExploredFunctions.Remove id |> ignore
                Database.report id res state |> k)

    let private detectUnboundRecursion id s =
        let isRecursiveFrame (frame : stackFrame) =
            match frame.func with
            | Some(id', _) when id = id' -> true
            | _ -> false
        let bottomOccurence = Stack.tryFindBottom isRecursiveFrame s.frames.f
        match bottomOccurence with
        | None -> false
        | Some { func = Some(_, p'); entries = _; time =  _ } when s.pc = p' ->
            match Options.RecursionUnrollingMode() with
            | NeverUnroll -> true
            | _ -> false
        | _ ->
            match Options.RecursionUnrollingMode() with
            | AlwaysUnroll -> false
            | _ -> true

    type private recursionOutcomeSource =
        {id : IFunctionIdentifier; state : state; name : string transparent; typ : termType;
            location : term option; extractor : TermExtractor; typeExtractor : TypeExtractor}
        interface IExtractingSymbolicConstantSource with
            override x.SubTerms = Seq.empty
            override x.WithExtractor e = {x with extractor = e} :> IExtractingSymbolicConstantSource
        interface IExtractingSymbolicTypeSource with
            override x.WithTypeExtractor e = {x with typeExtractor = e} :> IExtractingSymbolicTypeSource
            override x.TypeCompose ctx state =
                (x :> IStatedSymbolicConstantSource).Compose ctx state |> typeOf |> x.typeExtractor.TypeExtract
            override x.TypeEquals other =
                match other with
                | :? recursionOutcomeSource as ros -> x.id = ros.id && x.typ = ros.typ
                | _ -> false

    let (|RecursionOutcome|_|) (src : ISymbolicConstantSource) =
        match src with
        | :? recursionOutcomeSource as ro -> Some(ro.id, ro.state, ro.location, ro.extractor :? IdTermExtractor)
        | _ -> None

    let private mutateStackClosure mtd (funcId : IFunctionIdentifier) time state =
        match funcId with
        | :? IDelegateIdentifier as di ->
            let mutateLocation st (frame : entry) =
                let location = StackRef mtd frame.key []
                let name = sprintf "μ[%O, %s]" funcId (fst frame.key)
                let typ = frame.typ
                let source = {id = funcId; state = state; name = {v=name}; typ = typ; location = Some location; extractor = IdTermExtractor(); typeExtractor = IdTypeExtractor()}
                let fql = makeTopLevelFQL TopLevelStack frame.key
                let value = Memory.makeSymbolicInstance mtd time source source name fql typ
                Memory.mutateStack mtd st frame.key [] time value
            di.ContextFrames.f |> List.fold (fun state frame -> List.fold mutateLocation state frame.entries) state
        | _ -> state

    let functionApplicationResult mtd (funcId : IFunctionIdentifier) name state time k =
        let typ = Types.wrapReferenceType funcId.ReturnType
        let source = {id = funcId; state = state; name = {v=name}; typ = typ; location = None; extractor = IdTermExtractor(); typeExtractor = IdTypeExtractor()}
        Memory.makeSymbolicInstance mtd time source source name None typ |> k

    let recursionApplication mtd (funcId : IFunctionIdentifier) state addr time k =
        let name = IdGenerator.startingWith <| sprintf "μ[%O]_" funcId
        functionApplicationResult mtd funcId name state time (fun res ->
        let recursiveResult = ControlFlow.throwOrReturn res
        let heapSymbol = RecursiveApplication(funcId, addr, time)
        let ctx : compositionContext = { mtd = mtd; addr = addr; time = time }
        let heap = Memory.composeHeapsOf ctx state heapSymbol
        let statics = Memory.composeStaticsOf ctx state heapSymbol
        let recursiveState = { mutateStackClosure mtd funcId time state with heap = heap; statics = statics }
        k (recursiveResult, recursiveState))

    let higherOrderApplication mtd funcId (state : state) k =
        let addr = [Memory.freshAddress()]
        let time = Memory.tick()
        let name = IdGenerator.startingWith <| sprintf "λ[%O]_" funcId
        functionApplicationResult mtd funcId name state time (fun res ->
        let higherOrderResult = ControlFlow.throwOrReturn res
        let higherOrderState =
            { mutateStackClosure mtd funcId time state with
                heap = HigherOrderApplication(res, addr, time);
                statics = HigherOrderApplication(res, addr, time) }
        k (higherOrderResult , higherOrderState))

    let reproduceEffect mtd funcId state k =
        let addr = [Memory.freshAddress()]
        let time = Memory.tick()
        if currentlyExploredFunctions.Contains funcId then
            recursionApplication mtd funcId state addr time k
        else
            let ctx : compositionContext = { mtd = mtd; addr = addr; time = time }
            explore funcId (fun summary ->
            let result = Memory.fillHoles ctx state summary.result |> ControlFlow.throwOrReturn
            let state = Memory.composeStates ctx state summary.state
            k (result, state))

    let callOrApplyEffect mtd areWeStuck body id state setup teardown k =
        if areWeStuck then
            reproduceEffect mtd id state k
        else
            setup id
            body state (fun (result, state) ->
            teardown id
            k (result, state))

    let call mtd funcId state body k =
        let managedCallOrApply k =
            match Options.RecursionUnrollingMode () with
            | RecursionUnrollingModeType.SmartUnrolling ->
                callOrApplyEffect mtd (detectUnboundRecursion funcId state) body funcId state ignore ignore k
            | RecursionUnrollingModeType.NeverUnroll ->
                let shouldStopUnrolling =
                    currentlyCalledFunctions.Contains funcId ||
                    not <| currentlyExploredFunctions.Contains funcId ||
                    Database.reported funcId
                let setup id = currentlyCalledFunctions.Add id |> ignore
                let teardown id = currentlyCalledFunctions.Remove id |> ignore
                callOrApplyEffect mtd shouldStopUnrolling body funcId state setup teardown k
            | RecursionUnrollingModeType.AlwaysUnroll -> callOrApplyEffect mtd false body funcId state ignore ignore k
        managedCallOrApply (fun (result, state) -> k (result, State.popStack state))

    type recursionOutcomeSource with
        interface IExtractingSymbolicConstantSource with
            override x.Compose ctx state =
                let state' = Memory.composeStates ctx state x.state
                let source' = {x with state = state'}
                Constant ctx.mtd x.name.v source' x.typ
