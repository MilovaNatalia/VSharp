contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(mutualrec33554488(_,_)).
default_constructor(object33554493).
default_constructor(rec33554487(_)).
is_reference(action33554497).
is_reference(delegate33554565).
is_reference(icloneable33554495).
is_reference(ienumerable33555569).
is_reference(ienumerable33555622(_)).
is_reference(iserializable33556234).
is_reference(multicastdelegate33554567).
is_reference(mutualrec33554488(_,_)).
is_reference(object33554493).
is_reference(rec33554487(_)).
is_unmanaged(_) :- false.
is_valuetype(_) :- false.
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(action33554497,ienumerable33555569).
not_subtype(action33554497,ienumerable33555622(_)).
not_subtype(action33554497,mutualrec33554488(_,_)).
not_subtype(action33554497,rec33554487(_)).
not_subtype(delegate33554565,action33554497).
not_subtype(delegate33554565,ienumerable33555569).
not_subtype(delegate33554565,ienumerable33555622(_)).
not_subtype(delegate33554565,multicastdelegate33554567).
not_subtype(delegate33554565,mutualrec33554488(_,_)).
not_subtype(delegate33554565,rec33554487(_)).
not_subtype(icloneable33554495,action33554497).
not_subtype(icloneable33554495,delegate33554565).
not_subtype(icloneable33554495,ienumerable33555569).
not_subtype(icloneable33554495,ienumerable33555622(_)).
not_subtype(icloneable33554495,iserializable33556234).
not_subtype(icloneable33554495,multicastdelegate33554567).
not_subtype(icloneable33554495,mutualrec33554488(_,_)).
not_subtype(icloneable33554495,rec33554487(_)).
not_subtype(ienumerable33555569,action33554497).
not_subtype(ienumerable33555569,delegate33554565).
not_subtype(ienumerable33555569,icloneable33554495).
not_subtype(ienumerable33555569,ienumerable33555622(_)).
not_subtype(ienumerable33555569,iserializable33556234).
not_subtype(ienumerable33555569,multicastdelegate33554567).
not_subtype(ienumerable33555569,mutualrec33554488(_,_)).
not_subtype(ienumerable33555569,rec33554487(_)).
not_subtype(ienumerable33555622(_),action33554497).
not_subtype(ienumerable33555622(_),delegate33554565).
not_subtype(ienumerable33555622(_),icloneable33554495).
not_subtype(ienumerable33555622(_),iserializable33556234).
not_subtype(ienumerable33555622(_),multicastdelegate33554567).
not_subtype(ienumerable33555622(_),mutualrec33554488(_,_)).
not_subtype(ienumerable33555622(_),rec33554487(_)).
not_subtype(ienumerable33555622(A),ienumerable33555622(B)) :- not_covariant_subtype(A,B).
not_subtype(iserializable33556234,action33554497).
not_subtype(iserializable33556234,delegate33554565).
not_subtype(iserializable33556234,icloneable33554495).
not_subtype(iserializable33556234,ienumerable33555569).
not_subtype(iserializable33556234,ienumerable33555622(_)).
not_subtype(iserializable33556234,multicastdelegate33554567).
not_subtype(iserializable33556234,mutualrec33554488(_,_)).
not_subtype(iserializable33556234,rec33554487(_)).
not_subtype(multicastdelegate33554567,action33554497).
not_subtype(multicastdelegate33554567,ienumerable33555569).
not_subtype(multicastdelegate33554567,ienumerable33555622(_)).
not_subtype(multicastdelegate33554567,mutualrec33554488(_,_)).
not_subtype(multicastdelegate33554567,rec33554487(_)).
not_subtype(mutualrec33554488(_,_),action33554497).
not_subtype(mutualrec33554488(_,_),delegate33554565).
not_subtype(mutualrec33554488(_,_),icloneable33554495).
not_subtype(mutualrec33554488(_,_),ienumerable33555569).
not_subtype(mutualrec33554488(_,_),ienumerable33555622(_)).
not_subtype(mutualrec33554488(_,_),iserializable33556234).
not_subtype(mutualrec33554488(_,_),multicastdelegate33554567).
not_subtype(mutualrec33554488(_,_),rec33554487(_)).
not_subtype(mutualrec33554488(A,B),mutualrec33554488(_,D)) :- subtype(A,rec33554487(B)), subtype(B,rec33554487(A)), B \= D.
not_subtype(mutualrec33554488(A,B),mutualrec33554488(C,_)) :- subtype(A,rec33554487(B)), subtype(B,rec33554487(A)), A \= C.
not_subtype(object33554493,action33554497).
not_subtype(object33554493,delegate33554565).
not_subtype(object33554493,icloneable33554495).
not_subtype(object33554493,ienumerable33555569).
not_subtype(object33554493,ienumerable33555622(_)).
not_subtype(object33554493,iserializable33556234).
not_subtype(object33554493,multicastdelegate33554567).
not_subtype(object33554493,mutualrec33554488(_,_)).
not_subtype(object33554493,rec33554487(_)).
not_subtype(rec33554487(_),action33554497).
not_subtype(rec33554487(_),delegate33554565).
not_subtype(rec33554487(_),icloneable33554495).
not_subtype(rec33554487(_),ienumerable33555569).
not_subtype(rec33554487(_),ienumerable33555622(_)).
not_subtype(rec33554487(_),iserializable33556234).
not_subtype(rec33554487(_),multicastdelegate33554567).
not_subtype(rec33554487(_),mutualrec33554488(_,_)).
not_subtype(rec33554487(A),rec33554487(B)) :- A \= B.
subtype(action33554497,action33554497).
subtype(action33554497,delegate33554565).
subtype(action33554497,icloneable33554495).
subtype(action33554497,iserializable33556234).
subtype(action33554497,multicastdelegate33554567).
subtype(action33554497,object33554493).
subtype(delegate33554565,delegate33554565).
subtype(delegate33554565,icloneable33554495).
subtype(delegate33554565,iserializable33556234).
subtype(delegate33554565,object33554493).
subtype(icloneable33554495,icloneable33554495).
subtype(icloneable33554495,object33554493).
subtype(ienumerable33555569,ienumerable33555569).
subtype(ienumerable33555569,object33554493).
subtype(ienumerable33555622(_),ienumerable33555569).
subtype(ienumerable33555622(_),object33554493).
subtype(ienumerable33555622(A),ienumerable33555622(B)) :- covariant_subtype(A,B).
subtype(iserializable33556234,iserializable33556234).
subtype(iserializable33556234,object33554493).
subtype(multicastdelegate33554567,delegate33554565).
subtype(multicastdelegate33554567,icloneable33554495).
subtype(multicastdelegate33554567,iserializable33556234).
subtype(multicastdelegate33554567,multicastdelegate33554567).
subtype(multicastdelegate33554567,object33554493).
subtype(mutualrec33554488(_,_),object33554493).
subtype(mutualrec33554488(A,B),mutualrec33554488(C,D)) :- A = C, B = D, subtype(A,rec33554487(B)), subtype(B,rec33554487(A)).
subtype(object33554493,object33554493).
subtype(rec33554487(_),object33554493).
subtype(rec33554487(A),rec33554487(B)) :- A = B.
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (subtype(C,mutualrec33554488(D,E)), subtype(F,mutualrec33554488(D,E)), subtype(D,rec33554487(E)), subtype(E,rec33554487(D)), subtype(D,rec33554487(E)), subtype(E,rec33554487(D)), not_subtype(A,action33554497), not_subtype(A,ienumerable33555622(A)), not_subtype(B,iserializable33556234), is_reference(B), format('~w ~w~n', ['C =', C]),format('~w ~w~n', ['D =', D]),format('~w ~w~n', ['E =', E]),format('~w ~w~n', ['F =', F]),format('~w ~w~n', ['A =', A]),format('~w ~w~n', ['B =', B]))))).
