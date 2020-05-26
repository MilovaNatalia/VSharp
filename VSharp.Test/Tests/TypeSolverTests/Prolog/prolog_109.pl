contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(object33554493).
is_reference(delegate33554565).
is_reference(dogsdelegate33554494(_,_)).
is_reference(icloneable33554495).
is_reference(iserializable33556234).
is_reference(multicastdelegate33554567).
is_reference(object33554493).
is_unmanaged(_) :- false.
is_valuetype(_) :- false.
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(delegate33554565,dogsdelegate33554494(_,_)).
not_subtype(delegate33554565,multicastdelegate33554567).
not_subtype(dogsdelegate33554494(_,B),dogsdelegate33554494(_,D)) :- B \= D.
not_subtype(dogsdelegate33554494(A,_),dogsdelegate33554494(C,_)) :- A \= C.
not_subtype(icloneable33554495,delegate33554565).
not_subtype(icloneable33554495,dogsdelegate33554494(_,_)).
not_subtype(icloneable33554495,iserializable33556234).
not_subtype(icloneable33554495,multicastdelegate33554567).
not_subtype(iserializable33556234,delegate33554565).
not_subtype(iserializable33556234,dogsdelegate33554494(_,_)).
not_subtype(iserializable33556234,icloneable33554495).
not_subtype(iserializable33556234,multicastdelegate33554567).
not_subtype(multicastdelegate33554567,dogsdelegate33554494(_,_)).
not_subtype(object33554493,delegate33554565).
not_subtype(object33554493,dogsdelegate33554494(_,_)).
not_subtype(object33554493,icloneable33554495).
not_subtype(object33554493,iserializable33556234).
not_subtype(object33554493,multicastdelegate33554567).
subtype(delegate33554565,delegate33554565).
subtype(delegate33554565,icloneable33554495).
subtype(delegate33554565,iserializable33556234).
subtype(delegate33554565,object33554493).
subtype(dogsdelegate33554494(_,_),delegate33554565).
subtype(dogsdelegate33554494(_,_),icloneable33554495).
subtype(dogsdelegate33554494(_,_),iserializable33556234).
subtype(dogsdelegate33554494(_,_),multicastdelegate33554567).
subtype(dogsdelegate33554494(_,_),object33554493).
subtype(dogsdelegate33554494(A,B),dogsdelegate33554494(C,D)) :- A = C, B = D.
subtype(icloneable33554495,icloneable33554495).
subtype(icloneable33554495,object33554493).
subtype(iserializable33556234,iserializable33556234).
subtype(iserializable33556234,object33554493).
subtype(multicastdelegate33554567,delegate33554565).
subtype(multicastdelegate33554567,icloneable33554495).
subtype(multicastdelegate33554567,iserializable33556234).
subtype(multicastdelegate33554567,multicastdelegate33554567).
subtype(multicastdelegate33554567,object33554493).
subtype(object33554493,object33554493).
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (subtype(A,dogsdelegate33554494(B,C)), format('~w ~w~n', ['A =', A]),format('~w ~w~n', ['B =', B]),format('~w ~w~n', ['C =', C]))))).
