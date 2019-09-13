namespace VSharp.Core

open VSharp
open global.System
open System.Reflection

type ISymbolicTypeSource =
    abstract TypeEquals : ISymbolicTypeSource -> bool

[<StructuralEquality;NoComparison>]
type arrayDimensionType =
    | Vector
    | ConcreteDimension of int
    | SymbolicDimension of string transparent

[<StructuralEquality;NoComparison>]
type termType =
    | Void
    | Bottom
    | Null
    | Bool
    | Numeric of System.Type
    | StructType of System.Type * termType list        // Value type with generic argument
    | ClassType of System.Type * termType list         // Reference type with generic argument
    | InterfaceType of System.Type * termType list     // Interface type with generic argument
    | TypeVariable of typeId
    | ArrayType of termType * arrayDimensionType
    | Func of termType list * termType //TODO: Do we really need Func type?
    | Reference of termType
    | Pointer of termType // C-style pointers like int*

    override x.ToString() =
        match x with
        | Void -> "System.Void"
        | Bottom -> "exception"
        | Null -> "<nullType>"
        | Bool -> typedefof<bool>.FullName
        | Numeric t -> t.FullName
        | Func(domain, range) -> String.Join(" -> ", List.append domain [range])
        | StructType(t, g)
        | ClassType(t, g)
        | InterfaceType(t, g) ->
            if t.IsGenericType
                then
                    let args = String.Join(",", (Seq.map toString g))
                    sprintf "%s[%s]" (t.GetGenericTypeDefinition().FullName) args
                else toString t
        | TypeVariable(Id t) -> toString t
        | ArrayType(t, Vector) -> t.ToString() + "[]"
        | ArrayType(t, ConcreteDimension 1) -> t.ToString() + "[*]"
        | ArrayType(t, ConcreteDimension rank) -> t.ToString() + "[" + new string(',', rank - 1) + "]"
        | ArrayType(_, SymbolicDimension name) -> name.v
        | Reference t -> sprintf "<Reference to %O>" t
        | Pointer t -> sprintf "<Pointer to %O>" t

and [<CustomEquality;CustomComparison>]
    typeId =
        | Id of System.Type
        override x.GetHashCode() =
            match x with
            | Id h -> hash h
        override x.Equals(o : obj) =
            match o with
            | :? typeId as other ->
                match x, other with
                | Id h1, Id h2 -> h1 = h2
            | _ -> false
        interface IComparable with
            override x.CompareTo(other) =
                match other with
                | :? typeId as other ->
                    match x, other with
                    | Id h1, Id h2 -> compare (hash h1) (hash h2) //TODO: change hash to MetadataToken when mono/mono#10127 is fixed.
                | _ -> -1

module internal Types =
    let (|Char|_|) = function
        | Numeric t when t = typeof<char> -> Some()
        | _ -> None

    let StructType t g = StructType(t, g)
    let ClassType t g = ClassType(t, g)
    let InterfaceType t g = InterfaceType(t, g)

    let pointerType = Numeric typedefof<int>
    let indexType = Numeric typedefof<int>
    let lengthType = Numeric typedefof<int>

    let isNumeric = function
        | Numeric _ -> true
        | _ -> false

    let isBool = function
        | Bool -> true
        | _ -> false

    let isFunction = function
        | Func _ -> true
        | _ -> false

    let isClass = function
        | ClassType _ -> true
        | _ -> false

    let isStruct = function
        | StructType _ -> true
        | _ -> false

    let isArray = function
        | ArrayType _ -> true
        | _ -> false

    let isObject = function
        | ClassType(t, _) when t = typedefof<obj> -> true
        | _ -> false

    let isVoid = function
        | Void -> true
        | _ -> false

    let isBottom = function
        | Bottom -> true
        | _ -> false

    let isNull = function
        | Null -> true
        | _ -> false

    let isReference = function
        | Reference _ -> true
        | _ -> false

    let isPointer = function
        | Pointer _ -> true
        | _ -> false

    let domainOf = function
        | Func(domain, _) -> domain
        | _ -> []

    let rangeOf = function
        | Func(_, range) -> range
        | t -> t

    let elementType = function
        | ArrayType(t, _) -> t
        | t -> internalfailf "expected array type, but got %O" t

    let concreteIsReferenceType = function
        | ClassType _
        | InterfaceType _
        | ArrayType _
        | Func _ -> true
        | TypeVariable _ -> __unreachable__()
        | _ -> false

    let wrapReferenceType = function
        | TypeVariable _ as t -> t
        | t when concreteIsReferenceType t -> Reference t
        | t -> t

    let rec toDotNetType t =
        match t with
        | Null -> null
        | Bool -> typedefof<bool>
        | Numeric t -> t
        | StructType(t, args)
        | InterfaceType(t, args)
        | ClassType(t, args) ->
            if t.IsGenericType
                then t.GetGenericTypeDefinition().MakeGenericType(Seq.map toDotNetType args |> Seq.toArray)
                else t
        | TypeVariable(Id t) -> t
        | ArrayType(_, SymbolicDimension _) -> typedefof<System.Array>
        | ArrayType(t, Vector) -> (toDotNetType t).MakeArrayType()
        | ArrayType(t, ConcreteDimension rank) -> (toDotNetType t).MakeArrayType(rank)
        | Reference t -> toDotNetType t
        | Pointer t -> (toDotNetType t).MakePointerType()
        | _ -> typedefof<obj>

    let sizeOf typ = // Reflection hacks, don't touch! Marshal.SizeOf lies!
        let internalSizeOf (typ: Type) : uint32 =
            let meth = new Reflection.Emit.DynamicMethod("GetManagedSizeImpl", typeof<uint32>, null);

            let gen = meth.GetILGenerator()
            gen.Emit(Reflection.Emit.OpCodes.Sizeof, typ)
            gen.Emit(Reflection.Emit.OpCodes.Ret)

            meth.CreateDelegate(typeof<Func<uint32>>).DynamicInvoke()
            |> unbox
        typ |> toDotNetType |> internalSizeOf |> int


    let bitSizeOfType t (resultingType : System.Type) = System.Convert.ChangeType(sizeOf(t) * 8, resultingType)


    module internal Constructor =
        let private StructType (t : Type) g = StructType t g
        let private ClassType (t : Type) g = ClassType t g
        let private InterfaceType (t : Type) g = InterfaceType t g

        let rec private getGenericArguments (dotNetType : Type) =
            if dotNetType.IsGenericType then
                Seq.map fromDotNetType (dotNetType.GetGenericArguments()) |> List.ofSeq
            else []

        and private makeInterfaceType (interfaceType : Type) =
            let genericArguments = getGenericArguments interfaceType
            InterfaceType interfaceType genericArguments

        and private fromCommonDotNetType (dotNetType : Type) =
            match dotNetType with
            | null -> Null
            | p when p.IsPointer -> p.GetElementType() |> fromCommonDotNetType |> Pointer
            | v when v.FullName = "System.Void" -> Void
            | a when a.FullName = "System.Array" -> ArrayType(fromCommonDotNetType typedefof<obj> |> wrapReferenceType, SymbolicDimension {v="System.Array"})
            | b when b.Equals(typedefof<bool>) -> Bool
            | n when TypeUtils.isNumeric n -> Numeric n
            | e when e.IsEnum -> Numeric e
            | a when a.IsArray ->
                ArrayType(
                    fromCommonDotNetType (a.GetElementType()) |> wrapReferenceType,
                    if a = a.GetElementType().MakeArrayType() then Vector else ConcreteDimension <| a.GetArrayRank())
            | s when s.IsValueType && not s.IsGenericParameter -> StructType s (getGenericArguments s)
            | f when f.IsSubclassOf(typedefof<System.Delegate>) ->
                let methodInfo = f.GetMethod("Invoke")
                let returnType = methodInfo.ReturnType |> fromCommonDotNetType
                let parameters = methodInfo.GetParameters() |>
                                    Seq.map (fun (p : System.Reflection.ParameterInfo) ->
                                    fromCommonDotNetType p.ParameterType)
                Func(List.ofSeq parameters, returnType)
            | p when p.IsGenericParameter -> TypeVariable(Id p)
            | c when c.IsClass -> ClassType c (getGenericArguments c)
            | i when i.IsInterface -> makeInterfaceType i
            | _ -> __notImplemented__()

        and fromDotNetType (dotNetType : System.Type) = if dotNetType = null then Null else fromCommonDotNetType dotNetType

        let (|StructureType|_|) = function
            | termType.StructType(t, genArg) -> Some(StructureType(t, genArg))
            | Numeric t -> Some(StructureType(t, []))
            | Bool -> Some(StructureType(typedefof<bool>, []))
            | TypeVariable(Id t) when t.IsValueType -> Some(StructureType(t, []))
            | _ -> None

        let (|ReferenceType|_|) = function
            | termType.ClassType(t, genArg) -> Some(ReferenceType(t, genArg))
            | termType.InterfaceType(t, genArg) -> Some(ReferenceType(t, genArg))
            | termType.ArrayType _ as arr ->
                let t = toDotNetType arr
                Some(ReferenceType(t, []))
            | TypeVariable(Id t) when TypeUtils.isReferenceTypeParameter t -> Some(ReferenceType(t, []))
            | _ -> None

        let (|ComplexType|_|) = function
            | StructureType(t, genArg)
            | ReferenceType(t, genArg) -> Some(ComplexType(t, genArg))
            | TypeVariable(Id t) -> Some(ComplexType(t, []))
            | _ -> None

    open Constructor

    let public Char = Numeric typedefof<char>

    let public String = fromDotNetType typedefof<string>

    let (|StringType|_|) = function
        | typ when typ = String -> Some()
        | _ -> None

    let isString = (=) String

    let isPrimitive = toDotNetType >> TypeUtils.isPrimitive

    let isInteger = toDotNetType >> TypeUtils.isIntegral

    let isReal = toDotNetType >> TypeUtils.isReal

    let rec fieldsOf (t : System.Type) isStatic =
        let staticFlag = if isStatic then BindingFlags.Static else BindingFlags.Instance
        let flags = BindingFlags.Public ||| BindingFlags.NonPublic ||| staticFlag
        let fields = t.GetFields(flags)
        let extractFieldInfo (field : FieldInfo) =
            // Events may appear at this point. Filtering them out...
            if field.FieldType.IsSubclassOf(typeof<MulticastDelegate>) then None
            else
                let fieldName = sprintf "%s.%s" ((safeGenericTypeDefinition field.DeclaringType).FullName) field.Name
                Some (fieldName, fromDotNetType field.FieldType)
        let ourFields = fields |> FSharp.Collections.Array.choose extractFieldInfo
        if isStatic || t.BaseType = null then ourFields
        else Array.append (fieldsOf t.BaseType false) ourFields

    let unwrapReferenceType = function
        | Reference t -> t
        | t -> t
