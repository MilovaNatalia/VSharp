namespace VSharp

[<AutoOpen>]
module internal Operators =

    let simplifyBinaryOperation mtd op isChecked state t left right k =
        let t1 = Terms.TypeOf left in
        let t2 = Terms.TypeOf right in
        match op with
        | op when Propositional.isLogicalOperation op t1 t2 ->
            Propositional.simplifyBinaryConnective mtd op left right (withSnd state >> k)
        | op when Arithmetics.isArithmeticalOperation op t1 t2 ->
            Arithmetics.simplifyBinaryOperation mtd op state left right isChecked t k
        | op when Strings.isStringOperation op t1 t2 ->
            Strings.simplifyOperation mtd op left right |> (withSnd state >> k)
        | op when Pointers.isPointerOperation op t1 t2 ->
            Pointers.simplifyBinaryOperation mtd op state left right k
        | _ -> __notImplemented__()

    let ksimplifyEquality mtd x y k =
        simplifyBinaryOperation mtd JetBrains.Decompiler.Ast.OperationType.Equal false State.empty typeof<bool> x y (fst >> k)

    let simplifyEquality mtd x y =
        ksimplifyEquality mtd x y id

    let (===) x y = ksimplifyEquality Metadata.empty x y id
    let (!==) x y = ksimplifyEquality Metadata.empty x y (!!)

    let simplifyUnaryOperation mtd op isChecked state t arg k =
        match t with
        | Bool -> Propositional.simplifyUnaryConnective mtd op arg (withSnd state >> k)
        | Numeric t -> Arithmetics.simplifyUnaryOperation mtd op state arg isChecked t k
        | String -> __notImplemented__()
        | _ -> __notImplemented__()

    let structuralEquality mtd x y =
        let equal acc t1 t2 k =
            ksimplifyEquality mtd t1 t2 (fun res ->
            simplifyAnd mtd acc res k)
        in
        Common.unify equal (Terms.MakeFalse mtd) x y (Terms.MakeTrue mtd) id