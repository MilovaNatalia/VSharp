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
let vector33554435 a = w !!"vector33554435" (Std.List.list[a])
let array33554517 = w !!"array33554517" (Std.List.list[])
let istructuralequatable33555576 = w !!"istructuralequatable33555576" (Std.List.list[])
let istructuralcomparable33555577 = w !!"istructuralcomparable33555577" (Std.List.list[])
let ienumerable33555569 = w !!"ienumerable33555569" (Std.List.list[])
let icollection33555565 = w !!"icollection33555565" (Std.List.list[])
let ilist33555573 = w !!"ilist33555573" (Std.List.list[])
let icloneable33554495 = w !!"icloneable33554495" (Std.List.list[])
let ireadonlycollection33555626 a = w !!"ireadonlycollection33555626" (Std.List.list[a])
let ienumerable33555622 a = w !!"ienumerable33555622" (Std.List.list[a])
let ireadonlylist33555627 a = w !!"ireadonlylist33555627" (Std.List.list[a])
let icollection33555619 a = w !!"icollection33555619" (Std.List.list[a])
let ilist33555625 a = w !!"ilist33555625" (Std.List.list[a])
let iqueryable33554759 a = w !!"iqueryable33554759" (Std.List.list[a])
let iqueryable33554758 = w !!"iqueryable33554758" (Std.List.list[])
let expression33554963 = w !!"expression33554963" (Std.List.list[])
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
    [ fresh (b) 
       (a === vector33554435 b)
    ; (a === array33554517)
    ; (a === istructuralequatable33555576)
    ; (a === istructuralcomparable33555577)
    ; (a === ienumerable33555569)
    ; (a === icollection33555565)
    ; (a === ilist33555573)
    ; (a === icloneable33554495)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c)
    ; fresh (d) 
       (a === ienumerable33555622 d)
    ; fresh (e) 
       (a === ireadonlylist33555627 e)
    ; fresh (f) 
       (a === icollection33555619 f)
    ; fresh (g) 
       (a === ilist33555625 g)
    ; fresh (h) 
       (a === iqueryable33554759 h)
    ; (a === iqueryable33554758)
    ; (a === expression33554963)
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
    [ fresh (c d) 
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
       (a === vector33554435 c) 
       (b === iqueryable33554759 d)
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === iqueryable33554758)
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === expression33554963)
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
    ; fresh (c) 
       (a === array33554517) 
       (b === iqueryable33554759 c)
    ; (a === array33554517) &&& (b === iqueryable33554758)
    ; (a === array33554517) &&& (b === expression33554963)
    ; fresh (c) 
       (a === istructuralequatable33555576) 
       (b === vector33554435 c)
    ; (a === istructuralequatable33555576) &&& (b === array33554517)
    ; (a === istructuralequatable33555576) &&& (b === istructuralcomparable33555577)
    ; (a === istructuralequatable33555576) &&& (b === ienumerable33555569)
    ; (a === istructuralequatable33555576) &&& (b === icollection33555565)
    ; (a === istructuralequatable33555576) &&& (b === ilist33555573)
    ; (a === istructuralequatable33555576) &&& (b === icloneable33554495)
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
    ; fresh (c) 
       (a === istructuralequatable33555576) 
       (b === iqueryable33554759 c)
    ; (a === istructuralequatable33555576) &&& (b === iqueryable33554758)
    ; (a === istructuralequatable33555576) &&& (b === expression33554963)
    ; fresh (c) 
       (a === istructuralcomparable33555577) 
       (b === vector33554435 c)
    ; (a === istructuralcomparable33555577) &&& (b === array33554517)
    ; (a === istructuralcomparable33555577) &&& (b === istructuralequatable33555576)
    ; (a === istructuralcomparable33555577) &&& (b === ienumerable33555569)
    ; (a === istructuralcomparable33555577) &&& (b === icollection33555565)
    ; (a === istructuralcomparable33555577) &&& (b === ilist33555573)
    ; (a === istructuralcomparable33555577) &&& (b === icloneable33554495)
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
    ; fresh (c) 
       (a === istructuralcomparable33555577) 
       (b === iqueryable33554759 c)
    ; (a === istructuralcomparable33555577) &&& (b === iqueryable33554758)
    ; (a === istructuralcomparable33555577) &&& (b === expression33554963)
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === vector33554435 c)
    ; (a === ienumerable33555569) &&& (b === array33554517)
    ; (a === ienumerable33555569) &&& (b === istructuralequatable33555576)
    ; (a === ienumerable33555569) &&& (b === istructuralcomparable33555577)
    ; (a === ienumerable33555569) &&& (b === icollection33555565)
    ; (a === ienumerable33555569) &&& (b === ilist33555573)
    ; (a === ienumerable33555569) &&& (b === icloneable33554495)
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
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === iqueryable33554759 c)
    ; (a === ienumerable33555569) &&& (b === iqueryable33554758)
    ; (a === ienumerable33555569) &&& (b === expression33554963)
    ; fresh (c) 
       (a === icollection33555565) 
       (b === vector33554435 c)
    ; (a === icollection33555565) &&& (b === array33554517)
    ; (a === icollection33555565) &&& (b === istructuralequatable33555576)
    ; (a === icollection33555565) &&& (b === istructuralcomparable33555577)
    ; (a === icollection33555565) &&& (b === ilist33555573)
    ; (a === icollection33555565) &&& (b === icloneable33554495)
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
    ; fresh (c) 
       (a === icollection33555565) 
       (b === iqueryable33554759 c)
    ; (a === icollection33555565) &&& (b === iqueryable33554758)
    ; (a === icollection33555565) &&& (b === expression33554963)
    ; fresh (c) 
       (a === ilist33555573) 
       (b === vector33554435 c)
    ; (a === ilist33555573) &&& (b === array33554517)
    ; (a === ilist33555573) &&& (b === istructuralequatable33555576)
    ; (a === ilist33555573) &&& (b === istructuralcomparable33555577)
    ; (a === ilist33555573) &&& (b === icloneable33554495)
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
    ; fresh (c) 
       (a === ilist33555573) 
       (b === iqueryable33554759 c)
    ; (a === ilist33555573) &&& (b === iqueryable33554758)
    ; (a === ilist33555573) &&& (b === expression33554963)
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
    ; fresh (c) 
       (a === icloneable33554495) 
       (b === iqueryable33554759 c)
    ; (a === icloneable33554495) &&& (b === iqueryable33554758)
    ; (a === icloneable33554495) &&& (b === expression33554963)
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
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === icloneable33554495)
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
    ; fresh (c d) 
       (a === ireadonlycollection33555626 c) 
       (b === iqueryable33554759 d)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === iqueryable33554758)
    ; fresh (c) 
       (a === ireadonlycollection33555626 c) 
       (b === expression33554963)
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
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === icloneable33554495)
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
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === iqueryable33554759 d)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === iqueryable33554758)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === expression33554963)
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
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === icloneable33554495)
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
    ; fresh (c d) 
       (a === ireadonlylist33555627 c) 
       (b === iqueryable33554759 d)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === iqueryable33554758)
    ; fresh (c) 
       (a === ireadonlylist33555627 c) 
       (b === expression33554963)
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
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === icloneable33554495)
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
    ; fresh (c d) 
       (a === icollection33555619 c) 
       (b === iqueryable33554759 d)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === iqueryable33554758)
    ; fresh (c) 
       (a === icollection33555619 c) 
       (b === expression33554963)
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
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === icloneable33554495)
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
       (a === ilist33555625 c) 
       (b === iqueryable33554759 d)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === iqueryable33554758)
    ; fresh (c) 
       (a === ilist33555625 c) 
       (b === expression33554963)
    ; fresh (c d) 
       (a === iqueryable33554759 c) 
       (b === vector33554435 d)
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === array33554517)
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === istructuralcomparable33555577)
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === icollection33555565)
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === ilist33555573)
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === icloneable33554495)
    ; fresh (c d) 
       (a === iqueryable33554759 c) 
       (b === ireadonlycollection33555626 d)
    ; fresh (c d) 
       (a === iqueryable33554759 c) 
       (b === ienumerable33555622 d) 
       (not_subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c d) 
       (a === iqueryable33554759 c) 
       (b === ireadonlylist33555627 d)
    ; fresh (c d) 
       (a === iqueryable33554759 c) 
       (b === icollection33555619 d)
    ; fresh (c d) 
       (a === iqueryable33554759 c) 
       (b === ilist33555625 d)
    ; fresh (c d) 
       (a === iqueryable33554759 c) 
       (b === iqueryable33554759 d) 
       (not_covariant_subtype c d)
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === expression33554963)
    ; fresh (c) 
       (a === iqueryable33554758) 
       (b === vector33554435 c)
    ; (a === iqueryable33554758) &&& (b === array33554517)
    ; (a === iqueryable33554758) &&& (b === istructuralequatable33555576)
    ; (a === iqueryable33554758) &&& (b === istructuralcomparable33555577)
    ; (a === iqueryable33554758) &&& (b === icollection33555565)
    ; (a === iqueryable33554758) &&& (b === ilist33555573)
    ; (a === iqueryable33554758) &&& (b === icloneable33554495)
    ; fresh (c) 
       (a === iqueryable33554758) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === iqueryable33554758) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === iqueryable33554758) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === iqueryable33554758) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === iqueryable33554758) 
       (b === ilist33555625 c)
    ; fresh (c) 
       (a === iqueryable33554758) 
       (b === iqueryable33554759 c)
    ; (a === iqueryable33554758) &&& (b === expression33554963)
    ; fresh (c) 
       (a === expression33554963) 
       (b === vector33554435 c)
    ; (a === expression33554963) &&& (b === array33554517)
    ; (a === expression33554963) &&& (b === istructuralequatable33555576)
    ; (a === expression33554963) &&& (b === istructuralcomparable33555577)
    ; (a === expression33554963) &&& (b === ienumerable33555569)
    ; (a === expression33554963) &&& (b === icollection33555565)
    ; (a === expression33554963) &&& (b === ilist33555573)
    ; (a === expression33554963) &&& (b === icloneable33554495)
    ; fresh (c) 
       (a === expression33554963) 
       (b === ireadonlycollection33555626 c)
    ; fresh (c) 
       (a === expression33554963) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === expression33554963) 
       (b === ireadonlylist33555627 c)
    ; fresh (c) 
       (a === expression33554963) 
       (b === icollection33555619 c)
    ; fresh (c) 
       (a === expression33554963) 
       (b === ilist33555625 c)
    ; fresh (c) 
       (a === expression33554963) 
       (b === iqueryable33554759 c)
    ; (a === expression33554963) &&& (b === iqueryable33554758)
    ; fresh (c) 
       (a === object33554493) 
       (b === vector33554435 c)
    ; (a === object33554493) &&& (b === array33554517)
    ; (a === object33554493) &&& (b === istructuralequatable33555576)
    ; (a === object33554493) &&& (b === istructuralcomparable33555577)
    ; (a === object33554493) &&& (b === ienumerable33555569)
    ; (a === object33554493) &&& (b === icollection33555565)
    ; (a === object33554493) &&& (b === ilist33555573)
    ; (a === object33554493) &&& (b === icloneable33554495)
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
    ; fresh (c) 
       (a === object33554493) 
       (b === iqueryable33554759 c)
    ; (a === object33554493) &&& (b === iqueryable33554758)
    ; (a === object33554493) &&& (b === expression33554963)
    ]
and subtype a b = 
  conde 
    [ fresh (c d) 
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
    ; fresh (c) 
       (a === vector33554435 c) 
       (b === icloneable33554495)
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
    ; (a === array33554517) &&& (b === array33554517)
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
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === ienumerable33555569)
    ; fresh (c d) 
       (a === iqueryable33554759 c) 
       (b === ienumerable33555622 d) 
       (subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c d) 
       (a === iqueryable33554759 c) 
       (b === iqueryable33554759 d) 
       (covariant_subtype c d)
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === iqueryable33554758)
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === object33554493)
    ; (a === iqueryable33554758) &&& (b === ienumerable33555569)
    ; (a === iqueryable33554758) &&& (b === iqueryable33554758)
    ; (a === iqueryable33554758) &&& (b === object33554493)
    ; (a === expression33554963) &&& (b === expression33554963)
    ; (a === expression33554963) &&& (b === object33554493)
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
      run (succ one)
      (fun b a -> (subtype b (vector33554435 b)) &&& (subtype expression33554963 (iqueryable33554759 a)) &&& (not_subtype expression33554963 (iqueryable33554759 a)) &&& (is_reference b))
      (fun a b -> (my_reify a,my_reify b))
   in
   let start = Mtime_clock.counter () in
   try
      let answers = with_timeout max_timeout (fun () -> OCanren.Stream.take ~n:1 stream) in
      let span = Mtime_clock.count start in
      Printf.printf "Time: %f s\n%!" (Mtime.Span.to_s span);
      match answers with
      | [] -> print_endline "no answers"
      | [((a,b))] ->
         Format.printf "(%a,%a)\n%!" pp_term_logic a pp_term_logic b
      | _ -> failwith "should not happen"
   with Timeout -> Format.printf "Timeout after %f s\n%!" max_timeout
