contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(object33554493).
is_reference(array33554517).
is_reference(delegate33554565).
is_reference(dogsdelegate33554494(_,_)).
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
is_reference(istructuralcomparable33555577).
is_reference(istructuralequatable33555576).
is_reference(multicastdelegate33554567).
is_reference(object33554493).
is_reference(vector33554435(_)).
is_unmanaged(_) :- false.
is_valuetype(_) :- false.
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(array33554517,delegate33554565).
not_subtype(array33554517,dogsdelegate33554494(_,_)).
not_subtype(array33554517,icollection33555619(_)).
not_subtype(array33554517,ienumerable33555622(_)).
not_subtype(array33554517,ilist33555625(_)).
not_subtype(array33554517,ireadonlycollection33555626(_)).
not_subtype(array33554517,ireadonlylist33555627(_)).
not_subtype(array33554517,iserializable33556234).
not_subtype(array33554517,multicastdelegate33554567).
not_subtype(array33554517,vector33554435(_)).
not_subtype(delegate33554565,array33554517).
not_subtype(delegate33554565,dogsdelegate33554494(_,_)).
not_subtype(delegate33554565,icollection33555565).
not_subtype(delegate33554565,icollection33555619(_)).
not_subtype(delegate33554565,ienumerable33555569).
not_subtype(delegate33554565,ienumerable33555622(_)).
not_subtype(delegate33554565,ilist33555573).
not_subtype(delegate33554565,ilist33555625(_)).
not_subtype(delegate33554565,ireadonlycollection33555626(_)).
not_subtype(delegate33554565,ireadonlylist33555627(_)).
not_subtype(delegate33554565,istructuralcomparable33555577).
not_subtype(delegate33554565,istructuralequatable33555576).
not_subtype(delegate33554565,multicastdelegate33554567).
not_subtype(delegate33554565,vector33554435(_)).
not_subtype(dogsdelegate33554494(_,_),array33554517).
not_subtype(dogsdelegate33554494(_,_),icollection33555565).
not_subtype(dogsdelegate33554494(_,_),icollection33555619(_)).
not_subtype(dogsdelegate33554494(_,_),ienumerable33555569).
not_subtype(dogsdelegate33554494(_,_),ienumerable33555622(_)).
not_subtype(dogsdelegate33554494(_,_),ilist33555573).
not_subtype(dogsdelegate33554494(_,_),ilist33555625(_)).
not_subtype(dogsdelegate33554494(_,_),ireadonlycollection33555626(_)).
not_subtype(dogsdelegate33554494(_,_),ireadonlylist33555627(_)).
not_subtype(dogsdelegate33554494(_,_),istructuralcomparable33555577).
not_subtype(dogsdelegate33554494(_,_),istructuralequatable33555576).
not_subtype(dogsdelegate33554494(_,_),vector33554435(_)).
not_subtype(dogsdelegate33554494(_,B),dogsdelegate33554494(_,D)) :- B \= D.
not_subtype(dogsdelegate33554494(A,_),dogsdelegate33554494(C,_)) :- A \= C.
not_subtype(icloneable33554495,array33554517).
not_subtype(icloneable33554495,delegate33554565).
not_subtype(icloneable33554495,dogsdelegate33554494(_,_)).
not_subtype(icloneable33554495,icollection33555565).
not_subtype(icloneable33554495,icollection33555619(_)).
not_subtype(icloneable33554495,ienumerable33555569).
not_subtype(icloneable33554495,ienumerable33555622(_)).
not_subtype(icloneable33554495,ilist33555573).
not_subtype(icloneable33554495,ilist33555625(_)).
not_subtype(icloneable33554495,ireadonlycollection33555626(_)).
not_subtype(icloneable33554495,ireadonlylist33555627(_)).
not_subtype(icloneable33554495,iserializable33556234).
not_subtype(icloneable33554495,istructuralcomparable33555577).
not_subtype(icloneable33554495,istructuralequatable33555576).
not_subtype(icloneable33554495,multicastdelegate33554567).
not_subtype(icloneable33554495,vector33554435(_)).
not_subtype(icollection33555565,array33554517).
not_subtype(icollection33555565,delegate33554565).
not_subtype(icollection33555565,dogsdelegate33554494(_,_)).
not_subtype(icollection33555565,icloneable33554495).
not_subtype(icollection33555565,icollection33555619(_)).
not_subtype(icollection33555565,ienumerable33555622(_)).
not_subtype(icollection33555565,ilist33555573).
not_subtype(icollection33555565,ilist33555625(_)).
not_subtype(icollection33555565,ireadonlycollection33555626(_)).
not_subtype(icollection33555565,ireadonlylist33555627(_)).
not_subtype(icollection33555565,iserializable33556234).
not_subtype(icollection33555565,istructuralcomparable33555577).
not_subtype(icollection33555565,istructuralequatable33555576).
not_subtype(icollection33555565,multicastdelegate33554567).
not_subtype(icollection33555565,vector33554435(_)).
not_subtype(icollection33555619(_),array33554517).
not_subtype(icollection33555619(_),delegate33554565).
not_subtype(icollection33555619(_),dogsdelegate33554494(_,_)).
not_subtype(icollection33555619(_),icloneable33554495).
not_subtype(icollection33555619(_),icollection33555565).
not_subtype(icollection33555619(_),ilist33555573).
not_subtype(icollection33555619(_),ilist33555625(_)).
not_subtype(icollection33555619(_),ireadonlycollection33555626(_)).
not_subtype(icollection33555619(_),ireadonlylist33555627(_)).
not_subtype(icollection33555619(_),iserializable33556234).
not_subtype(icollection33555619(_),istructuralcomparable33555577).
not_subtype(icollection33555619(_),istructuralequatable33555576).
not_subtype(icollection33555619(_),multicastdelegate33554567).
not_subtype(icollection33555619(_),vector33554435(_)).
not_subtype(icollection33555619(A),icollection33555619(B)) :- A \= B.
not_subtype(icollection33555619(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ienumerable33555569,array33554517).
not_subtype(ienumerable33555569,delegate33554565).
not_subtype(ienumerable33555569,dogsdelegate33554494(_,_)).
not_subtype(ienumerable33555569,icloneable33554495).
not_subtype(ienumerable33555569,icollection33555565).
not_subtype(ienumerable33555569,icollection33555619(_)).
not_subtype(ienumerable33555569,ienumerable33555622(_)).
not_subtype(ienumerable33555569,ilist33555573).
not_subtype(ienumerable33555569,ilist33555625(_)).
not_subtype(ienumerable33555569,ireadonlycollection33555626(_)).
not_subtype(ienumerable33555569,ireadonlylist33555627(_)).
not_subtype(ienumerable33555569,iserializable33556234).
not_subtype(ienumerable33555569,istructuralcomparable33555577).
not_subtype(ienumerable33555569,istructuralequatable33555576).
not_subtype(ienumerable33555569,multicastdelegate33554567).
not_subtype(ienumerable33555569,vector33554435(_)).
not_subtype(ienumerable33555622(_),array33554517).
not_subtype(ienumerable33555622(_),delegate33554565).
not_subtype(ienumerable33555622(_),dogsdelegate33554494(_,_)).
not_subtype(ienumerable33555622(_),icloneable33554495).
not_subtype(ienumerable33555622(_),icollection33555565).
not_subtype(ienumerable33555622(_),icollection33555619(_)).
not_subtype(ienumerable33555622(_),ilist33555573).
not_subtype(ienumerable33555622(_),ilist33555625(_)).
not_subtype(ienumerable33555622(_),ireadonlycollection33555626(_)).
not_subtype(ienumerable33555622(_),ireadonlylist33555627(_)).
not_subtype(ienumerable33555622(_),iserializable33556234).
not_subtype(ienumerable33555622(_),istructuralcomparable33555577).
not_subtype(ienumerable33555622(_),istructuralequatable33555576).
not_subtype(ienumerable33555622(_),multicastdelegate33554567).
not_subtype(ienumerable33555622(_),vector33554435(_)).
not_subtype(ienumerable33555622(A),ienumerable33555622(B)) :- not_covariant_subtype(A,B).
not_subtype(ilist33555573,array33554517).
not_subtype(ilist33555573,delegate33554565).
not_subtype(ilist33555573,dogsdelegate33554494(_,_)).
not_subtype(ilist33555573,icloneable33554495).
not_subtype(ilist33555573,icollection33555619(_)).
not_subtype(ilist33555573,ienumerable33555622(_)).
not_subtype(ilist33555573,ilist33555625(_)).
not_subtype(ilist33555573,ireadonlycollection33555626(_)).
not_subtype(ilist33555573,ireadonlylist33555627(_)).
not_subtype(ilist33555573,iserializable33556234).
not_subtype(ilist33555573,istructuralcomparable33555577).
not_subtype(ilist33555573,istructuralequatable33555576).
not_subtype(ilist33555573,multicastdelegate33554567).
not_subtype(ilist33555573,vector33554435(_)).
not_subtype(ilist33555625(_),array33554517).
not_subtype(ilist33555625(_),delegate33554565).
not_subtype(ilist33555625(_),dogsdelegate33554494(_,_)).
not_subtype(ilist33555625(_),icloneable33554495).
not_subtype(ilist33555625(_),icollection33555565).
not_subtype(ilist33555625(_),ilist33555573).
not_subtype(ilist33555625(_),ireadonlycollection33555626(_)).
not_subtype(ilist33555625(_),ireadonlylist33555627(_)).
not_subtype(ilist33555625(_),iserializable33556234).
not_subtype(ilist33555625(_),istructuralcomparable33555577).
not_subtype(ilist33555625(_),istructuralequatable33555576).
not_subtype(ilist33555625(_),multicastdelegate33554567).
not_subtype(ilist33555625(_),vector33554435(_)).
not_subtype(ilist33555625(A),icollection33555619(B)) :- not_subtype(icollection33555619(A),icollection33555619(B)).
not_subtype(ilist33555625(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ilist33555625(A),ilist33555625(B)) :- A \= B.
not_subtype(ireadonlycollection33555626(_),array33554517).
not_subtype(ireadonlycollection33555626(_),delegate33554565).
not_subtype(ireadonlycollection33555626(_),dogsdelegate33554494(_,_)).
not_subtype(ireadonlycollection33555626(_),icloneable33554495).
not_subtype(ireadonlycollection33555626(_),icollection33555565).
not_subtype(ireadonlycollection33555626(_),icollection33555619(_)).
not_subtype(ireadonlycollection33555626(_),ilist33555573).
not_subtype(ireadonlycollection33555626(_),ilist33555625(_)).
not_subtype(ireadonlycollection33555626(_),ireadonlylist33555627(_)).
not_subtype(ireadonlycollection33555626(_),iserializable33556234).
not_subtype(ireadonlycollection33555626(_),istructuralcomparable33555577).
not_subtype(ireadonlycollection33555626(_),istructuralequatable33555576).
not_subtype(ireadonlycollection33555626(_),multicastdelegate33554567).
not_subtype(ireadonlycollection33555626(_),vector33554435(_)).
not_subtype(ireadonlycollection33555626(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)) :- not_covariant_subtype(A,B).
not_subtype(ireadonlylist33555627(_),array33554517).
not_subtype(ireadonlylist33555627(_),delegate33554565).
not_subtype(ireadonlylist33555627(_),dogsdelegate33554494(_,_)).
not_subtype(ireadonlylist33555627(_),icloneable33554495).
not_subtype(ireadonlylist33555627(_),icollection33555565).
not_subtype(ireadonlylist33555627(_),icollection33555619(_)).
not_subtype(ireadonlylist33555627(_),ilist33555573).
not_subtype(ireadonlylist33555627(_),ilist33555625(_)).
not_subtype(ireadonlylist33555627(_),iserializable33556234).
not_subtype(ireadonlylist33555627(_),istructuralcomparable33555577).
not_subtype(ireadonlylist33555627(_),istructuralequatable33555576).
not_subtype(ireadonlylist33555627(_),multicastdelegate33554567).
not_subtype(ireadonlylist33555627(_),vector33554435(_)).
not_subtype(ireadonlylist33555627(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ireadonlylist33555627(A),ireadonlycollection33555626(B)) :- not_subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)).
not_subtype(ireadonlylist33555627(A),ireadonlylist33555627(B)) :- not_covariant_subtype(A,B).
not_subtype(iserializable33556234,array33554517).
not_subtype(iserializable33556234,delegate33554565).
not_subtype(iserializable33556234,dogsdelegate33554494(_,_)).
not_subtype(iserializable33556234,icloneable33554495).
not_subtype(iserializable33556234,icollection33555565).
not_subtype(iserializable33556234,icollection33555619(_)).
not_subtype(iserializable33556234,ienumerable33555569).
not_subtype(iserializable33556234,ienumerable33555622(_)).
not_subtype(iserializable33556234,ilist33555573).
not_subtype(iserializable33556234,ilist33555625(_)).
not_subtype(iserializable33556234,ireadonlycollection33555626(_)).
not_subtype(iserializable33556234,ireadonlylist33555627(_)).
not_subtype(iserializable33556234,istructuralcomparable33555577).
not_subtype(iserializable33556234,istructuralequatable33555576).
not_subtype(iserializable33556234,multicastdelegate33554567).
not_subtype(iserializable33556234,vector33554435(_)).
not_subtype(istructuralcomparable33555577,array33554517).
not_subtype(istructuralcomparable33555577,delegate33554565).
not_subtype(istructuralcomparable33555577,dogsdelegate33554494(_,_)).
not_subtype(istructuralcomparable33555577,icloneable33554495).
not_subtype(istructuralcomparable33555577,icollection33555565).
not_subtype(istructuralcomparable33555577,icollection33555619(_)).
not_subtype(istructuralcomparable33555577,ienumerable33555569).
not_subtype(istructuralcomparable33555577,ienumerable33555622(_)).
not_subtype(istructuralcomparable33555577,ilist33555573).
not_subtype(istructuralcomparable33555577,ilist33555625(_)).
not_subtype(istructuralcomparable33555577,ireadonlycollection33555626(_)).
not_subtype(istructuralcomparable33555577,ireadonlylist33555627(_)).
not_subtype(istructuralcomparable33555577,iserializable33556234).
not_subtype(istructuralcomparable33555577,istructuralequatable33555576).
not_subtype(istructuralcomparable33555577,multicastdelegate33554567).
not_subtype(istructuralcomparable33555577,vector33554435(_)).
not_subtype(istructuralequatable33555576,array33554517).
not_subtype(istructuralequatable33555576,delegate33554565).
not_subtype(istructuralequatable33555576,dogsdelegate33554494(_,_)).
not_subtype(istructuralequatable33555576,icloneable33554495).
not_subtype(istructuralequatable33555576,icollection33555565).
not_subtype(istructuralequatable33555576,icollection33555619(_)).
not_subtype(istructuralequatable33555576,ienumerable33555569).
not_subtype(istructuralequatable33555576,ienumerable33555622(_)).
not_subtype(istructuralequatable33555576,ilist33555573).
not_subtype(istructuralequatable33555576,ilist33555625(_)).
not_subtype(istructuralequatable33555576,ireadonlycollection33555626(_)).
not_subtype(istructuralequatable33555576,ireadonlylist33555627(_)).
not_subtype(istructuralequatable33555576,iserializable33556234).
not_subtype(istructuralequatable33555576,istructuralcomparable33555577).
not_subtype(istructuralequatable33555576,multicastdelegate33554567).
not_subtype(istructuralequatable33555576,vector33554435(_)).
not_subtype(multicastdelegate33554567,array33554517).
not_subtype(multicastdelegate33554567,dogsdelegate33554494(_,_)).
not_subtype(multicastdelegate33554567,icollection33555565).
not_subtype(multicastdelegate33554567,icollection33555619(_)).
not_subtype(multicastdelegate33554567,ienumerable33555569).
not_subtype(multicastdelegate33554567,ienumerable33555622(_)).
not_subtype(multicastdelegate33554567,ilist33555573).
not_subtype(multicastdelegate33554567,ilist33555625(_)).
not_subtype(multicastdelegate33554567,ireadonlycollection33555626(_)).
not_subtype(multicastdelegate33554567,ireadonlylist33555627(_)).
not_subtype(multicastdelegate33554567,istructuralcomparable33555577).
not_subtype(multicastdelegate33554567,istructuralequatable33555576).
not_subtype(multicastdelegate33554567,vector33554435(_)).
not_subtype(object33554493,array33554517).
not_subtype(object33554493,delegate33554565).
not_subtype(object33554493,dogsdelegate33554494(_,_)).
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
not_subtype(object33554493,istructuralcomparable33555577).
not_subtype(object33554493,istructuralequatable33555576).
not_subtype(object33554493,multicastdelegate33554567).
not_subtype(object33554493,vector33554435(_)).
not_subtype(vector33554435(_),delegate33554565).
not_subtype(vector33554435(_),dogsdelegate33554494(_,_)).
not_subtype(vector33554435(_),iserializable33556234).
not_subtype(vector33554435(_),multicastdelegate33554567).
not_subtype(vector33554435(A),icollection33555619(B)) :- not_subtype(icollection33555619(A),icollection33555619(B)).
not_subtype(vector33554435(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(vector33554435(A),ilist33555625(B)) :- not_subtype(ilist33555625(A),ilist33555625(B)).
not_subtype(vector33554435(A),ireadonlycollection33555626(B)) :- not_subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)).
not_subtype(vector33554435(A),ireadonlylist33555627(B)) :- not_subtype(ireadonlylist33555627(A),ireadonlylist33555627(B)).
not_subtype(vector33554435(A),vector33554435(B)) :- not_covariant_subtype(A,B).
subtype(array33554517,array33554517).
subtype(array33554517,icloneable33554495).
subtype(array33554517,icollection33555565).
subtype(array33554517,ienumerable33555569).
subtype(array33554517,ilist33555573).
subtype(array33554517,istructuralcomparable33555577).
subtype(array33554517,istructuralequatable33555576).
subtype(array33554517,object33554493).
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
subtype(istructuralcomparable33555577,istructuralcomparable33555577).
subtype(istructuralcomparable33555577,object33554493).
subtype(istructuralequatable33555576,istructuralequatable33555576).
subtype(istructuralequatable33555576,object33554493).
subtype(multicastdelegate33554567,delegate33554565).
subtype(multicastdelegate33554567,icloneable33554495).
subtype(multicastdelegate33554567,iserializable33556234).
subtype(multicastdelegate33554567,multicastdelegate33554567).
subtype(multicastdelegate33554567,object33554493).
subtype(object33554493,object33554493).
subtype(vector33554435(_),array33554517).
subtype(vector33554435(_),icloneable33554495).
subtype(vector33554435(_),icollection33555565).
subtype(vector33554435(_),ienumerable33555569).
subtype(vector33554435(_),ilist33555573).
subtype(vector33554435(_),istructuralcomparable33555577).
subtype(vector33554435(_),istructuralequatable33555576).
subtype(vector33554435(_),object33554493).
subtype(vector33554435(A),icollection33555619(B)) :- subtype(icollection33555619(A),icollection33555619(B)).
subtype(vector33554435(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(vector33554435(A),ilist33555625(B)) :- subtype(ilist33555625(A),ilist33555625(B)).
subtype(vector33554435(A),ireadonlycollection33555626(B)) :- subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)).
subtype(vector33554435(A),ireadonlylist33555627(B)) :- subtype(ireadonlylist33555627(A),ireadonlylist33555627(B)).
subtype(vector33554435(A),vector33554435(B)) :- covariant_subtype(A,B).
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (subtype(B,dogsdelegate33554494(C,D)), subtype(vector33554435(A),A), not_subtype(vector33554435(A),A), format('~w ~w~n', ['B =', B]),format('~w ~w~n', ['C =', C]),format('~w ~w~n', ['D =', D]),format('~w ~w~n', ['A =', A]))))).