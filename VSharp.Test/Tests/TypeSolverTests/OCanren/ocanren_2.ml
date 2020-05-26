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
    ; (a === icollection33555565) &&& (b === array33554517)
    ; (a === icollection33555565) &&& (b === istructuralequatable33555576)
    ; (a === icollection33555565) &&& (b === istructuralcomparable33555577)
    ; (a === icollection33555565) &&& (b === ilist33555573)
    ; (a === icollection33555565) &&& (b === icloneable33554495)
    ; (a === icollection33555565) &&& (b === action33554497)
    ; (a === icollection33555565) &&& (b === delegate33554565)
    ; (a === icollection33555565) &&& (b === iserializable33556234)
    ; (a === icollection33555565) &&& (b === multicastdelegate33554567)
    ; (a === ilist33555573) &&& (b === array33554517)
    ; (a === ilist33555573) &&& (b === istructuralequatable33555576)
    ; (a === ilist33555573) &&& (b === istructuralcomparable33555577)
    ; (a === ilist33555573) &&& (b === icloneable33554495)
    ; (a === ilist33555573) &&& (b === action33554497)
    ; (a === ilist33555573) &&& (b === delegate33554565)
    ; (a === ilist33555573) &&& (b === iserializable33556234)
    ; (a === ilist33555573) &&& (b === multicastdelegate33554567)
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
    ; (a === action33554497) &&& (b === array33554517)
    ; (a === action33554497) &&& (b === istructuralequatable33555576)
    ; (a === action33554497) &&& (b === istructuralcomparable33555577)
    ; (a === action33554497) &&& (b === ienumerable33555569)
    ; (a === action33554497) &&& (b === icollection33555565)
    ; (a === action33554497) &&& (b === ilist33555573)
    ; (a === delegate33554565) &&& (b === array33554517)
    ; (a === delegate33554565) &&& (b === istructuralequatable33555576)
    ; (a === delegate33554565) &&& (b === istructuralcomparable33555577)
    ; (a === delegate33554565) &&& (b === ienumerable33555569)
    ; (a === delegate33554565) &&& (b === icollection33555565)
    ; (a === delegate33554565) &&& (b === ilist33555573)
    ; (a === delegate33554565) &&& (b === action33554497)
    ; (a === delegate33554565) &&& (b === multicastdelegate33554567)
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
    ; (a === multicastdelegate33554567) &&& (b === array33554517)
    ; (a === multicastdelegate33554567) &&& (b === istructuralequatable33555576)
    ; (a === multicastdelegate33554567) &&& (b === istructuralcomparable33555577)
    ; (a === multicastdelegate33554567) &&& (b === ienumerable33555569)
    ; (a === multicastdelegate33554567) &&& (b === icollection33555565)
    ; (a === multicastdelegate33554567) &&& (b === ilist33555573)
    ; (a === multicastdelegate33554567) &&& (b === action33554497)
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
      (fun a b -> (not_subtype a action33554497) &&& (not_subtype b array33554517) &&& (not_subtype a array33554517))
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
