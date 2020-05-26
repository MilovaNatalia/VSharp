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
let iqueryable33554759 a = w !!"iqueryable33554759" (Std.List.list[a])
let iqueryable33554758 = w !!"iqueryable33554758" (Std.List.list[])
let ienumerable33555569 = w !!"ienumerable33555569" (Std.List.list[])
let ienumerable33555622 a = w !!"ienumerable33555622" (Std.List.list[a])
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
       (a === iqueryable33554759 b)
    ; (a === iqueryable33554758)
    ; (a === ienumerable33555569)
    ; fresh (c) 
       (a === ienumerable33555622 c)
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
       (a === iqueryable33554759 c) 
       (b === iqueryable33554759 d) 
       (not_covariant_subtype c d)
    ; fresh (c d) 
       (a === iqueryable33554759 c) 
       (b === ienumerable33555622 d) 
       (not_subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === expression33554963)
    ; fresh (c) 
       (a === iqueryable33554758) 
       (b === iqueryable33554759 c)
    ; fresh (c) 
       (a === iqueryable33554758) 
       (b === ienumerable33555622 c)
    ; (a === iqueryable33554758) &&& (b === expression33554963)
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === iqueryable33554759 c)
    ; (a === ienumerable33555569) &&& (b === iqueryable33554758)
    ; fresh (c) 
       (a === ienumerable33555569) 
       (b === ienumerable33555622 c)
    ; (a === ienumerable33555569) &&& (b === expression33554963)
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === iqueryable33554759 d)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === iqueryable33554758)
    ; fresh (c d) 
       (a === ienumerable33555622 c) 
       (b === ienumerable33555622 d) 
       (not_covariant_subtype c d)
    ; fresh (c) 
       (a === ienumerable33555622 c) 
       (b === expression33554963)
    ; fresh (c) 
       (a === expression33554963) 
       (b === iqueryable33554759 c)
    ; (a === expression33554963) &&& (b === iqueryable33554758)
    ; (a === expression33554963) &&& (b === ienumerable33555569)
    ; fresh (c) 
       (a === expression33554963) 
       (b === ienumerable33555622 c)
    ; fresh (c) 
       (a === object33554493) 
       (b === iqueryable33554759 c)
    ; (a === object33554493) &&& (b === iqueryable33554758)
    ; (a === object33554493) &&& (b === ienumerable33555569)
    ; fresh (c) 
       (a === object33554493) 
       (b === ienumerable33555622 c)
    ; (a === object33554493) &&& (b === expression33554963)
    ]
and subtype a b = 
  conde 
    [ fresh (c d) 
       (a === iqueryable33554759 c) 
       (b === iqueryable33554759 d) 
       (covariant_subtype c d)
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === iqueryable33554758)
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === ienumerable33555569)
    ; fresh (c d) 
       (a === iqueryable33554759 c) 
       (b === ienumerable33555622 d) 
       (subtype (ienumerable33555622 c) (ienumerable33555622 d))
    ; fresh (c) 
       (a === iqueryable33554759 c) 
       (b === object33554493)
    ; (a === iqueryable33554758) &&& (b === iqueryable33554758)
    ; (a === iqueryable33554758) &&& (b === ienumerable33555569)
    ; (a === iqueryable33554758) &&& (b === object33554493)
    ; (a === ienumerable33555569) &&& (b === ienumerable33555569)
    ; (a === ienumerable33555569) &&& (b === object33554493)
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
      run one
      (fun a -> (not_subtype expression33554963 (iqueryable33554759 a)))
      (fun a -> my_reify a)
   in
   let start = Mtime_clock.counter () in
   try
      let answers = with_timeout max_timeout (fun () -> OCanren.Stream.take ~n:1 stream) in
      let span = Mtime_clock.count start in
      Printf.printf "Time: %f s\n%!" (Mtime.Span.to_s span);
      match answers with
      | [] -> print_endline "no answers"
      | [(a)] ->
         Format.printf "%a\n%!" pp_term_logic a
      | _ -> failwith "should not happen"
   with Timeout -> Format.printf "Timeout after %f s\n%!" max_timeout
