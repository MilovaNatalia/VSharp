contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(object33554493).
is_reference(expression33554963).
is_reference(ienumerable33555569).
is_reference(ienumerable33555622(_)).
is_reference(iqueryable33554758).
is_reference(iqueryable33554759(_)).
is_reference(object33554493).
is_unmanaged(_) :- false.
is_valuetype(_) :- false.
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(expression33554963,ienumerable33555569).
not_subtype(expression33554963,ienumerable33555622(_)).
not_subtype(expression33554963,iqueryable33554758).
not_subtype(expression33554963,iqueryable33554759(_)).
not_subtype(ienumerable33555569,expression33554963).
not_subtype(ienumerable33555569,ienumerable33555622(_)).
not_subtype(ienumerable33555569,iqueryable33554758).
not_subtype(ienumerable33555569,iqueryable33554759(_)).
not_subtype(ienumerable33555622(_),expression33554963).
not_subtype(ienumerable33555622(_),iqueryable33554758).
not_subtype(ienumerable33555622(_),iqueryable33554759(_)).
not_subtype(ienumerable33555622(A),ienumerable33555622(B)) :- not_covariant_subtype(A,B).
not_subtype(iqueryable33554758,expression33554963).
not_subtype(iqueryable33554758,ienumerable33555622(_)).
not_subtype(iqueryable33554758,iqueryable33554759(_)).
not_subtype(iqueryable33554759(_),expression33554963).
not_subtype(iqueryable33554759(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(iqueryable33554759(A),iqueryable33554759(B)) :- not_covariant_subtype(A,B).
not_subtype(object33554493,expression33554963).
not_subtype(object33554493,ienumerable33555569).
not_subtype(object33554493,ienumerable33555622(_)).
not_subtype(object33554493,iqueryable33554758).
not_subtype(object33554493,iqueryable33554759(_)).
subtype(expression33554963,expression33554963).
subtype(expression33554963,object33554493).
subtype(ienumerable33555569,ienumerable33555569).
subtype(ienumerable33555569,object33554493).
subtype(ienumerable33555622(_),ienumerable33555569).
subtype(ienumerable33555622(_),object33554493).
subtype(ienumerable33555622(A),ienumerable33555622(B)) :- covariant_subtype(A,B).
subtype(iqueryable33554758,ienumerable33555569).
subtype(iqueryable33554758,iqueryable33554758).
subtype(iqueryable33554758,object33554493).
subtype(iqueryable33554759(_),ienumerable33555569).
subtype(iqueryable33554759(_),iqueryable33554758).
subtype(iqueryable33554759(_),object33554493).
subtype(iqueryable33554759(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(iqueryable33554759(A),iqueryable33554759(B)) :- covariant_subtype(A,B).
subtype(object33554493,object33554493).
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (not_subtype(expression33554963,iqueryable33554759(A)), format('~w ~w~n', ['A =', A]))))).
