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
    [ fresh (b) 
       (a === rec33554487 b)
    ; fresh (c d) 
       (a === mutualrec33554488 c d)
    ; (a === object33554493)
    ]
and is_reference a = 
  conde 
    [ fresh (b) 
       (a === rec33554487 b)
    ; fresh (c d) 
       (a === mutualrec33554488 c d)
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
       (a === rec33554487 c) 
       (b === rec33554487 d) 
       (c =/= d)
    ; fresh (c d e) 
       (a === rec33554487 c) 
       (b === mutualrec33554488 d e)
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
    ; fresh (c) 
       (a === object33554493) 
       (b === rec33554487 c)
    ; fresh (c d) 
       (a === object33554493) 
       (b === mutualrec33554488 c d)
    ]
and subtype a b = 
  conde 
    [ fresh (c d) 
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
      run (succ (succ (succ one)))
      (fun b c a d -> (subtype b (rec33554487 c)) &&& (subtype c (rec33554487 b)) &&& (not_subtype a (mutualrec33554488 b c)) &&& (not_subtype d (mutualrec33554488 b c)))
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
