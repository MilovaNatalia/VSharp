contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(object33554493).
is_reference(ih33554443).
is_reference(object33554493).
is_unmanaged(_) :- false.
is_valuetype(_) :- false.
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(object33554493,ih33554443).
subtype(ih33554443,ih33554443).
subtype(ih33554443,object33554493).
subtype(object33554493,object33554493).
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (subtype(C,E), subtype(F,E), subtype(C,ih33554443), subtype(D,ih33554443), subtype(A,B), subtype(C,B), not_subtype(A,B), not_subtype(C,B), not_subtype(C,ih33554443), not_subtype(D,ih33554443), format('~w ~w~n', ['C =', C]),format('~w ~w~n', ['E =', E]),format('~w ~w~n', ['F =', F]),format('~w ~w~n', ['D =', D]),format('~w ~w~n', ['A =', A]),format('~w ~w~n', ['B =', B]))))).
