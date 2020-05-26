contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(int3233554683).
default_constructor(object33554493).
is_reference(array233554434(_)).
is_reference(array33554517).
is_reference(ia33554436(_)).
is_reference(icloneable33554495).
is_reference(icollection33555565).
is_reference(icollection33555619(_)).
is_reference(icomparable33554520).
is_reference(icomparable33554521(_)).
is_reference(iconvertible33554691).
is_reference(ienumerable33555569).
is_reference(ienumerable33555622(_)).
is_reference(iequatable33554522(_)).
is_reference(iformattable33554672).
is_reference(ilist33555573).
is_reference(ilist33555625(_)).
is_reference(ireadonlycollection33555626(_)).
is_reference(ireadonlylist33555627(_)).
is_reference(istructuralcomparable33555577).
is_reference(istructuralequatable33555576).
is_reference(object33554493).
is_reference(valuetype33554777).
is_reference(vector33554435(_)).
is_unmanaged(int3233554683).
is_valuetype(int3233554683).
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(array233554434(_),ia33554436(_)).
not_subtype(array233554434(_),icollection33555619(_)).
not_subtype(array233554434(_),icomparable33554520).
not_subtype(array233554434(_),icomparable33554521(_)).
not_subtype(array233554434(_),iconvertible33554691).
not_subtype(array233554434(_),ienumerable33555622(_)).
not_subtype(array233554434(_),iequatable33554522(_)).
not_subtype(array233554434(_),iformattable33554672).
not_subtype(array233554434(_),ilist33555625(_)).
not_subtype(array233554434(_),int3233554683).
not_subtype(array233554434(_),ireadonlycollection33555626(_)).
not_subtype(array233554434(_),ireadonlylist33555627(_)).
not_subtype(array233554434(_),valuetype33554777).
not_subtype(array233554434(_),vector33554435(_)).
not_subtype(array233554434(A),array233554434(B)) :- not_covariant_subtype(A,B).
not_subtype(array33554517,array233554434(_)).
not_subtype(array33554517,ia33554436(_)).
not_subtype(array33554517,icollection33555619(_)).
not_subtype(array33554517,icomparable33554520).
not_subtype(array33554517,icomparable33554521(_)).
not_subtype(array33554517,iconvertible33554691).
not_subtype(array33554517,ienumerable33555622(_)).
not_subtype(array33554517,iequatable33554522(_)).
not_subtype(array33554517,iformattable33554672).
not_subtype(array33554517,ilist33555625(_)).
not_subtype(array33554517,int3233554683).
not_subtype(array33554517,ireadonlycollection33555626(_)).
not_subtype(array33554517,ireadonlylist33555627(_)).
not_subtype(array33554517,valuetype33554777).
not_subtype(array33554517,vector33554435(_)).
not_subtype(ia33554436(_),array233554434(_)).
not_subtype(ia33554436(_),array33554517).
not_subtype(ia33554436(_),icloneable33554495).
not_subtype(ia33554436(_),icollection33555565).
not_subtype(ia33554436(_),icollection33555619(_)).
not_subtype(ia33554436(_),icomparable33554520).
not_subtype(ia33554436(_),icomparable33554521(_)).
not_subtype(ia33554436(_),iconvertible33554691).
not_subtype(ia33554436(_),ienumerable33555569).
not_subtype(ia33554436(_),ienumerable33555622(_)).
not_subtype(ia33554436(_),iequatable33554522(_)).
not_subtype(ia33554436(_),iformattable33554672).
not_subtype(ia33554436(_),ilist33555573).
not_subtype(ia33554436(_),ilist33555625(_)).
not_subtype(ia33554436(_),int3233554683).
not_subtype(ia33554436(_),ireadonlycollection33555626(_)).
not_subtype(ia33554436(_),ireadonlylist33555627(_)).
not_subtype(ia33554436(_),istructuralcomparable33555577).
not_subtype(ia33554436(_),istructuralequatable33555576).
not_subtype(ia33554436(_),valuetype33554777).
not_subtype(ia33554436(_),vector33554435(_)).
not_subtype(ia33554436(A),ia33554436(B)) :- not_covariant_subtype(A,B).
not_subtype(icloneable33554495,array233554434(_)).
not_subtype(icloneable33554495,array33554517).
not_subtype(icloneable33554495,ia33554436(_)).
not_subtype(icloneable33554495,icollection33555565).
not_subtype(icloneable33554495,icollection33555619(_)).
not_subtype(icloneable33554495,icomparable33554520).
not_subtype(icloneable33554495,icomparable33554521(_)).
not_subtype(icloneable33554495,iconvertible33554691).
not_subtype(icloneable33554495,ienumerable33555569).
not_subtype(icloneable33554495,ienumerable33555622(_)).
not_subtype(icloneable33554495,iequatable33554522(_)).
not_subtype(icloneable33554495,iformattable33554672).
not_subtype(icloneable33554495,ilist33555573).
not_subtype(icloneable33554495,ilist33555625(_)).
not_subtype(icloneable33554495,int3233554683).
not_subtype(icloneable33554495,ireadonlycollection33555626(_)).
not_subtype(icloneable33554495,ireadonlylist33555627(_)).
not_subtype(icloneable33554495,istructuralcomparable33555577).
not_subtype(icloneable33554495,istructuralequatable33555576).
not_subtype(icloneable33554495,valuetype33554777).
not_subtype(icloneable33554495,vector33554435(_)).
not_subtype(icollection33555565,array233554434(_)).
not_subtype(icollection33555565,array33554517).
not_subtype(icollection33555565,ia33554436(_)).
not_subtype(icollection33555565,icloneable33554495).
not_subtype(icollection33555565,icollection33555619(_)).
not_subtype(icollection33555565,icomparable33554520).
not_subtype(icollection33555565,icomparable33554521(_)).
not_subtype(icollection33555565,iconvertible33554691).
not_subtype(icollection33555565,ienumerable33555622(_)).
not_subtype(icollection33555565,iequatable33554522(_)).
not_subtype(icollection33555565,iformattable33554672).
not_subtype(icollection33555565,ilist33555573).
not_subtype(icollection33555565,ilist33555625(_)).
not_subtype(icollection33555565,int3233554683).
not_subtype(icollection33555565,ireadonlycollection33555626(_)).
not_subtype(icollection33555565,ireadonlylist33555627(_)).
not_subtype(icollection33555565,istructuralcomparable33555577).
not_subtype(icollection33555565,istructuralequatable33555576).
not_subtype(icollection33555565,valuetype33554777).
not_subtype(icollection33555565,vector33554435(_)).
not_subtype(icollection33555619(_),array233554434(_)).
not_subtype(icollection33555619(_),array33554517).
not_subtype(icollection33555619(_),ia33554436(_)).
not_subtype(icollection33555619(_),icloneable33554495).
not_subtype(icollection33555619(_),icollection33555565).
not_subtype(icollection33555619(_),icomparable33554520).
not_subtype(icollection33555619(_),icomparable33554521(_)).
not_subtype(icollection33555619(_),iconvertible33554691).
not_subtype(icollection33555619(_),iequatable33554522(_)).
not_subtype(icollection33555619(_),iformattable33554672).
not_subtype(icollection33555619(_),ilist33555573).
not_subtype(icollection33555619(_),ilist33555625(_)).
not_subtype(icollection33555619(_),int3233554683).
not_subtype(icollection33555619(_),ireadonlycollection33555626(_)).
not_subtype(icollection33555619(_),ireadonlylist33555627(_)).
not_subtype(icollection33555619(_),istructuralcomparable33555577).
not_subtype(icollection33555619(_),istructuralequatable33555576).
not_subtype(icollection33555619(_),valuetype33554777).
not_subtype(icollection33555619(_),vector33554435(_)).
not_subtype(icollection33555619(A),icollection33555619(B)) :- A \= B.
not_subtype(icollection33555619(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(icomparable33554520,array233554434(_)).
not_subtype(icomparable33554520,array33554517).
not_subtype(icomparable33554520,ia33554436(_)).
not_subtype(icomparable33554520,icloneable33554495).
not_subtype(icomparable33554520,icollection33555565).
not_subtype(icomparable33554520,icollection33555619(_)).
not_subtype(icomparable33554520,icomparable33554521(_)).
not_subtype(icomparable33554520,iconvertible33554691).
not_subtype(icomparable33554520,ienumerable33555569).
not_subtype(icomparable33554520,ienumerable33555622(_)).
not_subtype(icomparable33554520,iequatable33554522(_)).
not_subtype(icomparable33554520,iformattable33554672).
not_subtype(icomparable33554520,ilist33555573).
not_subtype(icomparable33554520,ilist33555625(_)).
not_subtype(icomparable33554520,int3233554683).
not_subtype(icomparable33554520,ireadonlycollection33555626(_)).
not_subtype(icomparable33554520,ireadonlylist33555627(_)).
not_subtype(icomparable33554520,istructuralcomparable33555577).
not_subtype(icomparable33554520,istructuralequatable33555576).
not_subtype(icomparable33554520,valuetype33554777).
not_subtype(icomparable33554520,vector33554435(_)).
not_subtype(icomparable33554521(_),array233554434(_)).
not_subtype(icomparable33554521(_),array33554517).
not_subtype(icomparable33554521(_),ia33554436(_)).
not_subtype(icomparable33554521(_),icloneable33554495).
not_subtype(icomparable33554521(_),icollection33555565).
not_subtype(icomparable33554521(_),icollection33555619(_)).
not_subtype(icomparable33554521(_),icomparable33554520).
not_subtype(icomparable33554521(_),iconvertible33554691).
not_subtype(icomparable33554521(_),ienumerable33555569).
not_subtype(icomparable33554521(_),ienumerable33555622(_)).
not_subtype(icomparable33554521(_),iequatable33554522(_)).
not_subtype(icomparable33554521(_),iformattable33554672).
not_subtype(icomparable33554521(_),ilist33555573).
not_subtype(icomparable33554521(_),ilist33555625(_)).
not_subtype(icomparable33554521(_),int3233554683).
not_subtype(icomparable33554521(_),ireadonlycollection33555626(_)).
not_subtype(icomparable33554521(_),ireadonlylist33555627(_)).
not_subtype(icomparable33554521(_),istructuralcomparable33555577).
not_subtype(icomparable33554521(_),istructuralequatable33555576).
not_subtype(icomparable33554521(_),valuetype33554777).
not_subtype(icomparable33554521(_),vector33554435(_)).
not_subtype(icomparable33554521(A),icomparable33554521(B)) :- not_contravariant_subtype(A,B).
not_subtype(iconvertible33554691,array233554434(_)).
not_subtype(iconvertible33554691,array33554517).
not_subtype(iconvertible33554691,ia33554436(_)).
not_subtype(iconvertible33554691,icloneable33554495).
not_subtype(iconvertible33554691,icollection33555565).
not_subtype(iconvertible33554691,icollection33555619(_)).
not_subtype(iconvertible33554691,icomparable33554520).
not_subtype(iconvertible33554691,icomparable33554521(_)).
not_subtype(iconvertible33554691,ienumerable33555569).
not_subtype(iconvertible33554691,ienumerable33555622(_)).
not_subtype(iconvertible33554691,iequatable33554522(_)).
not_subtype(iconvertible33554691,iformattable33554672).
not_subtype(iconvertible33554691,ilist33555573).
not_subtype(iconvertible33554691,ilist33555625(_)).
not_subtype(iconvertible33554691,int3233554683).
not_subtype(iconvertible33554691,ireadonlycollection33555626(_)).
not_subtype(iconvertible33554691,ireadonlylist33555627(_)).
not_subtype(iconvertible33554691,istructuralcomparable33555577).
not_subtype(iconvertible33554691,istructuralequatable33555576).
not_subtype(iconvertible33554691,valuetype33554777).
not_subtype(iconvertible33554691,vector33554435(_)).
not_subtype(ienumerable33555569,array233554434(_)).
not_subtype(ienumerable33555569,array33554517).
not_subtype(ienumerable33555569,ia33554436(_)).
not_subtype(ienumerable33555569,icloneable33554495).
not_subtype(ienumerable33555569,icollection33555565).
not_subtype(ienumerable33555569,icollection33555619(_)).
not_subtype(ienumerable33555569,icomparable33554520).
not_subtype(ienumerable33555569,icomparable33554521(_)).
not_subtype(ienumerable33555569,iconvertible33554691).
not_subtype(ienumerable33555569,ienumerable33555622(_)).
not_subtype(ienumerable33555569,iequatable33554522(_)).
not_subtype(ienumerable33555569,iformattable33554672).
not_subtype(ienumerable33555569,ilist33555573).
not_subtype(ienumerable33555569,ilist33555625(_)).
not_subtype(ienumerable33555569,int3233554683).
not_subtype(ienumerable33555569,ireadonlycollection33555626(_)).
not_subtype(ienumerable33555569,ireadonlylist33555627(_)).
not_subtype(ienumerable33555569,istructuralcomparable33555577).
not_subtype(ienumerable33555569,istructuralequatable33555576).
not_subtype(ienumerable33555569,valuetype33554777).
not_subtype(ienumerable33555569,vector33554435(_)).
not_subtype(ienumerable33555622(_),array233554434(_)).
not_subtype(ienumerable33555622(_),array33554517).
not_subtype(ienumerable33555622(_),ia33554436(_)).
not_subtype(ienumerable33555622(_),icloneable33554495).
not_subtype(ienumerable33555622(_),icollection33555565).
not_subtype(ienumerable33555622(_),icollection33555619(_)).
not_subtype(ienumerable33555622(_),icomparable33554520).
not_subtype(ienumerable33555622(_),icomparable33554521(_)).
not_subtype(ienumerable33555622(_),iconvertible33554691).
not_subtype(ienumerable33555622(_),iequatable33554522(_)).
not_subtype(ienumerable33555622(_),iformattable33554672).
not_subtype(ienumerable33555622(_),ilist33555573).
not_subtype(ienumerable33555622(_),ilist33555625(_)).
not_subtype(ienumerable33555622(_),int3233554683).
not_subtype(ienumerable33555622(_),ireadonlycollection33555626(_)).
not_subtype(ienumerable33555622(_),ireadonlylist33555627(_)).
not_subtype(ienumerable33555622(_),istructuralcomparable33555577).
not_subtype(ienumerable33555622(_),istructuralequatable33555576).
not_subtype(ienumerable33555622(_),valuetype33554777).
not_subtype(ienumerable33555622(_),vector33554435(_)).
not_subtype(ienumerable33555622(A),ienumerable33555622(B)) :- not_covariant_subtype(A,B).
not_subtype(iequatable33554522(_),array233554434(_)).
not_subtype(iequatable33554522(_),array33554517).
not_subtype(iequatable33554522(_),ia33554436(_)).
not_subtype(iequatable33554522(_),icloneable33554495).
not_subtype(iequatable33554522(_),icollection33555565).
not_subtype(iequatable33554522(_),icollection33555619(_)).
not_subtype(iequatable33554522(_),icomparable33554520).
not_subtype(iequatable33554522(_),icomparable33554521(_)).
not_subtype(iequatable33554522(_),iconvertible33554691).
not_subtype(iequatable33554522(_),ienumerable33555569).
not_subtype(iequatable33554522(_),ienumerable33555622(_)).
not_subtype(iequatable33554522(_),iformattable33554672).
not_subtype(iequatable33554522(_),ilist33555573).
not_subtype(iequatable33554522(_),ilist33555625(_)).
not_subtype(iequatable33554522(_),int3233554683).
not_subtype(iequatable33554522(_),ireadonlycollection33555626(_)).
not_subtype(iequatable33554522(_),ireadonlylist33555627(_)).
not_subtype(iequatable33554522(_),istructuralcomparable33555577).
not_subtype(iequatable33554522(_),istructuralequatable33555576).
not_subtype(iequatable33554522(_),valuetype33554777).
not_subtype(iequatable33554522(_),vector33554435(_)).
not_subtype(iequatable33554522(A),iequatable33554522(B)) :- A \= B.
not_subtype(iformattable33554672,array233554434(_)).
not_subtype(iformattable33554672,array33554517).
not_subtype(iformattable33554672,ia33554436(_)).
not_subtype(iformattable33554672,icloneable33554495).
not_subtype(iformattable33554672,icollection33555565).
not_subtype(iformattable33554672,icollection33555619(_)).
not_subtype(iformattable33554672,icomparable33554520).
not_subtype(iformattable33554672,icomparable33554521(_)).
not_subtype(iformattable33554672,iconvertible33554691).
not_subtype(iformattable33554672,ienumerable33555569).
not_subtype(iformattable33554672,ienumerable33555622(_)).
not_subtype(iformattable33554672,iequatable33554522(_)).
not_subtype(iformattable33554672,ilist33555573).
not_subtype(iformattable33554672,ilist33555625(_)).
not_subtype(iformattable33554672,int3233554683).
not_subtype(iformattable33554672,ireadonlycollection33555626(_)).
not_subtype(iformattable33554672,ireadonlylist33555627(_)).
not_subtype(iformattable33554672,istructuralcomparable33555577).
not_subtype(iformattable33554672,istructuralequatable33555576).
not_subtype(iformattable33554672,valuetype33554777).
not_subtype(iformattable33554672,vector33554435(_)).
not_subtype(ilist33555573,array233554434(_)).
not_subtype(ilist33555573,array33554517).
not_subtype(ilist33555573,ia33554436(_)).
not_subtype(ilist33555573,icloneable33554495).
not_subtype(ilist33555573,icollection33555619(_)).
not_subtype(ilist33555573,icomparable33554520).
not_subtype(ilist33555573,icomparable33554521(_)).
not_subtype(ilist33555573,iconvertible33554691).
not_subtype(ilist33555573,ienumerable33555622(_)).
not_subtype(ilist33555573,iequatable33554522(_)).
not_subtype(ilist33555573,iformattable33554672).
not_subtype(ilist33555573,ilist33555625(_)).
not_subtype(ilist33555573,int3233554683).
not_subtype(ilist33555573,ireadonlycollection33555626(_)).
not_subtype(ilist33555573,ireadonlylist33555627(_)).
not_subtype(ilist33555573,istructuralcomparable33555577).
not_subtype(ilist33555573,istructuralequatable33555576).
not_subtype(ilist33555573,valuetype33554777).
not_subtype(ilist33555573,vector33554435(_)).
not_subtype(ilist33555625(_),array233554434(_)).
not_subtype(ilist33555625(_),array33554517).
not_subtype(ilist33555625(_),ia33554436(_)).
not_subtype(ilist33555625(_),icloneable33554495).
not_subtype(ilist33555625(_),icollection33555565).
not_subtype(ilist33555625(_),icomparable33554520).
not_subtype(ilist33555625(_),icomparable33554521(_)).
not_subtype(ilist33555625(_),iconvertible33554691).
not_subtype(ilist33555625(_),iequatable33554522(_)).
not_subtype(ilist33555625(_),iformattable33554672).
not_subtype(ilist33555625(_),ilist33555573).
not_subtype(ilist33555625(_),int3233554683).
not_subtype(ilist33555625(_),ireadonlycollection33555626(_)).
not_subtype(ilist33555625(_),ireadonlylist33555627(_)).
not_subtype(ilist33555625(_),istructuralcomparable33555577).
not_subtype(ilist33555625(_),istructuralequatable33555576).
not_subtype(ilist33555625(_),valuetype33554777).
not_subtype(ilist33555625(_),vector33554435(_)).
not_subtype(ilist33555625(A),icollection33555619(B)) :- not_subtype(icollection33555619(A),icollection33555619(B)).
not_subtype(ilist33555625(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ilist33555625(A),ilist33555625(B)) :- A \= B.
not_subtype(int3233554683,array233554434(_)).
not_subtype(int3233554683,array33554517).
not_subtype(int3233554683,ia33554436(_)).
not_subtype(int3233554683,icloneable33554495).
not_subtype(int3233554683,icollection33555565).
not_subtype(int3233554683,icollection33555619(_)).
not_subtype(int3233554683,icomparable33554521(A)) :- not_subtype(icomparable33554521(int3233554683),icomparable33554521(A)).
not_subtype(int3233554683,ienumerable33555569).
not_subtype(int3233554683,ienumerable33555622(_)).
not_subtype(int3233554683,iequatable33554522(A)) :- not_subtype(iequatable33554522(int3233554683),iequatable33554522(A)).
not_subtype(int3233554683,ilist33555573).
not_subtype(int3233554683,ilist33555625(_)).
not_subtype(int3233554683,ireadonlycollection33555626(_)).
not_subtype(int3233554683,ireadonlylist33555627(_)).
not_subtype(int3233554683,istructuralcomparable33555577).
not_subtype(int3233554683,istructuralequatable33555576).
not_subtype(int3233554683,vector33554435(_)).
not_subtype(ireadonlycollection33555626(_),array233554434(_)).
not_subtype(ireadonlycollection33555626(_),array33554517).
not_subtype(ireadonlycollection33555626(_),ia33554436(_)).
not_subtype(ireadonlycollection33555626(_),icloneable33554495).
not_subtype(ireadonlycollection33555626(_),icollection33555565).
not_subtype(ireadonlycollection33555626(_),icollection33555619(_)).
not_subtype(ireadonlycollection33555626(_),icomparable33554520).
not_subtype(ireadonlycollection33555626(_),icomparable33554521(_)).
not_subtype(ireadonlycollection33555626(_),iconvertible33554691).
not_subtype(ireadonlycollection33555626(_),iequatable33554522(_)).
not_subtype(ireadonlycollection33555626(_),iformattable33554672).
not_subtype(ireadonlycollection33555626(_),ilist33555573).
not_subtype(ireadonlycollection33555626(_),ilist33555625(_)).
not_subtype(ireadonlycollection33555626(_),int3233554683).
not_subtype(ireadonlycollection33555626(_),ireadonlylist33555627(_)).
not_subtype(ireadonlycollection33555626(_),istructuralcomparable33555577).
not_subtype(ireadonlycollection33555626(_),istructuralequatable33555576).
not_subtype(ireadonlycollection33555626(_),valuetype33554777).
not_subtype(ireadonlycollection33555626(_),vector33554435(_)).
not_subtype(ireadonlycollection33555626(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)) :- not_covariant_subtype(A,B).
not_subtype(ireadonlylist33555627(_),array233554434(_)).
not_subtype(ireadonlylist33555627(_),array33554517).
not_subtype(ireadonlylist33555627(_),ia33554436(_)).
not_subtype(ireadonlylist33555627(_),icloneable33554495).
not_subtype(ireadonlylist33555627(_),icollection33555565).
not_subtype(ireadonlylist33555627(_),icollection33555619(_)).
not_subtype(ireadonlylist33555627(_),icomparable33554520).
not_subtype(ireadonlylist33555627(_),icomparable33554521(_)).
not_subtype(ireadonlylist33555627(_),iconvertible33554691).
not_subtype(ireadonlylist33555627(_),iequatable33554522(_)).
not_subtype(ireadonlylist33555627(_),iformattable33554672).
not_subtype(ireadonlylist33555627(_),ilist33555573).
not_subtype(ireadonlylist33555627(_),ilist33555625(_)).
not_subtype(ireadonlylist33555627(_),int3233554683).
not_subtype(ireadonlylist33555627(_),istructuralcomparable33555577).
not_subtype(ireadonlylist33555627(_),istructuralequatable33555576).
not_subtype(ireadonlylist33555627(_),valuetype33554777).
not_subtype(ireadonlylist33555627(_),vector33554435(_)).
not_subtype(ireadonlylist33555627(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ireadonlylist33555627(A),ireadonlycollection33555626(B)) :- not_subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)).
not_subtype(ireadonlylist33555627(A),ireadonlylist33555627(B)) :- not_covariant_subtype(A,B).
not_subtype(istructuralcomparable33555577,array233554434(_)).
not_subtype(istructuralcomparable33555577,array33554517).
not_subtype(istructuralcomparable33555577,ia33554436(_)).
not_subtype(istructuralcomparable33555577,icloneable33554495).
not_subtype(istructuralcomparable33555577,icollection33555565).
not_subtype(istructuralcomparable33555577,icollection33555619(_)).
not_subtype(istructuralcomparable33555577,icomparable33554520).
not_subtype(istructuralcomparable33555577,icomparable33554521(_)).
not_subtype(istructuralcomparable33555577,iconvertible33554691).
not_subtype(istructuralcomparable33555577,ienumerable33555569).
not_subtype(istructuralcomparable33555577,ienumerable33555622(_)).
not_subtype(istructuralcomparable33555577,iequatable33554522(_)).
not_subtype(istructuralcomparable33555577,iformattable33554672).
not_subtype(istructuralcomparable33555577,ilist33555573).
not_subtype(istructuralcomparable33555577,ilist33555625(_)).
not_subtype(istructuralcomparable33555577,int3233554683).
not_subtype(istructuralcomparable33555577,ireadonlycollection33555626(_)).
not_subtype(istructuralcomparable33555577,ireadonlylist33555627(_)).
not_subtype(istructuralcomparable33555577,istructuralequatable33555576).
not_subtype(istructuralcomparable33555577,valuetype33554777).
not_subtype(istructuralcomparable33555577,vector33554435(_)).
not_subtype(istructuralequatable33555576,array233554434(_)).
not_subtype(istructuralequatable33555576,array33554517).
not_subtype(istructuralequatable33555576,ia33554436(_)).
not_subtype(istructuralequatable33555576,icloneable33554495).
not_subtype(istructuralequatable33555576,icollection33555565).
not_subtype(istructuralequatable33555576,icollection33555619(_)).
not_subtype(istructuralequatable33555576,icomparable33554520).
not_subtype(istructuralequatable33555576,icomparable33554521(_)).
not_subtype(istructuralequatable33555576,iconvertible33554691).
not_subtype(istructuralequatable33555576,ienumerable33555569).
not_subtype(istructuralequatable33555576,ienumerable33555622(_)).
not_subtype(istructuralequatable33555576,iequatable33554522(_)).
not_subtype(istructuralequatable33555576,iformattable33554672).
not_subtype(istructuralequatable33555576,ilist33555573).
not_subtype(istructuralequatable33555576,ilist33555625(_)).
not_subtype(istructuralequatable33555576,int3233554683).
not_subtype(istructuralequatable33555576,ireadonlycollection33555626(_)).
not_subtype(istructuralequatable33555576,ireadonlylist33555627(_)).
not_subtype(istructuralequatable33555576,istructuralcomparable33555577).
not_subtype(istructuralequatable33555576,valuetype33554777).
not_subtype(istructuralequatable33555576,vector33554435(_)).
not_subtype(object33554493,array233554434(_)).
not_subtype(object33554493,array33554517).
not_subtype(object33554493,ia33554436(_)).
not_subtype(object33554493,icloneable33554495).
not_subtype(object33554493,icollection33555565).
not_subtype(object33554493,icollection33555619(_)).
not_subtype(object33554493,icomparable33554520).
not_subtype(object33554493,icomparable33554521(_)).
not_subtype(object33554493,iconvertible33554691).
not_subtype(object33554493,ienumerable33555569).
not_subtype(object33554493,ienumerable33555622(_)).
not_subtype(object33554493,iequatable33554522(_)).
not_subtype(object33554493,iformattable33554672).
not_subtype(object33554493,ilist33555573).
not_subtype(object33554493,ilist33555625(_)).
not_subtype(object33554493,int3233554683).
not_subtype(object33554493,ireadonlycollection33555626(_)).
not_subtype(object33554493,ireadonlylist33555627(_)).
not_subtype(object33554493,istructuralcomparable33555577).
not_subtype(object33554493,istructuralequatable33555576).
not_subtype(object33554493,valuetype33554777).
not_subtype(object33554493,vector33554435(_)).
not_subtype(valuetype33554777,array233554434(_)).
not_subtype(valuetype33554777,array33554517).
not_subtype(valuetype33554777,ia33554436(_)).
not_subtype(valuetype33554777,icloneable33554495).
not_subtype(valuetype33554777,icollection33555565).
not_subtype(valuetype33554777,icollection33555619(_)).
not_subtype(valuetype33554777,icomparable33554520).
not_subtype(valuetype33554777,icomparable33554521(_)).
not_subtype(valuetype33554777,iconvertible33554691).
not_subtype(valuetype33554777,ienumerable33555569).
not_subtype(valuetype33554777,ienumerable33555622(_)).
not_subtype(valuetype33554777,iequatable33554522(_)).
not_subtype(valuetype33554777,iformattable33554672).
not_subtype(valuetype33554777,ilist33555573).
not_subtype(valuetype33554777,ilist33555625(_)).
not_subtype(valuetype33554777,int3233554683).
not_subtype(valuetype33554777,ireadonlycollection33555626(_)).
not_subtype(valuetype33554777,ireadonlylist33555627(_)).
not_subtype(valuetype33554777,istructuralcomparable33555577).
not_subtype(valuetype33554777,istructuralequatable33555576).
not_subtype(valuetype33554777,vector33554435(_)).
not_subtype(vector33554435(_),array233554434(_)).
not_subtype(vector33554435(_),ia33554436(_)).
not_subtype(vector33554435(_),icomparable33554520).
not_subtype(vector33554435(_),icomparable33554521(_)).
not_subtype(vector33554435(_),iconvertible33554691).
not_subtype(vector33554435(_),iequatable33554522(_)).
not_subtype(vector33554435(_),iformattable33554672).
not_subtype(vector33554435(_),int3233554683).
not_subtype(vector33554435(_),valuetype33554777).
not_subtype(vector33554435(A),icollection33555619(B)) :- not_subtype(icollection33555619(A),icollection33555619(B)).
not_subtype(vector33554435(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(vector33554435(A),ilist33555625(B)) :- not_subtype(ilist33555625(A),ilist33555625(B)).
not_subtype(vector33554435(A),ireadonlycollection33555626(B)) :- not_subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)).
not_subtype(vector33554435(A),ireadonlylist33555627(B)) :- not_subtype(ireadonlylist33555627(A),ireadonlylist33555627(B)).
not_subtype(vector33554435(A),vector33554435(B)) :- not_covariant_subtype(A,B).
subtype(array233554434(_),array33554517).
subtype(array233554434(_),icloneable33554495).
subtype(array233554434(_),icollection33555565).
subtype(array233554434(_),ienumerable33555569).
subtype(array233554434(_),ilist33555573).
subtype(array233554434(_),istructuralcomparable33555577).
subtype(array233554434(_),istructuralequatable33555576).
subtype(array233554434(_),object33554493).
subtype(array233554434(A),array233554434(B)) :- covariant_subtype(A,B).
subtype(array33554517,array33554517).
subtype(array33554517,icloneable33554495).
subtype(array33554517,icollection33555565).
subtype(array33554517,ienumerable33555569).
subtype(array33554517,ilist33555573).
subtype(array33554517,istructuralcomparable33555577).
subtype(array33554517,istructuralequatable33555576).
subtype(array33554517,object33554493).
subtype(ia33554436(_),object33554493).
subtype(ia33554436(A),ia33554436(B)) :- covariant_subtype(A,B).
subtype(icloneable33554495,icloneable33554495).
subtype(icloneable33554495,object33554493).
subtype(icollection33555565,icollection33555565).
subtype(icollection33555565,ienumerable33555569).
subtype(icollection33555565,object33554493).
subtype(icollection33555619(_),ienumerable33555569).
subtype(icollection33555619(_),object33554493).
subtype(icollection33555619(A),icollection33555619(B)) :- A = B.
subtype(icollection33555619(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(icomparable33554520,icomparable33554520).
subtype(icomparable33554520,object33554493).
subtype(icomparable33554521(_),object33554493).
subtype(icomparable33554521(A),icomparable33554521(B)) :- contravariant_subtype(A,B).
subtype(iconvertible33554691,iconvertible33554691).
subtype(iconvertible33554691,object33554493).
subtype(ienumerable33555569,ienumerable33555569).
subtype(ienumerable33555569,object33554493).
subtype(ienumerable33555622(_),ienumerable33555569).
subtype(ienumerable33555622(_),object33554493).
subtype(ienumerable33555622(A),ienumerable33555622(B)) :- covariant_subtype(A,B).
subtype(iequatable33554522(_),object33554493).
subtype(iequatable33554522(A),iequatable33554522(B)) :- A = B.
subtype(iformattable33554672,iformattable33554672).
subtype(iformattable33554672,object33554493).
subtype(ilist33555573,icollection33555565).
subtype(ilist33555573,ienumerable33555569).
subtype(ilist33555573,ilist33555573).
subtype(ilist33555573,object33554493).
subtype(ilist33555625(_),ienumerable33555569).
subtype(ilist33555625(_),object33554493).
subtype(ilist33555625(A),icollection33555619(B)) :- subtype(icollection33555619(A),icollection33555619(B)).
subtype(ilist33555625(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(ilist33555625(A),ilist33555625(B)) :- A = B.
subtype(int3233554683,icomparable33554520).
subtype(int3233554683,icomparable33554521(A)) :- subtype(icomparable33554521(int3233554683),icomparable33554521(A)).
subtype(int3233554683,iconvertible33554691).
subtype(int3233554683,iequatable33554522(A)) :- subtype(iequatable33554522(int3233554683),iequatable33554522(A)).
subtype(int3233554683,iformattable33554672).
subtype(int3233554683,int3233554683).
subtype(int3233554683,object33554493).
subtype(int3233554683,valuetype33554777).
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
subtype(valuetype33554777,object33554493).
subtype(valuetype33554777,valuetype33554777).
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
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (subtype(L,vector33554435(N)), subtype(M,N), subtype(O,N), subtype(L,array233554434(int3233554683)), subtype(valuetype33554777,C), subtype(A,ia33554436(A)), subtype(B,ia33554436(A)), subtype(D,ia33554436(D)), subtype(E,ia33554436(D)), subtype(F,A), subtype(G,A), subtype(F,H), subtype(G,H), subtype(C,H), subtype(I,H), subtype(J,H), subtype(K,H), not_subtype(A,ia33554436(A)), not_subtype(B,ia33554436(A)), not_subtype(valuetype33554777,C), not_subtype(D,ia33554436(D)), not_subtype(E,ia33554436(D)), not_subtype(F,A), not_subtype(G,A), not_subtype(F,H), not_subtype(G,H), not_subtype(C,H), not_subtype(I,H), not_subtype(J,H), not_subtype(K,H), not_subtype(A,ia33554436(D)), not_subtype(D,ia33554436(A)), default_constructor(C), is_reference(J), format('~w ~w~n', ['L =', L]),format('~w ~w~n', ['N =', N]),format('~w ~w~n', ['M =', M]),format('~w ~w~n', ['O =', O]),format('~w ~w~n', ['C =', C]),format('~w ~w~n', ['A =', A]),format('~w ~w~n', ['B =', B]),format('~w ~w~n', ['D =', D]),format('~w ~w~n', ['E =', E]),format('~w ~w~n', ['F =', F]),format('~w ~w~n', ['G =', G]),format('~w ~w~n', ['H =', H]),format('~w ~w~n', ['I =', I]),format('~w ~w~n', ['J =', J]),format('~w ~w~n', ['K =', K]))))).
