contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(list33555631(_)).
default_constructor(mutualrec33554488(_,_)).
default_constructor(object33554493).
default_constructor(rec33554487(_)).
is_reference(action33554497).
is_reference(delegate33554565).
is_reference(icloneable33554495).
is_reference(icollection33555565).
is_reference(icollection33555619(_)).
is_reference(ienumerable33555569).
is_reference(ienumerable33555622(_)).
is_reference(ilist33555573).
is_reference(ilist33555625(_)).
is_reference(ireadonlycollection33555626(_)).
is_reference(ireadonlylist33555627(_)).
is_reference(iserializable33556234).
is_reference(list33555631(_)).
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
not_subtype(action33554497,icollection33555565).
not_subtype(action33554497,icollection33555619(_)).
not_subtype(action33554497,ienumerable33555569).
not_subtype(action33554497,ienumerable33555622(_)).
not_subtype(action33554497,ilist33555573).
not_subtype(action33554497,ilist33555625(_)).
not_subtype(action33554497,ireadonlycollection33555626(_)).
not_subtype(action33554497,ireadonlylist33555627(_)).
not_subtype(action33554497,list33555631(_)).
not_subtype(action33554497,mutualrec33554488(_,_)).
not_subtype(action33554497,rec33554487(_)).
not_subtype(delegate33554565,action33554497).
not_subtype(delegate33554565,icollection33555565).
not_subtype(delegate33554565,icollection33555619(_)).
not_subtype(delegate33554565,ienumerable33555569).
not_subtype(delegate33554565,ienumerable33555622(_)).
not_subtype(delegate33554565,ilist33555573).
not_subtype(delegate33554565,ilist33555625(_)).
not_subtype(delegate33554565,ireadonlycollection33555626(_)).
not_subtype(delegate33554565,ireadonlylist33555627(_)).
not_subtype(delegate33554565,list33555631(_)).
not_subtype(delegate33554565,multicastdelegate33554567).
not_subtype(delegate33554565,mutualrec33554488(_,_)).
not_subtype(delegate33554565,rec33554487(_)).
not_subtype(icloneable33554495,action33554497).
not_subtype(icloneable33554495,delegate33554565).
not_subtype(icloneable33554495,icollection33555565).
not_subtype(icloneable33554495,icollection33555619(_)).
not_subtype(icloneable33554495,ienumerable33555569).
not_subtype(icloneable33554495,ienumerable33555622(_)).
not_subtype(icloneable33554495,ilist33555573).
not_subtype(icloneable33554495,ilist33555625(_)).
not_subtype(icloneable33554495,ireadonlycollection33555626(_)).
not_subtype(icloneable33554495,ireadonlylist33555627(_)).
not_subtype(icloneable33554495,iserializable33556234).
not_subtype(icloneable33554495,list33555631(_)).
not_subtype(icloneable33554495,multicastdelegate33554567).
not_subtype(icloneable33554495,mutualrec33554488(_,_)).
not_subtype(icloneable33554495,rec33554487(_)).
not_subtype(icollection33555565,action33554497).
not_subtype(icollection33555565,delegate33554565).
not_subtype(icollection33555565,icloneable33554495).
not_subtype(icollection33555565,icollection33555619(_)).
not_subtype(icollection33555565,ienumerable33555622(_)).
not_subtype(icollection33555565,ilist33555573).
not_subtype(icollection33555565,ilist33555625(_)).
not_subtype(icollection33555565,ireadonlycollection33555626(_)).
not_subtype(icollection33555565,ireadonlylist33555627(_)).
not_subtype(icollection33555565,iserializable33556234).
not_subtype(icollection33555565,list33555631(_)).
not_subtype(icollection33555565,multicastdelegate33554567).
not_subtype(icollection33555565,mutualrec33554488(_,_)).
not_subtype(icollection33555565,rec33554487(_)).
not_subtype(icollection33555619(_),action33554497).
not_subtype(icollection33555619(_),delegate33554565).
not_subtype(icollection33555619(_),icloneable33554495).
not_subtype(icollection33555619(_),icollection33555565).
not_subtype(icollection33555619(_),ilist33555573).
not_subtype(icollection33555619(_),ilist33555625(_)).
not_subtype(icollection33555619(_),ireadonlycollection33555626(_)).
not_subtype(icollection33555619(_),ireadonlylist33555627(_)).
not_subtype(icollection33555619(_),iserializable33556234).
not_subtype(icollection33555619(_),list33555631(_)).
not_subtype(icollection33555619(_),multicastdelegate33554567).
not_subtype(icollection33555619(_),mutualrec33554488(_,_)).
not_subtype(icollection33555619(_),rec33554487(_)).
not_subtype(icollection33555619(A),icollection33555619(B)) :- A \= B.
not_subtype(icollection33555619(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ienumerable33555569,action33554497).
not_subtype(ienumerable33555569,delegate33554565).
not_subtype(ienumerable33555569,icloneable33554495).
not_subtype(ienumerable33555569,icollection33555565).
not_subtype(ienumerable33555569,icollection33555619(_)).
not_subtype(ienumerable33555569,ienumerable33555622(_)).
not_subtype(ienumerable33555569,ilist33555573).
not_subtype(ienumerable33555569,ilist33555625(_)).
not_subtype(ienumerable33555569,ireadonlycollection33555626(_)).
not_subtype(ienumerable33555569,ireadonlylist33555627(_)).
not_subtype(ienumerable33555569,iserializable33556234).
not_subtype(ienumerable33555569,list33555631(_)).
not_subtype(ienumerable33555569,multicastdelegate33554567).
not_subtype(ienumerable33555569,mutualrec33554488(_,_)).
not_subtype(ienumerable33555569,rec33554487(_)).
not_subtype(ienumerable33555622(_),action33554497).
not_subtype(ienumerable33555622(_),delegate33554565).
not_subtype(ienumerable33555622(_),icloneable33554495).
not_subtype(ienumerable33555622(_),icollection33555565).
not_subtype(ienumerable33555622(_),icollection33555619(_)).
not_subtype(ienumerable33555622(_),ilist33555573).
not_subtype(ienumerable33555622(_),ilist33555625(_)).
not_subtype(ienumerable33555622(_),ireadonlycollection33555626(_)).
not_subtype(ienumerable33555622(_),ireadonlylist33555627(_)).
not_subtype(ienumerable33555622(_),iserializable33556234).
not_subtype(ienumerable33555622(_),list33555631(_)).
not_subtype(ienumerable33555622(_),multicastdelegate33554567).
not_subtype(ienumerable33555622(_),mutualrec33554488(_,_)).
not_subtype(ienumerable33555622(_),rec33554487(_)).
not_subtype(ienumerable33555622(A),ienumerable33555622(B)) :- not_covariant_subtype(A,B).
not_subtype(ilist33555573,action33554497).
not_subtype(ilist33555573,delegate33554565).
not_subtype(ilist33555573,icloneable33554495).
not_subtype(ilist33555573,icollection33555619(_)).
not_subtype(ilist33555573,ienumerable33555622(_)).
not_subtype(ilist33555573,ilist33555625(_)).
not_subtype(ilist33555573,ireadonlycollection33555626(_)).
not_subtype(ilist33555573,ireadonlylist33555627(_)).
not_subtype(ilist33555573,iserializable33556234).
not_subtype(ilist33555573,list33555631(_)).
not_subtype(ilist33555573,multicastdelegate33554567).
not_subtype(ilist33555573,mutualrec33554488(_,_)).
not_subtype(ilist33555573,rec33554487(_)).
not_subtype(ilist33555625(_),action33554497).
not_subtype(ilist33555625(_),delegate33554565).
not_subtype(ilist33555625(_),icloneable33554495).
not_subtype(ilist33555625(_),icollection33555565).
not_subtype(ilist33555625(_),ilist33555573).
not_subtype(ilist33555625(_),ireadonlycollection33555626(_)).
not_subtype(ilist33555625(_),ireadonlylist33555627(_)).
not_subtype(ilist33555625(_),iserializable33556234).
not_subtype(ilist33555625(_),list33555631(_)).
not_subtype(ilist33555625(_),multicastdelegate33554567).
not_subtype(ilist33555625(_),mutualrec33554488(_,_)).
not_subtype(ilist33555625(_),rec33554487(_)).
not_subtype(ilist33555625(A),icollection33555619(B)) :- not_subtype(icollection33555619(A),icollection33555619(B)).
not_subtype(ilist33555625(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ilist33555625(A),ilist33555625(B)) :- A \= B.
not_subtype(ireadonlycollection33555626(_),action33554497).
not_subtype(ireadonlycollection33555626(_),delegate33554565).
not_subtype(ireadonlycollection33555626(_),icloneable33554495).
not_subtype(ireadonlycollection33555626(_),icollection33555565).
not_subtype(ireadonlycollection33555626(_),icollection33555619(_)).
not_subtype(ireadonlycollection33555626(_),ilist33555573).
not_subtype(ireadonlycollection33555626(_),ilist33555625(_)).
not_subtype(ireadonlycollection33555626(_),ireadonlylist33555627(_)).
not_subtype(ireadonlycollection33555626(_),iserializable33556234).
not_subtype(ireadonlycollection33555626(_),list33555631(_)).
not_subtype(ireadonlycollection33555626(_),multicastdelegate33554567).
not_subtype(ireadonlycollection33555626(_),mutualrec33554488(_,_)).
not_subtype(ireadonlycollection33555626(_),rec33554487(_)).
not_subtype(ireadonlycollection33555626(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)) :- not_covariant_subtype(A,B).
not_subtype(ireadonlylist33555627(_),action33554497).
not_subtype(ireadonlylist33555627(_),delegate33554565).
not_subtype(ireadonlylist33555627(_),icloneable33554495).
not_subtype(ireadonlylist33555627(_),icollection33555565).
not_subtype(ireadonlylist33555627(_),icollection33555619(_)).
not_subtype(ireadonlylist33555627(_),ilist33555573).
not_subtype(ireadonlylist33555627(_),ilist33555625(_)).
not_subtype(ireadonlylist33555627(_),iserializable33556234).
not_subtype(ireadonlylist33555627(_),list33555631(_)).
not_subtype(ireadonlylist33555627(_),multicastdelegate33554567).
not_subtype(ireadonlylist33555627(_),mutualrec33554488(_,_)).
not_subtype(ireadonlylist33555627(_),rec33554487(_)).
not_subtype(ireadonlylist33555627(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ireadonlylist33555627(A),ireadonlycollection33555626(B)) :- not_subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)).
not_subtype(ireadonlylist33555627(A),ireadonlylist33555627(B)) :- not_covariant_subtype(A,B).
not_subtype(iserializable33556234,action33554497).
not_subtype(iserializable33556234,delegate33554565).
not_subtype(iserializable33556234,icloneable33554495).
not_subtype(iserializable33556234,icollection33555565).
not_subtype(iserializable33556234,icollection33555619(_)).
not_subtype(iserializable33556234,ienumerable33555569).
not_subtype(iserializable33556234,ienumerable33555622(_)).
not_subtype(iserializable33556234,ilist33555573).
not_subtype(iserializable33556234,ilist33555625(_)).
not_subtype(iserializable33556234,ireadonlycollection33555626(_)).
not_subtype(iserializable33556234,ireadonlylist33555627(_)).
not_subtype(iserializable33556234,list33555631(_)).
not_subtype(iserializable33556234,multicastdelegate33554567).
not_subtype(iserializable33556234,mutualrec33554488(_,_)).
not_subtype(iserializable33556234,rec33554487(_)).
not_subtype(list33555631(_),action33554497).
not_subtype(list33555631(_),delegate33554565).
not_subtype(list33555631(_),icloneable33554495).
not_subtype(list33555631(_),iserializable33556234).
not_subtype(list33555631(_),multicastdelegate33554567).
not_subtype(list33555631(_),mutualrec33554488(_,_)).
not_subtype(list33555631(_),rec33554487(_)).
not_subtype(list33555631(A),icollection33555619(B)) :- not_subtype(icollection33555619(A),icollection33555619(B)).
not_subtype(list33555631(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(list33555631(A),ilist33555625(B)) :- not_subtype(ilist33555625(A),ilist33555625(B)).
not_subtype(list33555631(A),ireadonlycollection33555626(B)) :- not_subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)).
not_subtype(list33555631(A),ireadonlylist33555627(B)) :- not_subtype(ireadonlylist33555627(A),ireadonlylist33555627(B)).
not_subtype(list33555631(A),list33555631(B)) :- A \= B.
not_subtype(multicastdelegate33554567,action33554497).
not_subtype(multicastdelegate33554567,icollection33555565).
not_subtype(multicastdelegate33554567,icollection33555619(_)).
not_subtype(multicastdelegate33554567,ienumerable33555569).
not_subtype(multicastdelegate33554567,ienumerable33555622(_)).
not_subtype(multicastdelegate33554567,ilist33555573).
not_subtype(multicastdelegate33554567,ilist33555625(_)).
not_subtype(multicastdelegate33554567,ireadonlycollection33555626(_)).
not_subtype(multicastdelegate33554567,ireadonlylist33555627(_)).
not_subtype(multicastdelegate33554567,list33555631(_)).
not_subtype(multicastdelegate33554567,mutualrec33554488(_,_)).
not_subtype(multicastdelegate33554567,rec33554487(_)).
not_subtype(mutualrec33554488(_,_),action33554497).
not_subtype(mutualrec33554488(_,_),delegate33554565).
not_subtype(mutualrec33554488(_,_),icloneable33554495).
not_subtype(mutualrec33554488(_,_),icollection33555565).
not_subtype(mutualrec33554488(_,_),icollection33555619(_)).
not_subtype(mutualrec33554488(_,_),ienumerable33555569).
not_subtype(mutualrec33554488(_,_),ienumerable33555622(_)).
not_subtype(mutualrec33554488(_,_),ilist33555573).
not_subtype(mutualrec33554488(_,_),ilist33555625(_)).
not_subtype(mutualrec33554488(_,_),ireadonlycollection33555626(_)).
not_subtype(mutualrec33554488(_,_),ireadonlylist33555627(_)).
not_subtype(mutualrec33554488(_,_),iserializable33556234).
not_subtype(mutualrec33554488(_,_),list33555631(_)).
not_subtype(mutualrec33554488(_,_),multicastdelegate33554567).
not_subtype(mutualrec33554488(_,_),rec33554487(_)).
not_subtype(mutualrec33554488(A,B),mutualrec33554488(_,D)) :- subtype(A,rec33554487(B)), subtype(B,rec33554487(A)), B \= D.
not_subtype(mutualrec33554488(A,B),mutualrec33554488(C,_)) :- subtype(A,rec33554487(B)), subtype(B,rec33554487(A)), A \= C.
not_subtype(object33554493,action33554497).
not_subtype(object33554493,delegate33554565).
not_subtype(object33554493,icloneable33554495).
not_subtype(object33554493,icollection33555565).
not_subtype(object33554493,icollection33555619(_)).
not_subtype(object33554493,ienumerable33555569).
not_subtype(object33554493,ienumerable33555622(_)).
not_subtype(object33554493,ilist33555573).
not_subtype(object33554493,ilist33555625(_)).
not_subtype(object33554493,ireadonlycollection33555626(_)).
not_subtype(object33554493,ireadonlylist33555627(_)).
not_subtype(object33554493,iserializable33556234).
not_subtype(object33554493,list33555631(_)).
not_subtype(object33554493,multicastdelegate33554567).
not_subtype(object33554493,mutualrec33554488(_,_)).
not_subtype(object33554493,rec33554487(_)).
not_subtype(rec33554487(_),action33554497).
not_subtype(rec33554487(_),delegate33554565).
not_subtype(rec33554487(_),icloneable33554495).
not_subtype(rec33554487(_),icollection33555565).
not_subtype(rec33554487(_),icollection33555619(_)).
not_subtype(rec33554487(_),ienumerable33555569).
not_subtype(rec33554487(_),ienumerable33555622(_)).
not_subtype(rec33554487(_),ilist33555573).
not_subtype(rec33554487(_),ilist33555625(_)).
not_subtype(rec33554487(_),ireadonlycollection33555626(_)).
not_subtype(rec33554487(_),ireadonlylist33555627(_)).
not_subtype(rec33554487(_),iserializable33556234).
not_subtype(rec33554487(_),list33555631(_)).
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
subtype(icollection33555565,icollection33555565).
subtype(icollection33555565,ienumerable33555569).
subtype(icollection33555565,object33554493).
subtype(icollection33555619(_),ienumerable33555569).
subtype(icollection33555619(_),object33554493).
subtype(icollection33555619(A),icollection33555619(B)) :- A = B.
subtype(icollection33555619(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(ienumerable33555569,ienumerable33555569).
subtype(ienumerable33555569,object33554493).
subtype(ienumerable33555622(_),ienumerable33555569).
subtype(ienumerable33555622(_),object33554493).
subtype(ienumerable33555622(A),ienumerable33555622(B)) :- covariant_subtype(A,B).
subtype(ilist33555573,icollection33555565).
subtype(ilist33555573,ienumerable33555569).
subtype(ilist33555573,ilist33555573).
subtype(ilist33555573,object33554493).
subtype(ilist33555625(_),ienumerable33555569).
subtype(ilist33555625(_),object33554493).
subtype(ilist33555625(A),icollection33555619(B)) :- subtype(icollection33555619(A),icollection33555619(B)).
subtype(ilist33555625(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(ilist33555625(A),ilist33555625(B)) :- A = B.
subtype(ireadonlycollection33555626(_),ienumerable33555569).
subtype(ireadonlycollection33555626(_),object33554493).
subtype(ireadonlycollection33555626(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)) :- covariant_subtype(A,B).
subtype(ireadonlylist33555627(_),ienumerable33555569).
subtype(ireadonlylist33555627(_),object33554493).
subtype(ireadonlylist33555627(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(ireadonlylist33555627(A),ireadonlycollection33555626(B)) :- subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)).
subtype(ireadonlylist33555627(A),ireadonlylist33555627(B)) :- covariant_subtype(A,B).
subtype(iserializable33556234,iserializable33556234).
subtype(iserializable33556234,object33554493).
subtype(list33555631(_),icollection33555565).
subtype(list33555631(_),ienumerable33555569).
subtype(list33555631(_),ilist33555573).
subtype(list33555631(_),object33554493).
subtype(list33555631(A),icollection33555619(B)) :- subtype(icollection33555619(A),icollection33555619(B)).
subtype(list33555631(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(list33555631(A),ilist33555625(B)) :- subtype(ilist33555625(A),ilist33555625(B)).
subtype(list33555631(A),ireadonlycollection33555626(B)) :- subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)).
subtype(list33555631(A),ireadonlylist33555627(B)) :- subtype(ireadonlylist33555627(A),ireadonlylist33555627(B)).
subtype(list33555631(A),list33555631(B)) :- A = B.
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
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (subtype(E,mutualrec33554488(A,B)), subtype(F,mutualrec33554488(A,B)), subtype(C,action33554497), subtype(list33555631(D),ienumerable33555622(C)), subtype(D,ienumerable33555622(C)), not_subtype(A,rec33554487(B)), not_subtype(B,rec33554487(A)), not_subtype(C,action33554497), not_subtype(list33555631(D),ienumerable33555622(C)), not_subtype(D,ienumerable33555622(C)), is_reference(C), format('~w ~w~n', ['E =', E]),format('~w ~w~n', ['A =', A]),format('~w ~w~n', ['B =', B]),format('~w ~w~n', ['F =', F]),format('~w ~w~n', ['C =', C]),format('~w ~w~n', ['D =', D]))))).
