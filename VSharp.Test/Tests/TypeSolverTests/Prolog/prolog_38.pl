contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(mutualrec33554488(_,_)).
default_constructor(object33554493).
default_constructor(rec33554487(_)).
is_reference(mutualrec33554488(_,_)).
is_reference(object33554493).
is_reference(rec33554487(_)).
is_unmanaged(_) :- false.
is_valuetype(_) :- false.
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(mutualrec33554488(_,_),rec33554487(_)).
not_subtype(mutualrec33554488(A,B),mutualrec33554488(_,D)) :- subtype(A,rec33554487(B)), subtype(B,rec33554487(A)), B \= D.
not_subtype(mutualrec33554488(A,B),mutualrec33554488(C,_)) :- subtype(A,rec33554487(B)), subtype(B,rec33554487(A)), A \= C.
not_subtype(object33554493,mutualrec33554488(_,_)).
not_subtype(object33554493,rec33554487(_)).
not_subtype(rec33554487(_),mutualrec33554488(_,_)).
not_subtype(rec33554487(A),rec33554487(B)) :- A \= B.
subtype(mutualrec33554488(_,_),object33554493).
subtype(mutualrec33554488(A,B),mutualrec33554488(C,D)) :- A = C, B = D, subtype(A,rec33554487(B)), subtype(B,rec33554487(A)).
subtype(object33554493,object33554493).
subtype(rec33554487(_),object33554493).
subtype(rec33554487(A),rec33554487(B)) :- A = B.
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (subtype(B,rec33554487(C)), subtype(C,rec33554487(B)), not_subtype(A,mutualrec33554488(B,C)), not_subtype(D,mutualrec33554488(B,C)), format('~w ~w~n', ['B =', B]),format('~w ~w~n', ['C =', C]),format('~w ~w~n', ['A =', A]),format('~w ~w~n', ['D =', D]))))).
