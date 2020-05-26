include struct
   open OCanren
   type ('name, 'terms) term = Term of 'name * 'terms

   let fmt_term fname fterms fmt (Term (s, xs)) =
     Format.fprintf fmt "('%a %a)" fname s fterms xs

   type ground = (string,               ground OCanren.Std.List.ground) term
   type logic  = (string OCanren.logic, logic  OCanren.Std.List.logic)  term OCanren.logic
   type tinj = (ground, logic) injected

   module F = OCanren.Fmap2(struct
      type  ('a, 'b) t = ('a,'b) term
      let fmap fa fb (Term (a,b)) = Term (fa a, fb b)
   end)

   let w name xs = inj @@ F.distrib @@ Term (name, xs)
   (* in [w name xs] xs is obliged to be a list of terms. Is it what is expected? *)

   let leaf name = w name (Std.List.nil ())

   let rec term_reify env t : logic =
      F.reify OCanren.reify (OCanren.Std.List.reify term_reify) env t
   let rec pp_term_logic fmt t =
      GT.fmt OCanren.logic
         (fmt_term (GT.fmt OCanren.logic (GT.fmt GT.string))
                  (GT.fmt Std.List.logic pp_term_logic))
         fmt t

end


(* ****** Relational stuff ******************** *)
let (!!) x = OCanren.(inj @@ lift x)

include struct
  open OCanren
  open OCanren.Std
let dogsdelegate33554494 a b = w !!"dogsdelegate33554494" (Std.List.list[a;b])
let delegate33554565 = w !!"delegate33554565" (Std.List.list[])
let iserializable33556234 = w !!"iserializable33556234" (Std.List.list[])
let icloneable33554495 = w !!"icloneable33554495" (Std.List.list[])
let multicastdelegate33554567 = w !!"multicastdelegate33554567" (Std.List.list[])
let vector33554435 a = w !!"vector33554435" (Std.List.list[a])
let array33554517 = w !!"array33554517" (Std.List.list[])
let istructuralequatable33555576 = w !!"istructuralequatable33555576" (Std.List.list[])
let istructuralcomparable33555577 = w !!"istructuralcomparable33555577" (Std.List.list[])
let ienumerable33555569 = w !!"ienumerable33555569" (Std.List.list[])
let icollection33555565 = w !!"icollection33555565" (Std.List.list[])
let ilist33555573 = w !!"ilist33555573" (Std.List.list[])
let ireadonlycollection33555626 a = w !!"ireadonlycollection33555626" (Std.List.list[a])
let ienumerable33555622 a = w !!"ienumerable33555622" (Std.List.list[a])
let ireadonlylist33555627 a = w !!"ireadonlylist33555627" (Std.List.list[a])
let icollection33555619 a = w !!"icollection33555619" (Std.List.list[a])
let ilist33555625 a = w !!"ilist33555625" (Std.List.list[a])
let object33554493 = w !!"object33554493" (Std.List.list[])
let rec contravariant_subtype a b = 
  conde 
    [ (b === a) &&& (is_valuetype b)
    ; (is_reference b) &&& (subtype b a)
    ]
and covariant_subtype a b = 
  conde 
    [ (a === b) &&& (is_valuetype a)
    ; (is_reference a) &&& (subtype a b)
    ]
and default_constructor a = (a === object33554493)
and is_reference a = 
  conde 
    [ fresh (b c) 
       (a === dogsdelegate33554494 b c)
    ; (a === delegate33554565)
    ; (a === iserializable33556234)
    ; (a === icloneable33554495)
    ; (a === multicastdelegate33554567)
    ; fresh (d) 
       (a === vector33554435 d)
    ; (a === array33554517)
    ; (a === istructuralequatable33555576)
    ; (a === istructuralcomparable33555577)
    ; (a === ienumerable33555569)
    ; (a === icollection33555565)
    ; (a === ilist33555573)
    ; fresh (e) 
       (a === ireadonlycollection33555626 e)
    ; fresh (f) 
       (a === ienumerable33555622 f)
    ; fresh (g) 
       (a === ireadonlylist33555627 g)
    ; fresh (h) 
       (a === icollection33555619 h)
    ; fresh (i) 
       (a === ilist33555625 i)
    ; (a === object33554493)
    ]
and is_unmanaged a = failure
and is_valuetype a = failure
and not_contravariant_subtype a b = 
  conde 
    [ (b =/= a) &&& (is_valuetype b)
    ; (is_reference b) &&& (not_subtype b a)
    ]
and not_covariant_subtype a b = 
  conde 
    [ (a =/= b) &&& (is_valuetype a)
    ; (is_reference a) &&& (not_subtype a b)
    ]
and not_subtype a b = 
  conde 
    [ fresh (c d e f) 
       (a === dogsdelegate33554494 c d) 
       (b === dogsdelegate33554494 e f) 
       (c =/= e)
    ; fresh (c d e f) 
       (a === dogsdelegate33554494 c d) 
       (b === dogsdelegate33554494 e f) 
       (d =/= f)
    ; fresh (c d e) 
       (a === dogsdelegate33554494 c d) 
       (b === vector33554435 e)
    ; fresh (c d) 
       (a === dogsdelegate33554494 c d) 
       (b === array33554517)
    ; fresh (c d) 
       (a === dogsdelegate33554494 c d) 
       (b === istructuralequatable33555576)
    ; fresh (c d) 
       (a === dogsdelegate33554494 c d) 
       (b === istructuralcomparable33555577)
    ; fresh (c d) 
       (a === dogsdelegate33554494 c d) 
       (b === ienumerable33555569)
    ; fresh (c d) 
       (a === dogsdelegate33554494 c d) 
       (b === icollection33555565)
    ; fresh (c d) 
       (a === dogsdelegate33554494 c d) 
       (b === ilist33555573)
    ; fresh (c d e) 
       (a === dogsdelegate33554494 c d) 
       (b === ireadonlycollection33555626 e)
    ; fresh (c d e) 
       (a === dogsdelegate33554494 c d) 
       (b === ienumerable33555622 e)
    ; fresh (c d e) 
       (a === dogsdelegate33554494 c d) 
       (b === ireadonlylist33555627 e)
    ; fresh (c d e) 
       (a === dogsdelegate33554494 c d) 
       (b === icollection33555619 e)
    ; fresh (c d e) 
       (a === dogsdelegate33554494 c d) 
       (b === ilist33555625 e)
    ; fresh (c d) 
       (a === delegate33554565) 
       (b === dogsdelegate33554494 c d)
    ; (a === delegate33554565) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === delegate33554565) 
       (b === vector33554435 c)
    ; (a === delegate33554565) &&& (b === array33554517)
    ; (a === delegate33554565) &&& (b === istructuralequatable33555576)
    ; (a === delegate33554565) &&& (b === istructuralcomparable33555577)
    ; (a === delegate33554565) &&& (b === ienumerable33555569)
    ; (a === delegate33554565) &&& (b === icollection33555565)
    ; (a === delegate33554565) &&& (b === ilist33555573)
    ; fresh (c) 
       (a === delegate33554565) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === delegate33554565) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === delegate33554565) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === delegate33554565) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === delegate33554565) 
       (b === ilist33555625 c)
    ; fresh (c d) 
       (a === iserializable33556234) 
       (b === dogsdelegate33554494 c d)
    ; (a === iserializable33556234) &&& (b === delegate33554565)
    ; (a === iserializable33556234) &&& (b === icloneable33554495)
    ; (a === iserializable33556234) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === iserializable33556234) 
       (b === vector33554435 c)
    ; (a === iserializable33556234) &&& (b === array33554517)
    ; (a === iserializable33556234) &&& (b === istructuralequatable33555576)
    ; (a === iserializable33556234) &&& (b === istructuralcomparable33555577)
    ; (a === iserializable33556234) &&& (b === ienumerable33555569)
    ; (a === iserializable33556234) &&& (b === icollection33555565)
    ; (a === iserializable33556234) &&& (b === ilist33555573)
    ; fresh (c) 
       (a === iserializable33556234) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === iserializable33556234) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === iserializable33556234) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === iserializable33556234) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === iserializable33556234) 
       (b === ilist33555625 c)
    ; fresh (c d) 
       (a === icloneable33554495) 
       (b === dogsdelegate33554494 c d)
    ; (a === icloneable33554495) &&& (b === delegate33554565)
    ; (a === icloneable33554495) &&& (b === iserializable33556234)
    ; (a === icloneable33554495) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === icloneable33554495) 
       (b === vector33554435 c)
    ; (a === icloneable33554495) &&& (b === array33554517)
    ; (a === icloneable33554495) &&& (b === istructuralequatable33555576)
    ; (a === icloneable33554495) &&& (b === istructuralcomparable33555577)
    ; (a === icloneable33554495) &&& (b === ienumerable33555569)
    ; (a === icloneable33554495) &&& (b === icollection33555565)
    ; (a === icloneable33554495) &&& (b === ilist33555573)
    ; fresh (c) 
       (a === icloneable33554495) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === icloneable33554495) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === icloneable33554495) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === icloneable33554495) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === icloneable33554495) 
       (b === ilist33555625 c)
    ; fresh (c d) 
       (a === multicastdelegate33554567) 
       (b === dogsdelegate33554494 c d)
    ; fresh (c) 
       (a === multicastdelegate33554567) 
       (b === vector33554435 c)
    ; (a === multicastdelegate33554567) &&& (b === array33554517)
    ; (a === multicastdelegate33554567) &&& (b === istructuralequatable33555576)
    ; (a === multicastdelegate33554567) &&& (b === istructuralcomparable33555577)
    ; (a === multicastdelegate33554567) &&& (b === ienumerable33555569)
    ; (a === multicastdelegate33554567) &&& (b === icollection33555565)
    ; (a === multicastdelegate33554567) &&& (b === ilist33555573)
    ; fresh (c) 
       (a === multicastdelegate33554567) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === multicastdelegate33554567) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === multicastdelegate33554567) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === multicastdelegate33554567) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === multicastdelegate33554567) 
       (b === ilist33555625 c)
    ; fresh (c d e) 
       (a === vector33554435 c) 
       (b === dogsdelegate33554494 d e)
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === delegate33554565)
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === iserializable33556234)
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === vector33554435 c) 
       (b === vector33554435 d) 
       (not_covariant_subtype c d)
    ; fresh (c d) 
       (a === vector33554435 c) 
       (b === ireadonlycollection33555626 d) 
       (not_subtype (ireadonlycollection33555626 c) (ireadonlycollection33555626 d))
    ; fresh (c d) 
       (a === vector33554435 c) 
       (b === ienumerable33555622 d) 
       (not_subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c d) 
       (a === vector33554435 c) 
       (b === ireadonlylist33555627 d) 
       (not_subtype (ireadonlylist33555627 c) (ireadonlylist33555627 d))
    ; fresh (c d) 
       (a === vector33554435 c) 
       (b === icollection33555619 d) 
       (not_subtype (icollection33555619 c) (icollection33555619 d))
    ; fresh (c d) 
       (a === vector33554435 c) 
       (b === ilist33555625 d) 
       (not_subtype (ilist33555625 c) (ilist33555625 d))
    ; fresh (c d) 
       (a === array33554517) 
       (b === dogsdelegate33554494 c d)
    ; (a === array33554517) &&& (b === delegate33554565)
    ; (a === array33554517) &&& (b === iserializable33556234)
    ; (a === array33554517) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === array33554517) 
       (b === vector33554435 c)
    ; fresh (c) 
       (a === array33554517) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === array33554517) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === array33554517) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === array33554517) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === array33554517) 
       (b === ilist33555625 c)
    ; fresh (c d) 
       (a === istructuralequatable33555576) 
       (b === dogsdelegate33554494 c d)
    ; (a === istructuralequatable33555576) &&& (b === delegate33554565)
    ; (a === istructuralequatable33555576) &&& (b === iserializable33556234)
    ; (a === istructuralequatable33555576) &&& (b === icloneable33554495)
    ; (a === istructuralequatable33555576) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === istructuralequatable33555576) 
       (b === vector33554435 c)
    ; (a === istructuralequatable33555576) &&& (b === array33554517)
    ; (a === istructuralequatable33555576) &&& (b === istructuralcomparable33555577)
    ; (a === istructuralequatable33555576) &&& (b === ienumerable33555569)
    ; (a === istructuralequatable33555576) &&& (b === icollection33555565)
    ; (a === istructuralequatable33555576) &&& (b === ilist33555573)
    ; fresh (c) 
       (a === istructuralequatable33555576) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === istructuralequatable33555576) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === istructuralequatable33555576) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === istructuralequatable33555576) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === istructuralequatable33555576) 
       (b === ilist33555625 c)
    ; fresh (c d) 
       (a === istructuralcomparable33555577) 
       (b === dogsdelegate33554494 c d)
    ; (a === istructuralcomparable33555577) &&& (b === delegate33554565)
    ; (a === istructuralcomparable33555577) &&& (b === iserializable33556234)
    ; (a === istructuralcomparable33555577) &&& (b === icloneable33554495)
    ; (a === istructuralcomparable33555577) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === istructuralcomparable33555577) 
       (b === vector33554435 c)
    ; (a === istructuralcomparable33555577) &&& (b === array33554517)
    ; (a === istructuralcomparable33555577) &&& (b === istructuralequatable33555576)
    ; (a === istructuralcomparable33555577) &&& (b === ienumerable33555569)
    ; (a === istructuralcomparable33555577) &&& (b === icollection33555565)
    ; (a === istructuralcomparable33555577) &&& (b === ilist33555573)
    ; fresh (c) 
       (a === istructuralcomparable33555577) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === istructuralcomparable33555577) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === istructuralcomparable33555577) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === istructuralcomparable33555577) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === istructuralcomparable33555577) 
       (b === ilist33555625 c)
    ; fresh (c d) 
       (a === ienumerable33555569) 
       (b === dogsdelegate33554494 c d)
    ; (a === ienumerable33555569) &&& (b === delegate33554565)
    ; (a === ienumerable33555569) &&& (b === iserializable33556234)
    ; (a === ienumerable33555569) &&& (b === icloneable33554495)
    ; (a === ienumerable33555569) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === vector33554435 c)
    ; (a === ienumerable33555569) &&& (b === array33554517)
    ; (a === ienumerable33555569) &&& (b === istructuralequatable33555576)
    ; (a === ienumerable33555569) &&& (b === istructuralcomparable33555577)
    ; (a === ienumerable33555569) &&& (b === icollection33555565)
    ; (a === ienumerable33555569) &&& (b === ilist33555573)
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === ilist33555625 c)
    ; fresh (c d) 
       (a === icollection33555565) 
       (b === dogsdelegate33554494 c d)
    ; (a === icollection33555565) &&& (b === delegate33554565)
    ; (a === icollection33555565) &&& (b === iserializable33556234)
    ; (a === icollection33555565) &&& (b === icloneable33554495)
    ; (a === icollection33555565) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === icollection33555565) 
       (b === vector33554435 c)
    ; (a === icollection33555565) &&& (b === array33554517)
    ; (a === icollection33555565) &&& (b === istructuralequatable33555576)
    ; (a === icollection33555565) &&& (b === istructuralcomparable33555577)
    ; (a === icollection33555565) &&& (b === ilist33555573)
    ; fresh (c) 
       (a === icollection33555565) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === icollection33555565) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === icollection33555565) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === icollection33555565) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === icollection33555565) 
       (b === ilist33555625 c)
    ; fresh (c d) 
       (a === ilist33555573) 
       (b === dogsdelegate33554494 c d)
    ; (a === ilist33555573) &&& (b === delegate33554565)
    ; (a === ilist33555573) &&& (b === iserializable33556234)
    ; (a === ilist33555573) &&& (b === icloneable33554495)
    ; (a === ilist33555573) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === ilist33555573) 
       (b === vector33554435 c)
    ; (a === ilist33555573) &&& (b === array33554517)
    ; (a === ilist33555573) &&& (b === istructuralequatable33555576)
    ; (a === ilist33555573) &&& (b === istructuralcomparable33555577)
    ; fresh (c) 
       (a === ilist33555573) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === ilist33555573) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === ilist33555573) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === ilist33555573) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === ilist33555573) 
       (b === ilist33555625 c)
    ; fresh (c d e) 
       (a === ireadonlycollection33555626 c) 
       (b === dogsdelegate33554494 d e)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === delegate33554565)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === iserializable33556234)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === icloneable33554495)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === ireadonlycollection33555626 c) 
       (b === vector33554435 d)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === array33554517)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === istructuralcomparable33555577)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === icollection33555565)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === ilist33555573)
    ; fresh (c d) 
       (a === ireadonlycollection33555626 c) 
       (b === ireadonlycollection33555626 d) 
       (not_covariant_subtype c d)
    ; fresh (c d) 
       (a === ireadonlycollection33555626 c) 
       (b === ienumerable33555622 d) 
       (not_subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c d) 
       (a === ireadonlycollection33555626 c) 
       (b === ireadonlylist33555627 d)
    ; fresh (c d) 
       (a === ireadonlycollection33555626 c) 
       (b === icollection33555619 d)
    ; fresh (c d) 
       (a === ireadonlycollection33555626 c) 
       (b === ilist33555625 d)
    ; fresh (c d e) 
       (a === ienumerable33555622 c) 
       (b === dogsdelegate33554494 d e)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === delegate33554565)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === iserializable33556234)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === icloneable33554495)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === vector33554435 d)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === array33554517)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === istructuralcomparable33555577)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === icollection33555565)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === ilist33555573)
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === ireadonlycollection33555626 d)
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === ienumerable33555622 d) 
       (not_covariant_subtype c d)
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === ireadonlylist33555627 d)
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === icollection33555619 d)
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === ilist33555625 d)
    ; fresh (c d e) 
       (a === ireadonlylist33555627 c) 
       (b === dogsdelegate33554494 d e)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === delegate33554565)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === iserializable33556234)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === icloneable33554495)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === ireadonlylist33555627 c) 
       (b === vector33554435 d)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === array33554517)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === istructuralcomparable33555577)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === icollection33555565)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === ilist33555573)
    ; fresh (c d) 
       (a === ireadonlylist33555627 c) 
       (b === ireadonlycollection33555626 d) 
       (not_subtype (ireadonlycollection33555626 c) (ireadonlycollection33555626 d))
    ; fresh (c d) 
       (a === ireadonlylist33555627 c) 
       (b === ienumerable33555622 d) 
       (not_subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c d) 
       (a === ireadonlylist33555627 c) 
       (b === ireadonlylist33555627 d) 
       (not_covariant_subtype c d)
    ; fresh (c d) 
       (a === ireadonlylist33555627 c) 
       (b === icollection33555619 d)
    ; fresh (c d) 
       (a === ireadonlylist33555627 c) 
       (b === ilist33555625 d)
    ; fresh (c d e) 
       (a === icollection33555619 c) 
       (b === dogsdelegate33554494 d e)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === delegate33554565)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === iserializable33556234)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === icloneable33554495)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === icollection33555619 c) 
       (b === vector33554435 d)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === array33554517)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === istructuralcomparable33555577)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === icollection33555565)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === ilist33555573)
    ; fresh (c d) 
       (a === icollection33555619 c) 
       (b === ireadonlycollection33555626 d)
    ; fresh (c d) 
       (a === icollection33555619 c) 
       (b === ienumerable33555622 d) 
       (not_subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c d) 
       (a === icollection33555619 c) 
       (b === ireadonlylist33555627 d)
    ; fresh (c d) 
       (a === icollection33555619 c) 
       (b === icollection33555619 d) 
       (c =/= d)
    ; fresh (c d) 
       (a === icollection33555619 c) 
       (b === ilist33555625 d)
    ; fresh (c d e) 
       (a === ilist33555625 c) 
       (b === dogsdelegate33554494 d e)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === delegate33554565)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === iserializable33556234)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === icloneable33554495)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === ilist33555625 c) 
       (b === vector33554435 d)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === array33554517)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === istructuralcomparable33555577)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === icollection33555565)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === ilist33555573)
    ; fresh (c d) 
       (a === ilist33555625 c) 
       (b === ireadonlycollection33555626 d)
    ; fresh (c d) 
       (a === ilist33555625 c) 
       (b === ienumerable33555622 d) 
       (not_subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c d) 
       (a === ilist33555625 c) 
       (b === ireadonlylist33555627 d)
    ; fresh (c d) 
       (a === ilist33555625 c) 
       (b === icollection33555619 d) 
       (not_subtype (icollection33555619 c) (icollection33555619 d))
    ; fresh (c d) 
       (a === ilist33555625 c) 
       (b === ilist33555625 d) 
       (c =/= d)
    ; fresh (c d) 
       (a === object33554493) 
       (b === dogsdelegate33554494 c d)
    ; (a === object33554493) &&& (b === delegate33554565)
    ; (a === object33554493) &&& (b === iserializable33556234)
    ; (a === object33554493) &&& (b === icloneable33554495)
    ; (a === object33554493) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === object33554493) 
       (b === vector33554435 c)
    ; (a === object33554493) &&& (b === array33554517)
    ; (a === object33554493) &&& (b === istructuralequatable33555576)
    ; (a === object33554493) &&& (b === istructuralcomparable33555577)
    ; (a === object33554493) &&& (b === ienumerable33555569)
    ; (a === object33554493) &&& (b === icollection33555565)
    ; (a === object33554493) &&& (b === ilist33555573)
    ; fresh (c) 
       (a === object33554493) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === object33554493) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === object33554493) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === object33554493) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === object33554493) 
       (b === ilist33555625 c)
    ]
and subtype a b = 
  conde 
    [ fresh (c d e f) 
       (a === dogsdelegate33554494 c d) 
       (b === dogsdelegate33554494 e f) 
       (c === e) 
       (d === f)
    ; fresh (c d) 
       (a === dogsdelegate33554494 c d) 
       (b === delegate33554565)
    ; fresh (c d) 
       (a === dogsdelegate33554494 c d) 
       (b === iserializable33556234)
    ; fresh (c d) 
       (a === dogsdelegate33554494 c d) 
       (b === icloneable33554495)
    ; fresh (c d) 
       (a === dogsdelegate33554494 c d) 
       (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === dogsdelegate33554494 c d) 
       (b === object33554493)
    ; (a === delegate33554565) &&& (b === delegate33554565)
    ; (a === delegate33554565) &&& (b === iserializable33556234)
    ; (a === delegate33554565) &&& (b === icloneable33554495)
    ; (a === delegate33554565) &&& (b === object33554493)
    ; (a === iserializable33556234) &&& (b === iserializable33556234)
    ; (a === iserializable33556234) &&& (b === object33554493)
    ; (a === icloneable33554495) &&& (b === icloneable33554495)
    ; (a === icloneable33554495) &&& (b === object33554493)
    ; (a === multicastdelegate33554567) &&& (b === delegate33554565)
    ; (a === multicastdelegate33554567) &&& (b === iserializable33556234)
    ; (a === multicastdelegate33554567) &&& (b === icloneable33554495)
    ; (a === multicastdelegate33554567) &&& (b === multicastdelegate33554567)
    ; (a === multicastdelegate33554567) &&& (b === object33554493)
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === icloneable33554495)
    ; fresh (c d) 
       (a === vector33554435 c) 
       (b === vector33554435 d) 
       (covariant_subtype c d)
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === array33554517)
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === istructuralcomparable33555577)
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === ienumerable33555569)
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === icollection33555565)
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === ilist33555573)
    ; fresh (c d) 
       (a === vector33554435 c) 
       (b === ireadonlycollection33555626 d) 
       (subtype (ireadonlycollection33555626 c) (ireadonlycollection33555626 d))
    ; fresh (c d) 
       (a === vector33554435 c) 
       (b === ienumerable33555622 d) 
       (subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c d) 
       (a === vector33554435 c) 
       (b === ireadonlylist33555627 d) 
       (subtype (ireadonlylist33555627 c) (ireadonlylist33555627 d))
    ; fresh (c d) 
       (a === vector33554435 c) 
       (b === icollection33555619 d) 
       (subtype (icollection33555619 c) (icollection33555619 d))
    ; fresh (c d) 
       (a === vector33554435 c) 
       (b === ilist33555625 d) 
       (subtype (ilist33555625 c) (ilist33555625 d))
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === object33554493)
    ; (a === array33554517) &&& (b === icloneable33554495)
    ; (a === array33554517) &&& (b === array33554517)
    ; (a === array33554517) &&& (b === istructuralequatable33555576)
    ; (a === array33554517) &&& (b === istructuralcomparable33555577)
    ; (a === array33554517) &&& (b === ienumerable33555569)
    ; (a === array33554517) &&& (b === icollection33555565)
    ; (a === array33554517) &&& (b === ilist33555573)
    ; (a === array33554517) &&& (b === object33554493)
    ; (a === istructuralequatable33555576) &&& (b === istructuralequatable33555576)
    ; (a === istructuralequatable33555576) &&& (b === object33554493)
    ; (a === istructuralcomparable33555577) &&& (b === istructuralcomparable33555577)
    ; (a === istructuralcomparable33555577) &&& (b === object33554493)
    ; (a === ienumerable33555569) &&& (b === ienumerable33555569)
    ; (a === ienumerable33555569) &&& (b === object33554493)
    ; (a === icollection33555565) &&& (b === ienumerable33555569)
    ; (a === icollection33555565) &&& (b === icollection33555565)
    ; (a === icollection33555565) &&& (b === object33554493)
    ; (a === ilist33555573) &&& (b === ienumerable33555569)
    ; (a === ilist33555573) &&& (b === icollection33555565)
    ; (a === ilist33555573) &&& (b === ilist33555573)
    ; (a === ilist33555573) &&& (b === object33554493)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === ienumerable33555569)
    ; fresh (c d) 
       (a === ireadonlycollection33555626 c) 
       (b === ireadonlycollection33555626 d) 
       (covariant_subtype c d)
    ; fresh (c d) 
       (a === ireadonlycollection33555626 c) 
       (b === ienumerable33555622 d) 
       (subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === object33554493)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === ienumerable33555569)
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === ienumerable33555622 d) 
       (covariant_subtype c d)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === object33554493)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === ienumerable33555569)
    ; fresh (c d) 
       (a === ireadonlylist33555627 c) 
       (b === ireadonlycollection33555626 d) 
       (subtype (ireadonlycollection33555626 c) (ireadonlycollection33555626 d))
    ; fresh (c d) 
       (a === ireadonlylist33555627 c) 
       (b === ienumerable33555622 d) 
       (subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c d) 
       (a === ireadonlylist33555627 c) 
       (b === ireadonlylist33555627 d) 
       (covariant_subtype c d)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === object33554493)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === ienumerable33555569)
    ; fresh (c d) 
       (a === icollection33555619 c) 
       (b === ienumerable33555622 d) 
       (subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c d) 
       (a === icollection33555619 c) 
       (b === icollection33555619 d) 
       (c === d)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === object33554493)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === ienumerable33555569)
    ; fresh (c d) 
       (a === ilist33555625 c) 
       (b === ienumerable33555622 d) 
       (subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c d) 
       (a === ilist33555625 c) 
       (b === icollection33555619 d) 
       (subtype (icollection33555619 c) (icollection33555619 d))
    ; fresh (c d) 
       (a === ilist33555625 c) 
       (b === ilist33555625 d) 
       (c === d)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === object33554493)
    ; (a === object33554493) &&& (b === object33554493)
    ]
end

open Timeout 
let max_timeout = 20.0
let () =
   let my_reify r = r#reify term_reify in
   let stream =
      let open OCanren  in
      let open OCanren.Std in
      run (succ (succ (succ one)))
      (fun b c d a -> (subtype b (dogsdelegate33554494 c d)) &&& (subtype (vector33554435 a) a) &&& (not_subtype (vector33554435 a) a))
      (fun a b c d -> (my_reify a,my_reify b,my_reify c,my_reify d))
   in
   let start = Mtime_clock.counter () in
   try
      let answers = with_timeout max_timeout (fun () -> OCanren.Stream.take ~n:1 stream) in
      let span = Mtime_clock.count start in
      Printf.printf "Time: %f s\n%!" (Mtime.Span.to_s span);
      match answers with
      | [] -> print_endline "no answers"
      | [((a,b,c,d))] ->
         Format.printf "(%a,%a,%a,%a)\n%!" pp_term_logic a pp_term_logic b pp_term_logic c pp_term_logic d
      | _ -> failwith "should not happen"
   with Timeout -> Format.printf "Timeout after %f s\n%!" max_timeout
