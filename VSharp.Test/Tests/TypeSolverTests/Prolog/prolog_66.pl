contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(object33554493).
default_constructor(thing33554490).
is_reference(ibox33554489(_)).
is_reference(object33554493).
is_reference(thing33554490).
is_unmanaged(_) :- false.
is_valuetype(_) :- false.
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(ibox33554489(_),thing33554490).
not_subtype(ibox33554489(A),ibox33554489(B)) :- not_contravariant_subtype(A,B).
not_subtype(object33554493,ibox33554489(_)).
not_subtype(object33554493,thing33554490).
not_subtype(thing33554490,ibox33554489(A)) :- not_subtype(ibox33554489(ibox33554489(thing33554490)),ibox33554489(A)).
subtype(ibox33554489(_),object33554493).
subtype(ibox33554489(A),ibox33554489(B)) :- contravariant_subtype(A,B).
subtype(object33554493,object33554493).
subtype(thing33554490,ibox33554489(A)) :- subtype(ibox33554489(ibox33554489(thing33554490)),ibox33554489(A)).
subtype(thing33554490,object33554493).
subtype(thing33554490,thing33554490).
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (not_subtype(A,ibox33554489(thing33554490)), format('~w ~w~n', ['A =', A]))))).
