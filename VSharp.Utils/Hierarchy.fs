namespace VSharp

type hierarchy(h: System.Type list) =
    member x.Inheritor = List.head h
    member x.Hierarchy = h
    member x.Name = x.Inheritor.ToString()
    member x.IsGround =
        (not x.Inheritor.IsGenericType && not x.Inheritor.IsGenericParameter) || (x.Inheritor.IsConstructedGenericType)
    member x.Is (r : hierarchy) = Seq.contains r.Inheritor h
    member x.Equals (r : hierarchy) = x.Inheritor = r.Inheritor
    member x.Equals (r : System.Type) = x.Inheritor = r
    override x.ToString() = x.Name
    override x.GetHashCode() =
        x.Hierarchy.GetHashCode()
    override x.Equals(o : obj) =
        match o with
        | :? hierarchy as other -> x.GetHashCode() = other.GetHashCode()
        | _ -> false

module private Hierarchy =
    let rec getBaseTypeFromGenericParameter (t : System.Type) =
        let mergeHierarchy (l : System.Type) (r : System.Type) =
            if l.IsAssignableFrom(r) then r else l
        let nakedTypes =
            t.GetGenericParameterConstraints() |>
            Seq.filter (fun nt -> nt.IsGenericParameter) |>
            Seq.map getBaseTypeFromGenericParameter |>
            List.ofSeq
        t.BaseType :: nakedTypes |> Seq.reduce mergeHierarchy

    and getInheritanceHierarchy (t : System.Type) =
        match t with
        | null -> List.empty
        | _ when t.IsGenericParameter -> t :: getInheritanceHierarchy (getBaseTypeFromGenericParameter t)
        | _ -> t :: getInheritanceHierarchy t.BaseType

<<<<<<< HEAD
    let private make t = getInheritanceHierarchy t

    type public Hierarchy(hierarchy : System.Type list) =
        member x.Inheritor = List.head hierarchy
        member x.Hierarchy = hierarchy
        member x.Name = x.Inheritor.ToString()
        member x.Is (r : Hierarchy) = Seq.contains r.Inheritor hierarchy
        member x.Equals (r : Hierarchy) = x.Inheritor = r.Inheritor
        member x.Equals (r : System.Type) = x.Inheritor = r
        new (typ : System.Type) = Hierarchy(make typ)
        override x.ToString() = x.Name
        override x.GetHashCode() = hierarchy.GetHashCode()
        override x.Equals(o : obj) =
            match o with
            | :? Hierarchy as other -> x.GetHashCode() = other.GetHashCode()
            | _ -> false
=======
type hierarchy with
    new (typ : System.Type) = hierarchy (Hierarchy.getInheritanceHierarchy typ)
>>>>>>> 23c11e2bcd2e4e247a2548c3448ddd9ea4bbb335
