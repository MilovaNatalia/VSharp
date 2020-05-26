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
    ; fresh (c d) 
       (a === delegate33554565) 
       (b === dogsdelegate33554494 c d)
    ; (a === delegate33554565) &&& (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === iserializable33556234) 
       (b === dogsdelegate33554494 c d)
    ; (a === iserializable33556234) &&& (b === delegate33554565)
    ; (a === iserializable33556234) &&& (b === icloneable33554495)
    ; (a === iserializable33556234) &&& (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === icloneable33554495) 
       (b === dogsdelegate33554494 c d)
    ; (a === icloneable33554495) &&& (b === delegate33554565)
    ; (a === icloneable33554495) &&& (b === iserializable33556234)
    ; (a === icloneable33554495) &&& (b === multicastdelegate33554567)
    ; fresh (c d) 
       (a === multicastdelegate33554567) 
       (b === dogsdelegate33554494 c d)
    ; fresh (c d) 
       (a === object33554493) 
       (b === dogsdelegate33554494 c d)
    ; (a === object33554493) &&& (b === delegate33554565)
    ; (a === object33554493) &&& (b === iserializable33556234)
    ; (a === object33554493) &&& (b === icloneable33554495)
    ; (a === object33554493) &&& (b === multicastdelegate33554567)
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
      (fun a b c -> (subtype a (dogsdelegate33554494 b c)))
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
