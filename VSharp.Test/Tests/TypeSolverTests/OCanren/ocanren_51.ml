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
let tuple33554529 a b = w !!"tuple33554529" (Std.List.list[a;b])
let ituple33556673 = w !!"ituple33556673" (Std.List.list[])
let itupleinternal33554526 = w !!"itupleinternal33554526" (Std.List.list[])
let icomparable33554520 = w !!"icomparable33554520" (Std.List.list[])
let istructuralcomparable33555577 = w !!"istructuralcomparable33555577" (Std.List.list[])
let istructuralequatable33555576 = w !!"istructuralequatable33555576" (Std.List.list[])
let tuple33554528 a = w !!"tuple33554528" (Std.List.list[a])
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
       (a === tuple33554529 b c)
    ; (a === ituple33556673)
    ; (a === itupleinternal33554526)
    ; (a === icomparable33554520)
    ; (a === istructuralcomparable33555577)
    ; (a === istructuralequatable33555576)
    ; fresh (d) 
       (a === tuple33554528 d)
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
       (a === tuple33554529 c d) 
       (b === tuple33554529 e f) 
       (c =/= e)
    ; fresh (c d e f) 
       (a === tuple33554529 c d) 
       (b === tuple33554529 e f) 
       (d =/= f)
    ; fresh (c d e) 
       (a === tuple33554529 c d) 
       (b === tuple33554528 e)
    ; fresh (c d) 
       (a === ituple33556673) 
       (b === tuple33554529 c d)
    ; (a === ituple33556673) &&& (b === itupleinternal33554526)
    ; (a === ituple33556673) &&& (b === icomparable33554520)
    ; (a === ituple33556673) &&& (b === istructuralcomparable33555577)
    ; (a === ituple33556673) &&& (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === ituple33556673) 
       (b === tuple33554528 c)
    ; fresh (c d) 
       (a === itupleinternal33554526) 
       (b === tuple33554529 c d)
    ; (a === itupleinternal33554526) &&& (b === icomparable33554520)
    ; (a === itupleinternal33554526) &&& (b === istructuralcomparable33555577)
    ; (a === itupleinternal33554526) &&& (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === itupleinternal33554526) 
       (b === tuple33554528 c)
    ; fresh (c d) 
       (a === icomparable33554520) 
       (b === tuple33554529 c d)
    ; (a === icomparable33554520) &&& (b === ituple33556673)
    ; (a === icomparable33554520) &&& (b === itupleinternal33554526)
    ; (a === icomparable33554520) &&& (b === istructuralcomparable33555577)
    ; (a === icomparable33554520) &&& (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === icomparable33554520) 
       (b === tuple33554528 c)
    ; fresh (c d) 
       (a === istructuralcomparable33555577) 
       (b === tuple33554529 c d)
    ; (a === istructuralcomparable33555577) &&& (b === ituple33556673)
    ; (a === istructuralcomparable33555577) &&& (b === itupleinternal33554526)
    ; (a === istructuralcomparable33555577) &&& (b === icomparable33554520)
    ; (a === istructuralcomparable33555577) &&& (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === istructuralcomparable33555577) 
       (b === tuple33554528 c)
    ; fresh (c d) 
       (a === istructuralequatable33555576) 
       (b === tuple33554529 c d)
    ; (a === istructuralequatable33555576) &&& (b === ituple33556673)
    ; (a === istructuralequatable33555576) &&& (b === itupleinternal33554526)
    ; (a === istructuralequatable33555576) &&& (b === icomparable33554520)
    ; (a === istructuralequatable33555576) &&& (b === istructuralcomparable33555577)
    ; fresh (c) 
       (a === istructuralequatable33555576) 
       (b === tuple33554528 c)
    ; fresh (c d e) 
       (a === tuple33554528 c) 
       (b === tuple33554529 d e)
    ; fresh (c d) 
       (a === tuple33554528 c) 
       (b === tuple33554528 d) 
       (c =/= d)
    ; fresh (c d) 
       (a === object33554493) 
       (b === tuple33554529 c d)
    ; (a === object33554493) &&& (b === ituple33556673)
    ; (a === object33554493) &&& (b === itupleinternal33554526)
    ; (a === object33554493) &&& (b === icomparable33554520)
    ; (a === object33554493) &&& (b === istructuralcomparable33555577)
    ; (a === object33554493) &&& (b === istructuralequatable33555576)
    ; fresh (c) 
       (a === object33554493) 
       (b === tuple33554528 c)
    ]
and subtype a b = 
  conde 
    [ fresh (c d e f) 
       (a === tuple33554529 c d) 
       (b === tuple33554529 e f) 
       (c === e) 
       (d === f)
    ; fresh (c d) 
       (a === tuple33554529 c d) 
       (b === ituple33556673)
    ; fresh (c d) 
       (a === tuple33554529 c d) 
       (b === itupleinternal33554526)
    ; fresh (c d) 
       (a === tuple33554529 c d) 
       (b === icomparable33554520)
    ; fresh (c d) 
       (a === tuple33554529 c d) 
       (b === istructuralcomparable33555577)
    ; fresh (c d) 
       (a === tuple33554529 c d) 
       (b === istructuralequatable33555576)
    ; fresh (c d) 
       (a === tuple33554529 c d) 
       (b === object33554493)
    ; (a === ituple33556673) &&& (b === ituple33556673)
    ; (a === ituple33556673) &&& (b === object33554493)
    ; (a === itupleinternal33554526) &&& (b === ituple33556673)
    ; (a === itupleinternal33554526) &&& (b === itupleinternal33554526)
    ; (a === itupleinternal33554526) &&& (b === object33554493)
    ; (a === icomparable33554520) &&& (b === icomparable33554520)
    ; (a === icomparable33554520) &&& (b === object33554493)
    ; (a === istructuralcomparable33555577) &&& (b === istructuralcomparable33555577)
    ; (a === istructuralcomparable33555577) &&& (b === object33554493)
    ; (a === istructuralequatable33555576) &&& (b === istructuralequatable33555576)
    ; (a === istructuralequatable33555576) &&& (b === object33554493)
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
       (b === istructuralcomparable33555577)
    ; fresh (c) 
       (a === tuple33554528 c) 
       (b === istructuralequatable33555576)
    ; fresh (c d) 
       (a === tuple33554528 c) 
       (b === tuple33554528 d) 
       (c === d)
    ; fresh (c) 
       (a === tuple33554528 c) 
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
      (fun c d b a -> (subtype c (tuple33554529 c d)) &&& (subtype b (tuple33554529 c d)) &&& (subtype c (tuple33554529 (tuple33554528 c) c)) &&& (subtype b (tuple33554529 (tuple33554528 c) c)) &&& (not_subtype a (tuple33554528 a)) &&& (not_subtype b (tuple33554528 a)) &&& (not_subtype a (tuple33554528 (tuple33554528 a))) &&& (not_subtype b (tuple33554528 (tuple33554528 a))) &&& (not_subtype c (tuple33554529 (tuple33554528 c) c)) &&& (not_subtype b (tuple33554529 (tuple33554528 c) c)) &&& (not_subtype c (tuple33554529 c d)) &&& (not_subtype b (tuple33554529 c d)))
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
