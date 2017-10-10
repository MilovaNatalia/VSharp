﻿namespace VSharp
open VSharp.Utils
open VSharp.Types

module internal State =
    module SymbolicHeap = Heap

    type internal stack = MappedStack.stack<StackKey, MemoryCell<Term>>
    type internal heap = SymbolicHeap
    type internal staticMemory = SymbolicHeap
    type internal pathCondition = Term list
    type internal stackFrame = (FunctionIdentifier * pathCondition) option * (StackKey * TermMetadata * TermType option) list * Timestamp
    type internal frames = Stack.stack<stackFrame> * StackHash
    type internal internPool = SymbolicHeap
    type internal state = stack * heap * staticMemory * internPool * frames * pathCondition

// ------------------------------- Primitives -------------------------------

    let internal empty : state = (MappedStack.empty, SymbolicHeap.empty, SymbolicHeap.empty, SymbolicHeap.empty, (Stack.empty, List.empty), List.empty)

    type internal 'a SymbolicValue =
        | Specified of 'a
        | Unspecified

    let internal zeroTime : Timestamp = System.UInt32.MinValue

    let internal nameOfLocation = term >> function
        | HeapRef((_, (x, _)::xs), _) -> toString x
        | HeapRef(((_, t), _), _) -> toString t
        | StackRef((name, _), x::_) -> sprintf "%s.%O" name x
        | StackRef((name, _), _) -> name
        | StaticRef(name, x::_) -> sprintf "%O.%O" name x
        | StaticRef(name, _) -> toString name
        | l -> "requested name of an unexpected location " + (toString l) |> internalfail

    let internal readStackLocation ((s, _, _, _, _, _) : state) key = MappedStack.find key s
    let internal readHeapLocation ((_, h, _, _, _, _) : state) key = h.[key] |> fst3
    let internal readStaticLocation ((_, _, m, _, _, _) : state) key = m.[key] |> fst3
    let internal readPoolLocation ((_, _, _, i, _, _) : state) key = if i.ContainsKey key then i.[key] |> fst3
                                                                                          else internalfail "vguh"

    let internal isAllocatedOnStack ((s, _, _, _, _, _) : state) key = MappedStack.containsKey key s
    let internal staticMembersInitialized ((_, _, m, _, _, _) : state) typeName =
        SymbolicHeap.contains (Terms.MakeStringKey typeName) m

    let internal newStackFrame time metadata ((s, h, m, i, (f, sh), p) : state) funcId frame : state =
        let pushOne (map : stack) (key, value, typ) =
            match value with
            | Specified term -> ((key, metadata, typ), MappedStack.push key (term, time, time) map)
            | Unspecified -> ((key, metadata, typ), MappedStack.reserve key map)
        in
        let frameMetadata = Some(funcId, p) in
        let locations, newStack = frame |> List.mapFold pushOne s in
        let f' = Stack.push f (frameMetadata, locations, time) in
        let sh' = frameMetadata.GetHashCode()::sh in
        (newStack, h, m, i, (f', sh'), p)

    let internal newScope time metadata ((s, h, m, i, (f, sh), p) : state) frame : state =
        let pushOne (map : stack) (key, value, typ) =
            match value with
            | Specified term -> ((key, metadata, typ), MappedStack.push key (term, time, time) map)
            | Unspecified -> ((key, metadata, typ), MappedStack.reserve key map)
        in
        let locations, newStack = frame |> List.mapFold pushOne s in
        (newStack, h, m, i, (Stack.push f (None, locations, time), sh), p)

    let internal pushToCurrentStackFrame ((s, _, _, _, _, _) : state) key value = MappedStack.push key value s
    let internal popStack ((s, h, m, i, (f, sh), p) : state) : state =
        let popOne (map : stack) (name, _, _) = MappedStack.remove map name
        let metadata, locations, _ = Stack.peak f in
        let f' = Stack.pop f in
        let sh' =
            match metadata with
            | Some _ ->
                assert(not <| List.isEmpty sh)
                List.tail sh
            | None -> sh
        (List.fold popOne s locations, h, m, i, (f', sh'), p)

    let internal writeStackLocation ((s, h, m, i, f, p) : state) key value : state =
        (MappedStack.add key value s, h, m, i, f, p)

    let internal frameTime ((_, _, _, _, (f, _), _) : state) key =
        match List.tryFind (snd3 >> List.exists (fst3 >> ((=) key))) f with
        | Some(_, _, t) -> t
        | None -> internalfailf "stack does not contain key %O!" key

    let internal typeOfStackLocation ((_, _, _, _, (f, _), _) : state) key =
        let forMatch = List.tryPick (snd3 >> List.tryPick (fun (l, _, t) -> if l = key then Some t else None)) f
        match forMatch with
        | Some (Some t) -> t
        | Some None -> internalfailf "unknown type of stack location %O!" key
        | None -> internalfailf "stack does not contain key %O!" key

    let internal metadataOfStackLocation ((_, _, _, _, (f, _), _) : state) key =
        match List.tryPick (snd3 >> List.tryPick (fun (l, m, _) -> if l = key then Some m else None)) f with
        | Some t -> t
        | None -> internalfailf "stack does not contain key %O!" key

    let internal compareStacks s1 s2 = MappedStack.compare (fun key value -> StackRef key [] Metadata.empty) fst3 s1 s2

    let internal withPathCondition ((s, h, m, i, f, p) : state) cond : state = (s, h, m, i, f, cond::p)
    let internal popPathCondition ((s, h, m, i, f, p) : state) : state =
        match p with
        | [] -> internalfail "cannot pop empty path condition"
        | _::p' -> (s, h, m, i, f, p')

    let private stackOf ((s, _, _, _, _, _) : state) = s
    let internal heapOf ((_, h, _, _, _, _) : state) = h
    let internal staticsOf ((_, _, m, _, _, _) : state) = m
    let internal poolOf ((_, _, _, i, _, _) : state) = i
    let private framesOf ((_, _, _, _, f, _) : state) = f
    let private framesHashOf ((_, _, _, _, (_, h), _) : state) = h
    let internal pathConditionOf ((_, _, _, _, _, p) : state) = p

    let internal withHeap ((s, h, m, i, f, p) : state) h' = (s, h', m, i, f, p)
    let internal withStatics ((s, h, m, i, f, p) : state) m' = (s, h, m', i, f, p)
    let internal withPool ((s, h, m, i, f, p) : state) i' = (s, h, m, i', f, p)

    let private staticKeyToString = term >> function
        | Concrete(typeName, String) -> System.Type.GetType(typeName :?> string).FullName
        | t -> toString t

    let internal mkMetadata location state =
        { origins = [{ location = location; stack = framesHashOf state}]; misc = null }

// ------------------------------- Memory level -------------------------------

    type IActivator =
        abstract member CreateInstance : TermMetadata -> System.Type -> Term list -> state -> (Term * state)
    type private NullActivator() =
        interface IActivator with
            member x.CreateInstance _ _ _ _ =
                internalfail "activator is not ready"
    let mutable activator : IActivator = new NullActivator() :> IActivator
    let mutable genericLazyInstantiator : TermMetadata -> Timestamp -> Term -> TermType -> unit -> Term =
        fun _ _ _ _ () -> internalfailf "generic lazy instantiator is not ready"

    let internal stackLazyInstantiator state time key =
        let time = frameTime state key in
        let t = typeOfStackLocation state key in
        let metadata = metadataOfStackLocation state key in
        let fql = StackRef key [] metadata in
        (genericLazyInstantiator metadata time fql t (), time, time)

    let internal dumpMemory ((_, h, m, i, _, _) : state) = //TODO: dump or not to dump?
        let sh = Heap.dump h toString in
        let mh = Heap.dump m staticKeyToString in //ToString for internPool
        let separator = if System.String.IsNullOrWhiteSpace(sh) then "" else "\n"
        sh + separator + mh

// ------------------------------- Merging -------------------------------

    let internal merge2 ((s1, h1, m1, i1, f1, p1) as state : state) ((s2, h2, m2, i2, f2, p2) : state) resolve : state =
        assert(p1 = p2)
        assert(f1 = f2)
        let mergedStack = MappedStack.merge2 s1 s2 resolve (stackLazyInstantiator state) in
        let mergedHeap = Heap.merge2 h1 h2 resolve in
        let mergedStatics = Heap.merge2 m1 m2 resolve in
        let mergedPool = Heap.merge2 i1 i2 resolve in
        (mergedStack, mergedHeap, mergedStatics, mergedPool, f1, p1)

    let internal merge guards states resolve : state =
        assert(List.length states > 0)
        let first = List.head states in
        let frames = framesOf first in
        let path = pathConditionOf first in
        assert(List.forall (fun s -> framesOf s = frames) states)
        assert(List.forall (fun s -> pathConditionOf s = path) states)
        let mergedStack = MappedStack.merge guards (List.map stackOf states) resolve (stackLazyInstantiator first) in
        let mergedHeap = Heap.merge guards (List.map heapOf states) resolve in
        let mergedStatics = Heap.merge guards (List.map staticsOf states) resolve in
        let mergedPool = Heap.merge guards (List.map poolOf states) resolve in
        (mergedStack, mergedHeap, mergedStatics, mergedPool, frames, path)
