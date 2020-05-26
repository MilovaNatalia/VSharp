contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(object33554493).
is_reference(action33554497).
is_reference(array33554517).
is_reference(delegate33554565).
is_reference(icloneable33554495).
is_reference(icollection33555565).
is_reference(ienumerable33555569).
is_reference(ilist33555573).
is_reference(iserializable33556234).
is_reference(istructuralcomparable33555577).
is_reference(istructuralequatable33555576).
is_reference(multicastdelegate33554567).
is_reference(object33554493).
is_unmanaged(_) :- false.
is_valuetype(_) :- false.
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(action33554497,array33554517).
not_subtype(action33554497,icollection33555565).
not_subtype(action33554497,ienumerable33555569).
not_subtype(action33554497,ilist33555573).
not_subtype(action33554497,istructuralcomparable33555577).
not_subtype(action33554497,istructuralequatable33555576).
not_subtype(array33554517,action33554497).
not_subtype(array33554517,delegate33554565).
not_subtype(array33554517,iserializable33556234).
not_subtype(array33554517,multicastdelegate33554567).
not_subtype(delegate33554565,action33554497).
not_subtype(delegate33554565,array33554517).
not_subtype(delegate33554565,icollection33555565).
not_subtype(delegate33554565,ienumerable33555569).
not_subtype(delegate33554565,ilist33555573).
not_subtype(delegate33554565,istructuralcomparable33555577).
not_subtype(delegate33554565,istructuralequatable33555576).
not_subtype(delegate33554565,multicastdelegate33554567).
not_subtype(icloneable33554495,action33554497).
not_subtype(icloneable33554495,array33554517).
not_subtype(icloneable33554495,delegate33554565).
not_subtype(icloneable33554495,icollection33555565).
not_subtype(icloneable33554495,ienumerable33555569).
not_subtype(icloneable33554495,ilist33555573).
not_subtype(icloneable33554495,iserializable33556234).
not_subtype(icloneable33554495,istructuralcomparable33555577).
not_subtype(icloneable33554495,istructuralequatable33555576).
not_subtype(icloneable33554495,multicastdelegate33554567).
not_subtype(icollection33555565,action33554497).
not_subtype(icollection33555565,array33554517).
not_subtype(icollection33555565,delegate33554565).
not_subtype(icollection33555565,icloneable33554495).
not_subtype(icollection33555565,ilist33555573).
not_subtype(icollection33555565,iserializable33556234).
not_subtype(icollection33555565,istructuralcomparable33555577).
not_subtype(icollection33555565,istructuralequatable33555576).
not_subtype(icollection33555565,multicastdelegate33554567).
not_subtype(ienumerable33555569,action33554497).
not_subtype(ienumerable33555569,array33554517).
not_subtype(ienumerable33555569,delegate33554565).
not_subtype(ienumerable33555569,icloneable33554495).
not_subtype(ienumerable33555569,icollection33555565).
not_subtype(ienumerable33555569,ilist33555573).
not_subtype(ienumerable33555569,iserializable33556234).
not_subtype(ienumerable33555569,istructuralcomparable33555577).
not_subtype(ienumerable33555569,istructuralequatable33555576).
not_subtype(ienumerable33555569,multicastdelegate33554567).
not_subtype(ilist33555573,action33554497).
not_subtype(ilist33555573,array33554517).
not_subtype(ilist33555573,delegate33554565).
not_subtype(ilist33555573,icloneable33554495).
not_subtype(ilist33555573,iserializable33556234).
not_subtype(ilist33555573,istructuralcomparable33555577).
not_subtype(ilist33555573,istructuralequatable33555576).
not_subtype(ilist33555573,multicastdelegate33554567).
not_subtype(iserializable33556234,action33554497).
not_subtype(iserializable33556234,array33554517).
not_subtype(iserializable33556234,delegate33554565).
not_subtype(iserializable33556234,icloneable33554495).
not_subtype(iserializable33556234,icollection33555565).
not_subtype(iserializable33556234,ienumerable33555569).
not_subtype(iserializable33556234,ilist33555573).
not_subtype(iserializable33556234,istructuralcomparable33555577).
not_subtype(iserializable33556234,istructuralequatable33555576).
not_subtype(iserializable33556234,multicastdelegate33554567).
not_subtype(istructuralcomparable33555577,action33554497).
not_subtype(istructuralcomparable33555577,array33554517).
not_subtype(istructuralcomparable33555577,delegate33554565).
not_subtype(istructuralcomparable33555577,icloneable33554495).
not_subtype(istructuralcomparable33555577,icollection33555565).
not_subtype(istructuralcomparable33555577,ienumerable33555569).
not_subtype(istructuralcomparable33555577,ilist33555573).
not_subtype(istructuralcomparable33555577,iserializable33556234).
not_subtype(istructuralcomparable33555577,istructuralequatable33555576).
not_subtype(istructuralcomparable33555577,multicastdelegate33554567).
not_subtype(istructuralequatable33555576,action33554497).
not_subtype(istructuralequatable33555576,array33554517).
not_subtype(istructuralequatable33555576,delegate33554565).
not_subtype(istructuralequatable33555576,icloneable33554495).
not_subtype(istructuralequatable33555576,icollection33555565).
not_subtype(istructuralequatable33555576,ienumerable33555569).
not_subtype(istructuralequatable33555576,ilist33555573).
not_subtype(istructuralequatable33555576,iserializable33556234).
not_subtype(istructuralequatable33555576,istructuralcomparable33555577).
not_subtype(istructuralequatable33555576,multicastdelegate33554567).
not_subtype(multicastdelegate33554567,action33554497).
not_subtype(multicastdelegate33554567,array33554517).
not_subtype(multicastdelegate33554567,icollection33555565).
not_subtype(multicastdelegate33554567,ienumerable33555569).
not_subtype(multicastdelegate33554567,ilist33555573).
not_subtype(multicastdelegate33554567,istructuralcomparable33555577).
not_subtype(multicastdelegate33554567,istructuralequatable33555576).
not_subtype(object33554493,action33554497).
not_subtype(object33554493,array33554517).
not_subtype(object33554493,delegate33554565).
not_subtype(object33554493,icloneable33554495).
not_subtype(object33554493,icollection33555565).
not_subtype(object33554493,ienumerable33555569).
not_subtype(object33554493,ilist33555573).
not_subtype(object33554493,iserializable33556234).
not_subtype(object33554493,istructuralcomparable33555577).
not_subtype(object33554493,istructuralequatable33555576).
not_subtype(object33554493,multicastdelegate33554567).
subtype(action33554497,action33554497).
subtype(action33554497,delegate33554565).
subtype(action33554497,icloneable33554495).
subtype(action33554497,iserializable33556234).
subtype(action33554497,multicastdelegate33554567).
subtype(action33554497,object33554493).
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
subtype(icloneable33554495,icloneable33554495).
subtype(icloneable33554495,object33554493).
subtype(icollection33555565,icollection33555565).
subtype(icollection33555565,ienumerable33555569).
subtype(icollection33555565,object33554493).
subtype(ienumerable33555569,ienumerable33555569).
subtype(ienumerable33555569,object33554493).
subtype(ilist33555573,icollection33555565).
subtype(ilist33555573,ienumerable33555569).
subtype(ilist33555573,ilist33555573).
subtype(ilist33555573,object33554493).
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
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (not_subtype(A,action33554497), not_subtype(B,array33554517), not_subtype(A,array33554517), format('~w ~w~n', ['A =', A]),format('~w ~w~n', ['B =', B]))))).
