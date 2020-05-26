contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(object33554493).
is_reference(array33554517).
is_reference(expression33554963).
is_reference(icloneable33554495).
is_reference(icollection33555565).
is_reference(icollection33555619(_)).
is_reference(ienumerable33555569).
is_reference(ienumerable33555622(_)).
is_reference(ilist33555573).
is_reference(ilist33555625(_)).
is_reference(iqueryable33554758).
is_reference(iqueryable33554759(_)).
is_reference(ireadonlycollection33555626(_)).
is_reference(ireadonlylist33555627(_)).
is_reference(istructuralcomparable33555577).
is_reference(istructuralequatable33555576).
is_reference(object33554493).
is_reference(vector33554435(_)).
is_unmanaged(_) :- false.
is_valuetype(_) :- false.
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(array33554517,expression33554963).
not_subtype(array33554517,icollection33555619(_)).
not_subtype(array33554517,ienumerable33555622(_)).
not_subtype(array33554517,ilist33555625(_)).
not_subtype(array33554517,iqueryable33554758).
not_subtype(array33554517,iqueryable33554759(_)).
not_subtype(array33554517,ireadonlycollection33555626(_)).
not_subtype(array33554517,ireadonlylist33555627(_)).
not_subtype(array33554517,vector33554435(_)).
not_subtype(expression33554963,array33554517).
not_subtype(expression33554963,icloneable33554495).
not_subtype(expression33554963,icollection33555565).
not_subtype(expression33554963,icollection33555619(_)).
not_subtype(expression33554963,ienumerable33555569).
not_subtype(expression33554963,ienumerable33555622(_)).
not_subtype(expression33554963,ilist33555573).
not_subtype(expression33554963,ilist33555625(_)).
not_subtype(expression33554963,iqueryable33554758).
not_subtype(expression33554963,iqueryable33554759(_)).
not_subtype(expression33554963,ireadonlycollection33555626(_)).
not_subtype(expression33554963,ireadonlylist33555627(_)).
not_subtype(expression33554963,istructuralcomparable33555577).
not_subtype(expression33554963,istructuralequatable33555576).
not_subtype(expression33554963,vector33554435(_)).
not_subtype(icloneable33554495,array33554517).
not_subtype(icloneable33554495,expression33554963).
not_subtype(icloneable33554495,icollection33555565).
not_subtype(icloneable33554495,icollection33555619(_)).
not_subtype(icloneable33554495,ienumerable33555569).
not_subtype(icloneable33554495,ienumerable33555622(_)).
not_subtype(icloneable33554495,ilist33555573).
not_subtype(icloneable33554495,ilist33555625(_)).
not_subtype(icloneable33554495,iqueryable33554758).
not_subtype(icloneable33554495,iqueryable33554759(_)).
not_subtype(icloneable33554495,ireadonlycollection33555626(_)).
not_subtype(icloneable33554495,ireadonlylist33555627(_)).
not_subtype(icloneable33554495,istructuralcomparable33555577).
not_subtype(icloneable33554495,istructuralequatable33555576).
not_subtype(icloneable33554495,vector33554435(_)).
not_subtype(icollection33555565,array33554517).
not_subtype(icollection33555565,expression33554963).
not_subtype(icollection33555565,icloneable33554495).
not_subtype(icollection33555565,icollection33555619(_)).
not_subtype(icollection33555565,ienumerable33555622(_)).
not_subtype(icollection33555565,ilist33555573).
not_subtype(icollection33555565,ilist33555625(_)).
not_subtype(icollection33555565,iqueryable33554758).
not_subtype(icollection33555565,iqueryable33554759(_)).
not_subtype(icollection33555565,ireadonlycollection33555626(_)).
not_subtype(icollection33555565,ireadonlylist33555627(_)).
not_subtype(icollection33555565,istructuralcomparable33555577).
not_subtype(icollection33555565,istructuralequatable33555576).
not_subtype(icollection33555565,vector33554435(_)).
not_subtype(icollection33555619(_),array33554517).
not_subtype(icollection33555619(_),expression33554963).
not_subtype(icollection33555619(_),icloneable33554495).
not_subtype(icollection33555619(_),icollection33555565).
not_subtype(icollection33555619(_),ilist33555573).
not_subtype(icollection33555619(_),ilist33555625(_)).
not_subtype(icollection33555619(_),iqueryable33554758).
not_subtype(icollection33555619(_),iqueryable33554759(_)).
not_subtype(icollection33555619(_),ireadonlycollection33555626(_)).
not_subtype(icollection33555619(_),ireadonlylist33555627(_)).
not_subtype(icollection33555619(_),istructuralcomparable33555577).
not_subtype(icollection33555619(_),istructuralequatable33555576).
not_subtype(icollection33555619(_),vector33554435(_)).
not_subtype(icollection33555619(A),icollection33555619(B)) :- A \= B.
not_subtype(icollection33555619(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ienumerable33555569,array33554517).
not_subtype(ienumerable33555569,expression33554963).
not_subtype(ienumerable33555569,icloneable33554495).
not_subtype(ienumerable33555569,icollection33555565).
not_subtype(ienumerable33555569,icollection33555619(_)).
not_subtype(ienumerable33555569,ienumerable33555622(_)).
not_subtype(ienumerable33555569,ilist33555573).
not_subtype(ienumerable33555569,ilist33555625(_)).
not_subtype(ienumerable33555569,iqueryable33554758).
not_subtype(ienumerable33555569,iqueryable33554759(_)).
not_subtype(ienumerable33555569,ireadonlycollection33555626(_)).
not_subtype(ienumerable33555569,ireadonlylist33555627(_)).
not_subtype(ienumerable33555569,istructuralcomparable33555577).
not_subtype(ienumerable33555569,istructuralequatable33555576).
not_subtype(ienumerable33555569,vector33554435(_)).
not_subtype(ienumerable33555622(_),array33554517).
not_subtype(ienumerable33555622(_),expression33554963).
not_subtype(ienumerable33555622(_),icloneable33554495).
not_subtype(ienumerable33555622(_),icollection33555565).
not_subtype(ienumerable33555622(_),icollection33555619(_)).
not_subtype(ienumerable33555622(_),ilist33555573).
not_subtype(ienumerable33555622(_),ilist33555625(_)).
not_subtype(ienumerable33555622(_),iqueryable33554758).
not_subtype(ienumerable33555622(_),iqueryable33554759(_)).
not_subtype(ienumerable33555622(_),ireadonlycollection33555626(_)).
not_subtype(ienumerable33555622(_),ireadonlylist33555627(_)).
not_subtype(ienumerable33555622(_),istructuralcomparable33555577).
not_subtype(ienumerable33555622(_),istructuralequatable33555576).
not_subtype(ienumerable33555622(_),vector33554435(_)).
not_subtype(ienumerable33555622(A),ienumerable33555622(B)) :- not_covariant_subtype(A,B).
not_subtype(ilist33555573,array33554517).
not_subtype(ilist33555573,expression33554963).
not_subtype(ilist33555573,icloneable33554495).
not_subtype(ilist33555573,icollection33555619(_)).
not_subtype(ilist33555573,ienumerable33555622(_)).
not_subtype(ilist33555573,ilist33555625(_)).
not_subtype(ilist33555573,iqueryable33554758).
not_subtype(ilist33555573,iqueryable33554759(_)).
not_subtype(ilist33555573,ireadonlycollection33555626(_)).
not_subtype(ilist33555573,ireadonlylist33555627(_)).
not_subtype(ilist33555573,istructuralcomparable33555577).
not_subtype(ilist33555573,istructuralequatable33555576).
not_subtype(ilist33555573,vector33554435(_)).
not_subtype(ilist33555625(_),array33554517).
not_subtype(ilist33555625(_),expression33554963).
not_subtype(ilist33555625(_),icloneable33554495).
not_subtype(ilist33555625(_),icollection33555565).
not_subtype(ilist33555625(_),ilist33555573).
not_subtype(ilist33555625(_),iqueryable33554758).
not_subtype(ilist33555625(_),iqueryable33554759(_)).
not_subtype(ilist33555625(_),ireadonlycollection33555626(_)).
not_subtype(ilist33555625(_),ireadonlylist33555627(_)).
not_subtype(ilist33555625(_),istructuralcomparable33555577).
not_subtype(ilist33555625(_),istructuralequatable33555576).
not_subtype(ilist33555625(_),vector33554435(_)).
not_subtype(ilist33555625(A),icollection33555619(B)) :- not_subtype(icollection33555619(A),icollection33555619(B)).
not_subtype(ilist33555625(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ilist33555625(A),ilist33555625(B)) :- A \= B.
not_subtype(iqueryable33554758,array33554517).
not_subtype(iqueryable33554758,expression33554963).
not_subtype(iqueryable33554758,icloneable33554495).
not_subtype(iqueryable33554758,icollection33555565).
not_subtype(iqueryable33554758,icollection33555619(_)).
not_subtype(iqueryable33554758,ienumerable33555622(_)).
not_subtype(iqueryable33554758,ilist33555573).
not_subtype(iqueryable33554758,ilist33555625(_)).
not_subtype(iqueryable33554758,iqueryable33554759(_)).
not_subtype(iqueryable33554758,ireadonlycollection33555626(_)).
not_subtype(iqueryable33554758,ireadonlylist33555627(_)).
not_subtype(iqueryable33554758,istructuralcomparable33555577).
not_subtype(iqueryable33554758,istructuralequatable33555576).
not_subtype(iqueryable33554758,vector33554435(_)).
not_subtype(iqueryable33554759(_),array33554517).
not_subtype(iqueryable33554759(_),expression33554963).
not_subtype(iqueryable33554759(_),icloneable33554495).
not_subtype(iqueryable33554759(_),icollection33555565).
not_subtype(iqueryable33554759(_),icollection33555619(_)).
not_subtype(iqueryable33554759(_),ilist33555573).
not_subtype(iqueryable33554759(_),ilist33555625(_)).
not_subtype(iqueryable33554759(_),ireadonlycollection33555626(_)).
not_subtype(iqueryable33554759(_),ireadonlylist33555627(_)).
not_subtype(iqueryable33554759(_),istructuralcomparable33555577).
not_subtype(iqueryable33554759(_),istructuralequatable33555576).
not_subtype(iqueryable33554759(_),vector33554435(_)).
not_subtype(iqueryable33554759(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(iqueryable33554759(A),iqueryable33554759(B)) :- not_covariant_subtype(A,B).
not_subtype(ireadonlycollection33555626(_),array33554517).
not_subtype(ireadonlycollection33555626(_),expression33554963).
not_subtype(ireadonlycollection33555626(_),icloneable33554495).
not_subtype(ireadonlycollection33555626(_),icollection33555565).
not_subtype(ireadonlycollection33555626(_),icollection33555619(_)).
not_subtype(ireadonlycollection33555626(_),ilist33555573).
not_subtype(ireadonlycollection33555626(_),ilist33555625(_)).
not_subtype(ireadonlycollection33555626(_),iqueryable33554758).
not_subtype(ireadonlycollection33555626(_),iqueryable33554759(_)).
not_subtype(ireadonlycollection33555626(_),ireadonlylist33555627(_)).
not_subtype(ireadonlycollection33555626(_),istructuralcomparable33555577).
not_subtype(ireadonlycollection33555626(_),istructuralequatable33555576).
not_subtype(ireadonlycollection33555626(_),vector33554435(_)).
not_subtype(ireadonlycollection33555626(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)) :- not_covariant_subtype(A,B).
not_subtype(ireadonlylist33555627(_),array33554517).
not_subtype(ireadonlylist33555627(_),expression33554963).
not_subtype(ireadonlylist33555627(_),icloneable33554495).
not_subtype(ireadonlylist33555627(_),icollection33555565).
not_subtype(ireadonlylist33555627(_),icollection33555619(_)).
not_subtype(ireadonlylist33555627(_),ilist33555573).
not_subtype(ireadonlylist33555627(_),ilist33555625(_)).
not_subtype(ireadonlylist33555627(_),iqueryable33554758).
not_subtype(ireadonlylist33555627(_),iqueryable33554759(_)).
not_subtype(ireadonlylist33555627(_),istructuralcomparable33555577).
not_subtype(ireadonlylist33555627(_),istructuralequatable33555576).
not_subtype(ireadonlylist33555627(_),vector33554435(_)).
not_subtype(ireadonlylist33555627(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ireadonlylist33555627(A),ireadonlycollection33555626(B)) :- not_subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)).
not_subtype(ireadonlylist33555627(A),ireadonlylist33555627(B)) :- not_covariant_subtype(A,B).
not_subtype(istructuralcomparable33555577,array33554517).
not_subtype(istructuralcomparable33555577,expression33554963).
not_subtype(istructuralcomparable33555577,icloneable33554495).
not_subtype(istructuralcomparable33555577,icollection33555565).
not_subtype(istructuralcomparable33555577,icollection33555619(_)).
not_subtype(istructuralcomparable33555577,ienumerable33555569).
not_subtype(istructuralcomparable33555577,ienumerable33555622(_)).
not_subtype(istructuralcomparable33555577,ilist33555573).
not_subtype(istructuralcomparable33555577,ilist33555625(_)).
not_subtype(istructuralcomparable33555577,iqueryable33554758).
not_subtype(istructuralcomparable33555577,iqueryable33554759(_)).
not_subtype(istructuralcomparable33555577,ireadonlycollection33555626(_)).
not_subtype(istructuralcomparable33555577,ireadonlylist33555627(_)).
not_subtype(istructuralcomparable33555577,istructuralequatable33555576).
not_subtype(istructuralcomparable33555577,vector33554435(_)).
not_subtype(istructuralequatable33555576,array33554517).
not_subtype(istructuralequatable33555576,expression33554963).
not_subtype(istructuralequatable33555576,icloneable33554495).
not_subtype(istructuralequatable33555576,icollection33555565).
not_subtype(istructuralequatable33555576,icollection33555619(_)).
not_subtype(istructuralequatable33555576,ienumerable33555569).
not_subtype(istructuralequatable33555576,ienumerable33555622(_)).
not_subtype(istructuralequatable33555576,ilist33555573).
not_subtype(istructuralequatable33555576,ilist33555625(_)).
not_subtype(istructuralequatable33555576,iqueryable33554758).
not_subtype(istructuralequatable33555576,iqueryable33554759(_)).
not_subtype(istructuralequatable33555576,ireadonlycollection33555626(_)).
not_subtype(istructuralequatable33555576,ireadonlylist33555627(_)).
not_subtype(istructuralequatable33555576,istructuralcomparable33555577).
not_subtype(istructuralequatable33555576,vector33554435(_)).
not_subtype(object33554493,array33554517).
not_subtype(object33554493,expression33554963).
not_subtype(object33554493,icloneable33554495).
not_subtype(object33554493,icollection33555565).
not_subtype(object33554493,icollection33555619(_)).
not_subtype(object33554493,ienumerable33555569).
not_subtype(object33554493,ienumerable33555622(_)).
not_subtype(object33554493,ilist33555573).
not_subtype(object33554493,ilist33555625(_)).
not_subtype(object33554493,iqueryable33554758).
not_subtype(object33554493,iqueryable33554759(_)).
not_subtype(object33554493,ireadonlycollection33555626(_)).
not_subtype(object33554493,ireadonlylist33555627(_)).
not_subtype(object33554493,istructuralcomparable33555577).
not_subtype(object33554493,istructuralequatable33555576).
not_subtype(object33554493,vector33554435(_)).
not_subtype(vector33554435(_),expression33554963).
not_subtype(vector33554435(_),iqueryable33554758).
not_subtype(vector33554435(_),iqueryable33554759(_)).
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
subtype(expression33554963,expression33554963).
subtype(expression33554963,object33554493).
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
subtype(iqueryable33554758,ienumerable33555569).
subtype(iqueryable33554758,iqueryable33554758).
subtype(iqueryable33554758,object33554493).
subtype(iqueryable33554759(_),ienumerable33555569).
subtype(iqueryable33554759(_),iqueryable33554758).
subtype(iqueryable33554759(_),object33554493).
subtype(iqueryable33554759(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(iqueryable33554759(A),iqueryable33554759(B)) :- covariant_subtype(A,B).
subtype(ireadonlycollection33555626(_),ienumerable33555569).
subtype(ireadonlycollection33555626(_),object33554493).
subtype(ireadonlycollection33555626(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)) :- covariant_subtype(A,B).
subtype(ireadonlylist33555627(_),ienumerable33555569).
subtype(ireadonlylist33555627(_),object33554493).
subtype(ireadonlylist33555627(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(ireadonlylist33555627(A),ireadonlycollection33555626(B)) :- subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)).
subtype(ireadonlylist33555627(A),ireadonlylist33555627(B)) :- covariant_subtype(A,B).
subtype(istructuralcomparable33555577,istructuralcomparable33555577).
subtype(istructuralcomparable33555577,object33554493).
subtype(istructuralequatable33555576,istructuralequatable33555576).
subtype(istructuralequatable33555576,object33554493).
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
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (subtype(B,vector33554435(B)), subtype(expression33554963,iqueryable33554759(A)), not_subtype(expression33554963,iqueryable33554759(A)), is_reference(B), format('~w ~w~n', ['B =', B]),format('~w ~w~n', ['A =', A]))))).
