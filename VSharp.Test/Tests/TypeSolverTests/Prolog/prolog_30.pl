contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(object33554493).
is_reference(ia33554436(_)).
is_reference(object33554493).
is_reference(valuetype33554777).
is_unmanaged(_) :- false.
is_valuetype(_) :- false.
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(ia33554436(_),valuetype33554777).
not_subtype(ia33554436(A),ia33554436(B)) :- not_covariant_subtype(A,B).
not_subtype(object33554493,ia33554436(_)).
not_subtype(object33554493,valuetype33554777).
not_subtype(valuetype33554777,ia33554436(_)).
subtype(ia33554436(_),object33554493).
subtype(ia33554436(A),ia33554436(B)) :- covariant_subtype(A,B).
subtype(object33554493,object33554493).
subtype(valuetype33554777,object33554493).
subtype(valuetype33554777,valuetype33554777).
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (subtype(B,ia33554436(D)), subtype(D,ia33554436(B)), not_subtype(valuetype33554777,A), not_subtype(B,ia33554436(B)), not_subtype(C,ia33554436(B)), not_subtype(D,ia33554436(D)), not_subtype(E,ia33554436(D)), not_subtype(F,B), not_subtype(G,B), not_subtype(F,H), not_subtype(G,H), not_subtype(A,H), not_subtype(I,H), not_subtype(J,H), not_subtype(K,H), default_constructor(A), is_reference(J), format('~w ~w~n', ['B =', B]),format('~w ~w~n', ['D =', D]),format('~w ~w~n', ['A =', A]),format('~w ~w~n', ['C =', C]),format('~w ~w~n', ['E =', E]),format('~w ~w~n', ['F =', F]),format('~w ~w~n', ['G =', G]),format('~w ~w~n', ['H =', H]),format('~w ~w~n', ['I =', I]),format('~w ~w~n', ['J =', J]),format('~w ~w~n', ['K =', K]))))).
