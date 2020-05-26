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
let array33554517 = w !!"array33554517" (Std.List.list[])
let istructuralequatable33555576 = w !!"istructuralequatable33555576" (Std.List.list[])
let istructuralcomparable33555577 = w !!"istructuralcomparable33555577" (Std.List.list[])
let ienumerable33555569 = w !!"ienumerable33555569" (Std.List.list[])
let icollection33555565 = w !!"icollection33555565" (Std.List.list[])
let ilist33555573 = w !!"ilist33555573" (Std.List.list[])
let icloneable33554495 = w !!"icloneable33554495" (Std.List.list[])
let action33554497 = w !!"action33554497" (Std.List.list[])
let delegate33554565 = w !!"delegate33554565" (Std.List.list[])
let iserializable33556234 = w !!"iserializable33556234" (Std.List.list[])
let multicastdelegate33554567 = w !!"multicastdelegate33554567" (Std.List.list[])
let tuple33554528 a = w !!"tuple33554528" (Std.List.list[a])
let ituple33556673 = w !!"ituple33556673" (Std.List.list[])
let itupleinternal33554526 = w !!"itupleinternal33554526" (Std.List.list[])
let icomparable33554520 = w !!"icomparable33554520" (Std.List.list[])
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
    [ (a === array33554517)
    ; (a === istructuralequatable33555576)
    ; (a === istructuralcomparable33555577)
    ; (a === ienumerable33555569)
    ; (a === icollection33555565)
    ; (a === ilist33555573)
    ; (a === icloneable33554495)
    ; (a === action33554497)
    ; (a === delegate33554565)
    ; (a === iserializable33556234)
    ; (a === multicastdelegate33554567)
    ; fresh (b) 
       (a === tuple33554528 b)
    ; (a === ituple33556673)
    ; (a === itupleinternal33554526)
    ; (a === icomparable33554520)
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
    [ (a === array33554517) &&& (b === action33554497)
    ; (a === array33554517) &&& (b === delegate33554565)
    ; (a === array33554517) &&& (b === iserializable33556234)
    ; (a === array33554517) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === array33554517) 
       (b === tuple33554528 c)
    ; (a === array33554517) &&& (b === ituple33556673)
    ; (a === array33554517) &&& (b === itupleinternal33554526)
    ; (a === array33554517) &&& (b === icomparable33554520)
    ; (a === istructuralequatable33555576) &&& (b === array33554517)
    ; (a === istructuralequatable33555576) &&& (b === istructuralcomparable33555577)
    ; (a === istructuralequatable33555576) &&& (b === ienumerable33555569)
    ; (a === istructuralequatable33555576) &&& (b === icollection33555565)
    ; (a === istructuralequatable33555576) &&& (b === ilist33555573)
    ; (a === istructuralequatable33555576) &&& (b === icloneable33554495)
    ; (a === istructuralequatable33555576) &&& (b === action33554497)
    ; (a === istructuralequatable33555576) &&& (b === delegate33554565)
    ; (a === istructuralequatable33555576) &&& (b === iserializable33556234)
    ; (a === istructuralequatable33555576) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === istructuralequatable33555576) 
       (b === tuple33554528 c)
    ; (a === istructuralequatable33555576) &&& (b === ituple33556673)
    ; (a === istructuralequatable33555576) &&& (b === itupleinternal33554526)
    ; (a === istructuralequatable33555576) &&& (b === icomparable33554520)
    ; (a === istructuralcomparable33555577) &&& (b === array33554517)
    ; (a === istructuralcomparable33555577) &&& (b === istructuralequatable33555576)
    ; (a === istructuralcomparable33555577) &&& (b === ienumerable33555569)
    ; (a === istructuralcomparable33555577) &&& (b === icollection33555565)
    ; (a === istructuralcomparable33555577) &&& (b === ilist33555573)
    ; (a === istructuralcomparable33555577) &&& (b === icloneable33554495)
    ; (a === istructuralcomparable33555577) &&& (b === action33554497)
    ; (a === istructuralcomparable33555577) &&& (b === delegate33554565)
    ; (a === istructuralcomparable33555577) &&& (b === iserializable33556234)
    ; (a === istructuralcomparable33555577) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === istructuralcomparable33555577) 
       (b === tuple33554528 c)
    ; (a === istructuralcomparable33555577) &&& (b === ituple33556673)
    ; (a === istructuralcomparable33555577) &&& (b === itupleinternal33554526)
    ; (a === istructuralcomparable33555577) &&& (b === icomparable33554520)
    ; (a === ienumerable33555569) &&& (b === array33554517)
    ; (a === ienumerable33555569) &&& (b === istructuralequatable33555576)
    ; (a === ienumerable33555569) &&& (b === istructuralcomparable33555577)
    ; (a === ienumerable33555569) &&& (b === icollection33555565)
    ; (a === ienumerable33555569) &&& (b === ilist33555573)
    ; (a === ienumerable33555569) &&& (b === icloneable33554495)
    ; (a === ienumerable33555569) &&& (b === action33554497)
    ; (a === ienumerable33555569) &&& (b === delegate33554565)
    ; (a === ienumerable33555569) &&& (b === iserializable33556234)
    ; (a === ienumerable33555569) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === tuple33554528 c)
    ; (a === ienumerable33555569) &&& (b === ituple33556673)
    ; (a === ienumerable33555569) &&& (b === itupleinternal33554526)
    ; (a === ienumerable33555569) &&& (b === icomparable33554520)
    ; (a === icollection33555565) &&& (b === array33554517)
    ; (a === icollection33555565) &&& (b === istructuralequatable33555576)
    ; (a === icollection33555565) &&& (b === istructuralcomparable33555577)
    ; (a === icollection33555565) &&& (b === ilist33555573)
    ; (a === icollection33555565) &&& (b === icloneable33554495)
    ; (a === icollection33555565) &&& (b === action33554497)
    ; (a === icollection33555565) &&& (b === delegate33554565)
    ; (a === icollection33555565) &&& (b === iserializable33556234)
    ; (a === icollection33555565) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === icollection33555565) 
       (b === tuple33554528 c)
    ; (a === icollection33555565) &&& (b === ituple33556673)
    ; (a === icollection33555565) &&& (b === itupleinternal33554526)
    ; (a === icollection33555565) &&& (b === icomparable33554520)
    ; (a === ilist33555573) &&& (b === array33554517)
    ; (a === ilist33555573) &&& (b === istructuralequatable33555576)
    ; (a === ilist33555573) &&& (b === istructuralcomparable33555577)
    ; (a === ilist33555573) &&& (b === icloneable33554495)
    ; (a === ilist33555573) &&& (b === action33554497)
    ; (a === ilist33555573) &&& (b === delegate33554565)
    ; (a === ilist33555573) &&& (b === iserializable33556234)
    ; (a === ilist33555573) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === ilist33555573) 
       (b === tuple33554528 c)
    ; (a === ilist33555573) &&& (b === ituple33556673)
    ; (a === ilist33555573) &&& (b === itupleinternal33554526)
    ; (a === ilist33555573) &&& (b === icomparable33554520)
    ; (a === icloneable33554495) &&& (b === array33554517)
    ; (a === icloneable33554495) &&& (b === istructuralequatable33555576)
    ; (a === icloneable33554495) &&& (b === istructuralcomparable33555577)
    ; (a === icloneable33554495) &&& (b === ienumerable33555569)
    ; (a === icloneable33554495) &&& (b === icollection33555565)
    ; (a === icloneable33554495) &&& (b === ilist33555573)
    ; (a === icloneable33554495) &&& (b === action33554497)
    ; (a === icloneable33554495) &&& (b === delegate33554565)
    ; (a === icloneable33554495) &&& (b === iserializable33556234)
    ; (a === icloneable33554495) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === icloneable33554495) 
       (b === tuple33554528 c)
    ; (a === icloneable33554495) &&& (b === ituple33556673)
    ; (a === icloneable33554495) &&& (b === itupleinternal33554526)
    ; (a === icloneable33554495) &&& (b === icomparable33554520)
    ; (a === action33554497) &&& (b === array33554517)
    ; (a === action33554497) &&& (b === istructuralequatable33555576)
    ; (a === action33554497) &&& (b === istructuralcomparable33555577)
    ; (a === action33554497) &&& (b === ienumerable33555569)
    ; (a === action33554497) &&& (b === icollection33555565)
    ; (a === action33554497) &&& (b === ilist33555573)
    ; fresh (c) 
       (a === action33554497) 
       (b === tuple33554528 c)
    ; (a === action33554497) &&& (b === ituple33556673)
    ; (a === action33554497) &&& (b === itupleinternal33554526)
    ; (a === action33554497) &&& (b === icomparable33554520)
    ; (a === delegate33554565) &&& (b === array33554517)
    ; (a === delegate33554565) &&& (b === istructuralequatable33555576)
    ; (a === delegate33554565) &&& (b === istructuralcomparable33555577)
    ; (a === delegate33554565) &&& (b === ienumerable33555569)
    ; (a === delegate33554565) &&& (b === icollection33555565)
    ; (a === delegate33554565) &&& (b === ilist33555573)
    ; (a === delegate33554565) &&& (b === action33554497)
    ; (a === delegate33554565) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === delegate33554565) 
       (b === tuple33554528 c)
    ; (a === delegate33554565) &&& (b === ituple33556673)
    ; (a === delegate33554565) &&& (b === itupleinternal33554526)
    ; (a === delegate33554565) &&& (b === icomparable33554520)
    ; (a === iserializable33556234) &&& (b === array33554517)
    ; (a === iserializable33556234) &&& (b === istructuralequatable33555576)
    ; (a === iserializable33556234) &&& (b === istructuralcomparable33555577)
    ; (a === iserializable33556234) &&& (b === ienumerable33555569)
    ; (a === iserializable33556234) &&& (b === icollection33555565)
    ; (a === iserializable33556234) &&& (b === ilist33555573)
    ; (a === iserializable33556234) &&& (b === icloneable33554495)
    ; (a === iserializable33556234) &&& (b === action33554497)
    ; (a === iserializable33556234) &&& (b === delegate33554565)
    ; (a === iserializable33556234) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === iserializable33556234) 
       (b === tuple33554528 c)
    ; (a === iserializable33556234) &&& (b === ituple33556673)
    ; (a === iserializable33556234) &&& (b === itupleinternal33554526)
    ; (a === iserializable33556234) &&& (b === icomparable33554520)
    ; (a === multicastdelegate33554567) &&& (b === array33554517)
    ; (a === multicastdelegate33554567) &&& (b === istructuralequatable33555576)
    ; (a === multicastdelegate33554567) &&& (b === istructuralcomparable33555577)
    ; (a === multicastdelegate33554567) &&& (b === ienumerable33555569)
    ; (a === multicastdelegate33554567) &&& (b === icollection33555565)
    ; (a === multicastdelegate33554567) &&& (b === ilist33555573)
    ; (a === multicastdelegate33554567) &&& (b === action33554497)
    ; fresh (c) 
       (a === multicastdelegate33554567) 
       (b === tuple33554528 c)
    ; (a === multicastdelegate33554567) &&& (b === ituple33556673)
    ; (a === multicastdelegate33554567) &&& (b === itupleinternal33554526)
    ; (a === multicastdelegate33554567) &&& (b === icomparable33554520)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === array33554517)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === ienumerable33555569)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === icollection33555565)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === ilist33555573)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === icloneable33554495)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === action33554497)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === delegate33554565)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === iserializable33556234)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === tuple33554528 c) 
       (b === tuple33554528 d) 
       (c =/= d)
    ; (a === ituple33556673) &&& (b === array33554517)
    ; (a === ituple33556673) &&& (b === istructuralequatable33555576)
    ; (a === ituple33556673) &&& (b === istructuralcomparable33555577)
    ; (a === ituple33556673) &&& (b === ienumerable33555569)
    ; (a === ituple33556673) &&& (b === icollection33555565)
    ; (a === ituple33556673) &&& (b === ilist33555573)
    ; (a === ituple33556673) &&& (b === icloneable33554495)
    ; (a === ituple33556673) &&& (b === action33554497)
    ; (a === ituple33556673) &&& (b === delegate33554565)
    ; (a === ituple33556673) &&& (b === iserializable33556234)
    ; (a === ituple33556673) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === ituple33556673) 
       (b === tuple33554528 c)
    ; (a === ituple33556673) &&& (b === itupleinternal33554526)
    ; (a === ituple33556673) &&& (b === icomparable33554520)
    ; (a === itupleinternal33554526) &&& (b === array33554517)
    ; (a === itupleinternal33554526) &&& (b === istructuralequatable33555576)
    ; (a === itupleinternal33554526) &&& (b === istructuralcomparable33555577)
    ; (a === itupleinternal33554526) &&& (b === ienumerable33555569)
    ; (a === itupleinternal33554526) &&& (b === icollection33555565)
    ; (a === itupleinternal33554526) &&& (b === ilist33555573)
    ; (a === itupleinternal33554526) &&& (b === icloneable33554495)
    ; (a === itupleinternal33554526) &&& (b === action33554497)
    ; (a === itupleinternal33554526) &&& (b === delegate33554565)
    ; (a === itupleinternal33554526) &&& (b === iserializable33556234)
    ; (a === itupleinternal33554526) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === itupleinternal33554526) 
       (b === tuple33554528 c)
    ; (a === itupleinternal33554526) &&& (b === icomparable33554520)
    ; (a === icomparable33554520) &&& (b === array33554517)
    ; (a === icomparable33554520) &&& (b === istructuralequatable33555576)
    ; (a === icomparable33554520) &&& (b === istructuralcomparable33555577)
    ; (a === icomparable33554520) &&& (b === ienumerable33555569)
    ; (a === icomparable33554520) &&& (b === icollection33555565)
    ; (a === icomparable33554520) &&& (b === ilist33555573)
    ; (a === icomparable33554520) &&& (b === icloneable33554495)
    ; (a === icomparable33554520) &&& (b === action33554497)
    ; (a === icomparable33554520) &&& (b === delegate33554565)
    ; (a === icomparable33554520) &&& (b === iserializable33556234)
    ; (a === icomparable33554520) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === icomparable33554520) 
       (b === tuple33554528 c)
    ; (a === icomparable33554520) &&& (b === ituple33556673)
    ; (a === icomparable33554520) &&& (b === itupleinternal33554526)
    ; (a === object33554493) &&& (b === array33554517)
    ; (a === object33554493) &&& (b === istructuralequatable33555576)
    ; (a === object33554493) &&& (b === istructuralcomparable33555577)
    ; (a === object33554493) &&& (b === ienumerable33555569)
    ; (a === object33554493) &&& (b === icollection33555565)
    ; (a === object33554493) &&& (b === ilist33555573)
    ; (a === object33554493) &&& (b === icloneable33554495)
    ; (a === object33554493) &&& (b === action33554497)
    ; (a === object33554493) &&& (b === delegate33554565)
    ; (a === object33554493) &&& (b === iserializable33556234)
    ; (a === object33554493) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === object33554493) 
       (b === tuple33554528 c)
    ; (a === object33554493) &&& (b === ituple33556673)
    ; (a === object33554493) &&& (b === itupleinternal33554526)
    ; (a === object33554493) &&& (b === icomparable33554520)
    ]
and subtype a b = 
  conde 
    [ (a === array33554517) &&& (b === array33554517)
    ; (a === array33554517) &&& (b === istructuralequatable33555576)
    ; (a === array33554517) &&& (b === istructuralcomparable33555577)
    ; (a === array33554517) &&& (b === ienumerable33555569)
    ; (a === array33554517) &&& (b === icollection33555565)
    ; (a === array33554517) &&& (b === ilist33555573)
    ; (a === array33554517) &&& (b === icloneable33554495)
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
    ; (a === icloneable33554495) &&& (b === icloneable33554495)
    ; (a === icloneable33554495) &&& (b === object33554493)
    ; (a === action33554497) &&& (b === icloneable33554495)
    ; (a === action33554497) &&& (b === action33554497)
    ; (a === action33554497) &&& (b === delegate33554565)
    ; (a === action33554497) &&& (b === iserializable33556234)
    ; (a === action33554497) &&& (b === multicastdelegate33554567)
    ; (a === action33554497) &&& (b === object33554493)
    ; (a === delegate33554565) &&& (b === icloneable33554495)
    ; (a === delegate33554565) &&& (b === delegate33554565)
    ; (a === delegate33554565) &&& (b === iserializable33556234)
    ; (a === delegate33554565) &&& (b === object33554493)
    ; (a === iserializable33556234) &&& (b === iserializable33556234)
    ; (a === iserializable33556234) &&& (b === object33554493)
    ; (a === multicastdelegate33554567) &&& (b === icloneable33554495)
    ; (a === multicastdelegate33554567) &&& (b === delegate33554565)
    ; (a === multicastdelegate33554567) &&& (b === iserializable33556234)
    ; (a === multicastdelegate33554567) &&& (b === multicastdelegate33554567)
    ; (a === multicastdelegate33554567) &&& (b === object33554493)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === istructuralcomparable33555577)
    ; fresh (c d) 
       (a === tuple33554528 c) 
       (b === tuple33554528 d) 
       (c === d)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === ituple33556673)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === itupleinternal33554526)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === icomparable33554520)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === object33554493)
    ; (a === ituple33556673) &&& (b === ituple33556673)
    ; (a === ituple33556673) &&& (b === object33554493)
    ; (a === itupleinternal33554526) &&& (b === ituple33556673)
    ; (a === itupleinternal33554526) &&& (b === itupleinternal33554526)
    ; (a === itupleinternal33554526) &&& (b === object33554493)
    ; (a === icomparable33554520) &&& (b === icomparable33554520)
    ; (a === icomparable33554520) &&& (b === object33554493)
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
      run (succ (succ one))
      (fun b c a -> (subtype b action33554497) &&& (subtype c array33554517) &&& (subtype b array33554517) &&& (subtype a (tuple33554528 a)) &&& (subtype b (tuple33554528 a)) &&& (subtype a (tuple33554528 (tuple33554528 a))) &&& (subtype b (tuple33554528 (tuple33554528 a))) &&& (not_subtype a (tuple33554528 (tuple33554528 a))) &&& (not_subtype b (tuple33554528 (tuple33554528 a))) &&& (not_subtype a (tuple33554528 a)) &&& (not_subtype b (tuple33554528 a)))
      (fun a b c -> (my_reify a,my_reify b,my_reify c))
   in
   let start = Mtime_clock.counter () in
   try
      let answers = with_timeout max_timeout (fun () -> OCanren.Stream.take ~n:1 stream) in
      let span = Mtime_clock.count start in
      Printf.printf "Time: %f s\n%!" (Mtime.Span.to_s span);
      match answers with
      | [] -> print_endline "no answers"
      | [((a,b,c))] ->
         Format.printf "(%a,%a,%a)\n%!" pp_term_logic a pp_term_logic b pp_term_logic c
      | _ -> failwith "should not happen"
   with Timeout -> Format.printf "Timeout after %f s\n%!" max_timeout
