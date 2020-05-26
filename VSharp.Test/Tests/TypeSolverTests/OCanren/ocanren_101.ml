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
let ia33554436 a = w !!"ia33554436" (Std.List.list[a])
let valuetype33554777 = w !!"valuetype33554777" (Std.List.list[])
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
       (a === ia33554436 b)
    ; (a === valuetype33554777)
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
       (a === ia33554436 c) 
       (b === ia33554436 d) 
       (not_covariant_subtype c d)
    ; fresh (c) 
       (a === ia33554436 c) 
       (b === valuetype33554777)
    ; fresh (c) 
       (a === valuetype33554777) 
       (b === ia33554436 c)
    ; fresh (c) 
       (a === object33554493) 
       (b === ia33554436 c)
    ; (a === object33554493) &&& (b === valuetype33554777)
    ]
and subtype a b = 
  conde 
    [ fresh (c d) 
       (a === ia33554436 c) 
       (b === ia33554436 d) 
       (covariant_subtype c d)
    ; fresh (c) 
       (a === ia33554436 c) 
       (b === object33554493)
    ; (a === valuetype33554777) &&& (b === valuetype33554777)
    ; (a === valuetype33554777) &&& (b === object33554493)
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
      run (succ (succ (succ (succ (succ (succ (succ (succ (succ (succ one))))))))))
      (fun a b c d e f g h i j k -> (subtype a (ia33554436 a)) &&& (subtype b (ia33554436 a)) &&& (subtype valuetype33554777 c) &&& (subtype d (ia33554436 d)) &&& (subtype e (ia33554436 d)) &&& (subtype f a) &&& (subtype g a) &&& (subtype f h) &&& (subtype g h) &&& (subtype c h) &&& (subtype i h) &&& (subtype j h) &&& (subtype k h) &&& (subtype a (ia33554436 d)) &&& (subtype d (ia33554436 a)) &&& (subtype a (ia33554436 d)) &&& (subtype d (ia33554436 a)) &&& (default_constructor c) &&& (is_reference j))
      (fun a b c d e f g h i j k -> (my_reify a,my_reify b,my_reify c,my_reify d,my_reify e,my_reify f,my_reify g,my_reify h,my_reify i,my_reify j,my_reify k))
   in
   let start = Mtime_clock.counter () in
   try
      let answers = with_timeout max_timeout (fun () -> OCanren.Stream.take ~n:1 stream) in
      let span = Mtime_clock.count start in
      Printf.printf "Time: %f s\n%!" (Mtime.Span.to_s span);
      match answers with
      | [] -> print_endline "no answers"
      | [((a,b,c,d,e,f,g,h,i,j,k))] ->
         Format.printf "(%a,%a,%a,%a,%a,%a,%a,%a,%a,%a,%a)\n%!" pp_term_logic a pp_term_logic b pp_term_logic c pp_term_logic d pp_term_logic e pp_term_logic f pp_term_logic g pp_term_logic h pp_term_logic i pp_term_logic j pp_term_logic k
      | _ -> failwith "should not happen"
   with Timeout -> Format.printf "Timeout after %f s\n%!" max_timeout
