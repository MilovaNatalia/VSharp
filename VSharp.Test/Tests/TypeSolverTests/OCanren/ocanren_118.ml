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
let iserializable33556234 = w !!"iserializable33556234" (Std.List.list[])
let ienumerable33555622 a = w !!"ienumerable33555622" (Std.List.list[a])
let ienumerable33555569 = w !!"ienumerable33555569" (Std.List.list[])
let action33554497 = w !!"action33554497" (Std.List.list[])
let delegate33554565 = w !!"delegate33554565" (Std.List.list[])
let icloneable33554495 = w !!"icloneable33554495" (Std.List.list[])
let multicastdelegate33554567 = w !!"multicastdelegate33554567" (Std.List.list[])
let rec33554487 a = w !!"rec33554487" (Std.List.list[a])
let mutualrec33554488 a b = w !!"mutualrec33554488" (Std.List.list[a;b])
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
and default_constructor a = 
  conde 
    [ fresh (c) 
       (a === rec33554487 c)
    ; fresh (d e) 
       (a === mutualrec33554488 d e)
    ; (a === object33554493)
    ]
and is_reference a = 
  conde 
    [ (a === iserializable33556234)
    ; fresh (b) 
       (a === ienumerable33555622 b)
    ; (a === ienumerable33555569)
    ; (a === action33554497)
    ; (a === delegate33554565)
    ; (a === icloneable33554495)
    ; (a === multicastdelegate33554567)
    ; fresh (c) 
       (a === rec33554487 c)
    ; fresh (d e) 
       (a === mutualrec33554488 d e)
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
    [ fresh (c) 
       (a === iserializable33556234) 
       (b === ienumerable33555622 c)
    ; (a === iserializable33556234) &&& (b === ienumerable33555569)
    ; (a === iserializable33556234) &&& (b === action33554497)
    ; (a === iserializable33556234) &&& (b === delegate33554565)
    ; (a === iserializable33556234) &&& (b === icloneable33554495)
    ; (a === iserializable33556234) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === iserializable33556234) 
       (b === rec33554487 c)
    ; fresh (c d) 
       (a === iserializable33556234) 
       (b === mutualrec33554488 c d)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === iserializable33556234)
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === ienumerable33555622 d) 
       (not_covariant_subtype c d)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === action33554497)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === delegate33554565)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === icloneable33554495)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === rec33554487 d)
    ; fresh (c d e) 
       (a === ienumerable33555622 c) 
       (b === mutualrec33554488 d e)
    ; (a === ienumerable33555569) &&& (b === iserializable33556234)
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === ienumerable33555622 c)
    ; (a === ienumerable33555569) &&& (b === action33554497)
    ; (a === ienumerable33555569) &&& (b === delegate33554565)
    ; (a === ienumerable33555569) &&& (b === icloneable33554495)
    ; (a === ienumerable33555569) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === rec33554487 c)
    ; fresh (c d) 
       (a === ienumerable33555569) 
       (b === mutualrec33554488 c d)
    ; fresh (c) 
       (a === action33554497) 
       (b === ienumerable33555622 c)
    ; (a === action33554497) &&& (b === ienumerable33555569)
    ; fresh (c) 
       (a === action33554497) 
       (b === rec33554487 c)
    ; fresh (c d) 
       (a === action33554497) 
       (b === mutualrec33554488 c d)
    ; fresh (c) 
       (a === delegate33554565) 
       (b === ienumerable33555622 c)
    ; (a === delegate33554565) &&& (b === ienumerable33555569)
    ; (a === delegate33554565) &&& (b === action33554497)
    ; (a === delegate33554565) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === delegate33554565) 
       (b === rec33554487 c)
    ; fresh (c d) 
       (a === delegate33554565) 
       (b === mutualrec33554488 c d)
    ; (a === icloneable33554495) &&& (b === iserializable33556234)
    ; fresh (c) 
       (a === icloneable33554495) 
       (b === ienumerable33555622 c)
    ; (a === icloneable33554495) &&& (b === ienumerable33555569)
    ; (a === icloneable33554495) &&& (b === action33554497)
    ; (a === icloneable33554495) &&& (b === delegate33554565)
    ; (a === icloneable33554495) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === icloneable33554495) 
       (b === rec33554487 c)
    ; fresh (c d) 
       (a === icloneable33554495) 
       (b === mutualrec33554488 c d)
    ; fresh (c) 
       (a === multicastdelegate33554567) 
       (b === ienumerable33555622 c)
    ; (a === multicastdelegate33554567) &&& (b === ienumerable33555569)
    ; (a === multicastdelegate33554567) &&& (b === action33554497)
    ; fresh (c) 
       (a === multicastdelegate33554567) 
       (b === rec33554487 c)
    ; fresh (c d) 
       (a === multicastdelegate33554567) 
       (b === mutualrec33554488 c d)
    ; fresh (c) 
       (a === rec33554487 c) 
       (b === iserializable33556234)
    ; fresh (c d) 
       (a === rec33554487 c) 
       (b === ienumerable33555622 d)
    ; fresh (c) 
       (a === rec33554487 c) 
       (b === ienumerable33555569)
    ; fresh (c) 
       (a === rec33554487 c) 
       (b === action33554497)
    ; fresh (c) 
       (a === rec33554487 c) 
       (b === delegate33554565)
    ; fresh (c) 
       (a === rec33554487 c) 
       (b === icloneable33554495)
    ; fresh (c) 
       (a === rec33554487 c) 
       (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === rec33554487 c) 
       (b === rec33554487 d) 
       (c =/= d)
    ; fresh (c d e) 
       (a === rec33554487 c) 
       (b === mutualrec33554488 d e)
    ; fresh (c d) 
       (a === mutualrec33554488 c d) 
       (b === iserializable33556234)
    ; fresh (c d e) 
       (a === mutualrec33554488 c d) 
       (b === ienumerable33555622 e)
    ; fresh (c d) 
       (a === mutualrec33554488 c d) 
       (b === ienumerable33555569)
    ; fresh (c d) 
       (a === mutualrec33554488 c d) 
       (b === action33554497)
    ; fresh (c d) 
       (a === mutualrec33554488 c d) 
       (b === delegate33554565)
    ; fresh (c d) 
       (a === mutualrec33554488 c d) 
       (b === icloneable33554495)
    ; fresh (c d) 
       (a === mutualrec33554488 c d) 
       (b === multicastdelegate33554567)
    ; fresh (c d e) 
       (a === mutualrec33554488 c d) 
       (b === rec33554487 e)
    ; fresh (c d e f) 
       (a === mutualrec33554488 c d) 
       (b === mutualrec33554488 e f) 
       (subtype c (rec33554487 d)) 
       (subtype d (rec33554487 c)) 
       (c =/= e)
    ; fresh (c d e f) 
       (a === mutualrec33554488 c d) 
       (b === mutualrec33554488 e f) 
       (subtype c (rec33554487 d)) 
       (subtype d (rec33554487 c)) 
       (d =/= f)
    ; (a === object33554493) &&& (b === iserializable33556234)
    ; fresh (c) 
       (a === object33554493) 
       (b === ienumerable33555622 c)
    ; (a === object33554493) &&& (b === ienumerable33555569)
    ; (a === object33554493) &&& (b === action33554497)
    ; (a === object33554493) &&& (b === delegate33554565)
    ; (a === object33554493) &&& (b === icloneable33554495)
    ; (a === object33554493) &&& (b === multicastdelegate33554567)
    ; fresh (c) 
       (a === object33554493) 
       (b === rec33554487 c)
    ; fresh (c d) 
       (a === object33554493) 
       (b === mutualrec33554488 c d)
    ]
and subtype a b = 
  conde 
    [ (a === iserializable33556234) &&& (b === iserializable33556234)
    ; (a === iserializable33556234) &&& (b === object33554493)
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === ienumerable33555622 d) 
       (covariant_subtype c d)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === ienumerable33555569)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === object33554493)
    ; (a === ienumerable33555569) &&& (b === ienumerable33555569)
    ; (a === ienumerable33555569) &&& (b === object33554493)
    ; (a === action33554497) &&& (b === iserializable33556234)
    ; (a === action33554497) &&& (b === action33554497)
    ; (a === action33554497) &&& (b === delegate33554565)
    ; (a === action33554497) &&& (b === icloneable33554495)
    ; (a === action33554497) &&& (b === multicastdelegate33554567)
    ; (a === action33554497) &&& (b === object33554493)
    ; (a === delegate33554565) &&& (b === iserializable33556234)
    ; (a === delegate33554565) &&& (b === delegate33554565)
    ; (a === delegate33554565) &&& (b === icloneable33554495)
    ; (a === delegate33554565) &&& (b === object33554493)
    ; (a === icloneable33554495) &&& (b === icloneable33554495)
    ; (a === icloneable33554495) &&& (b === object33554493)
    ; (a === multicastdelegate33554567) &&& (b === iserializable33556234)
    ; (a === multicastdelegate33554567) &&& (b === delegate33554565)
    ; (a === multicastdelegate33554567) &&& (b === icloneable33554495)
    ; (a === multicastdelegate33554567) &&& (b === multicastdelegate33554567)
    ; (a === multicastdelegate33554567) &&& (b === object33554493)
    ; fresh (c d) 
       (a === rec33554487 c) 
       (b === rec33554487 d) 
       (c === d)
    ; fresh (c) 
       (a === rec33554487 c) 
       (b === object33554493)
    ; fresh (c d e f) 
       (a === mutualrec33554488 c d) 
       (b === mutualrec33554488 e f) 
       (c === e) 
       (d === f) 
       (subtype c (rec33554487 d)) 
       (subtype d (rec33554487 c))
    ; fresh (c d) 
       (a === mutualrec33554488 c d) 
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
      run (succ (succ (succ (succ (succ one)))))
      (fun e f a b c d -> (subtype e action33554497) &&& (subtype e (ienumerable33555622 e)) &&& (subtype f iserializable33556234) &&& (not_subtype a (mutualrec33554488 b c)) &&& (not_subtype d (mutualrec33554488 b c)) &&& (not_subtype b (rec33554487 c)) &&& (not_subtype c (rec33554487 b)) &&& (not_subtype b (rec33554487 c)) &&& (not_subtype c (rec33554487 b)) &&& (is_reference f))
      (fun a b c d e f -> (my_reify a,my_reify b,my_reify c,my_reify d,my_reify e,my_reify f))
   in
   let start = Mtime_clock.counter () in
   try
      let answers = with_timeout max_timeout (fun () -> OCanren.Stream.take ~n:1 stream) in
      let span = Mtime_clock.count start in
      Printf.printf "Time: %f s\n%!" (Mtime.Span.to_s span);
      match answers with
      | [] -> print_endline "no answers"
      | [((a,b,c,d,e,f))] ->
         Format.printf "(%a,%a,%a,%a,%a,%a)\n%!" pp_term_logic a pp_term_logic b pp_term_logic c pp_term_logic d pp_term_logic e pp_term_logic f
      | _ -> failwith "should not happen"
   with Timeout -> Format.printf "Timeout after %f s\n%!" max_timeout
