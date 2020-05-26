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
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (subtype(A,ia33554436(A)), subtype(B,ia33554436(A)), subtype(valuetype33554777,C), subtype(D,ia33554436(D)), subtype(E,ia33554436(D)), subtype(F,A), subtype(G,A), subtype(F,H), subtype(G,H), subtype(C,H), subtype(I,H), subtype(J,H), subtype(K,H), subtype(A,ia33554436(D)), subtype(D,ia33554436(A)), default_constructor(C), is_reference(J), format('~w ~w~n', ['A =', A]),format('~w ~w~n', ['B =', B]),format('~w ~w~n', ['C =', C]),format('~w ~w~n', ['D =', D]),format('~w ~w~n', ['E =', E]),format('~w ~w~n', ['F =', F]),format('~w ~w~n', ['G =', G]),format('~w ~w~n', ['H =', H]),format('~w ~w~n', ['I =', I]),format('~w ~w~n', ['J =', J]),format('~w ~w~n', ['K =', K]))))).
