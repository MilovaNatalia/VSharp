contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(dictionary33555602(_,_)).
default_constructor(keyvaluepair33555630(_,_)).
default_constructor(object33554493).
is_reference(delegate33554565).
is_reference(dictionary33555602(_,_)).
is_reference(func33554502(_,_)).
is_reference(func33554503(_,_,_)).
is_reference(ia33554436(_)).
is_reference(icloneable33554495).
is_reference(icollection33555565).
is_reference(icollection33555619(_)).
is_reference(ideserializationcallback33556230).
is_reference(idictionary33555567).
is_reference(idictionary33555621(_,_)).
is_reference(ienumerable33555569).
is_reference(ienumerable33555622(_)).
is_reference(ireadonlycollection33555626(_)).
is_reference(ireadonlydictionary33555628(_,_)).
is_reference(iserializable33556234).
is_reference(multicastdelegate33554567).
is_reference(object33554493).
is_reference(valuetype33554777).
is_unmanaged(_) :- false.
is_valuetype(keyvaluepair33555630(_,_)).
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(delegate33554565,dictionary33555602(_,_)).
not_subtype(delegate33554565,func33554502(_,_)).
not_subtype(delegate33554565,func33554503(_,_,_)).
not_subtype(delegate33554565,ia33554436(_)).
not_subtype(delegate33554565,icollection33555565).
not_subtype(delegate33554565,icollection33555619(_)).
not_subtype(delegate33554565,ideserializationcallback33556230).
not_subtype(delegate33554565,idictionary33555567).
not_subtype(delegate33554565,idictionary33555621(_,_)).
not_subtype(delegate33554565,ienumerable33555569).
not_subtype(delegate33554565,ienumerable33555622(_)).
not_subtype(delegate33554565,ireadonlycollection33555626(_)).
not_subtype(delegate33554565,ireadonlydictionary33555628(_,_)).
not_subtype(delegate33554565,keyvaluepair33555630(_,_)).
not_subtype(delegate33554565,multicastdelegate33554567).
not_subtype(delegate33554565,valuetype33554777).
not_subtype(dictionary33555602(_,_),delegate33554565).
not_subtype(dictionary33555602(_,_),func33554502(_,_)).
not_subtype(dictionary33555602(_,_),func33554503(_,_,_)).
not_subtype(dictionary33555602(_,_),ia33554436(_)).
not_subtype(dictionary33555602(_,_),icloneable33554495).
not_subtype(dictionary33555602(_,_),keyvaluepair33555630(_,_)).
not_subtype(dictionary33555602(_,_),multicastdelegate33554567).
not_subtype(dictionary33555602(_,_),valuetype33554777).
not_subtype(dictionary33555602(_,B),dictionary33555602(_,D)) :- B \= D.
not_subtype(dictionary33555602(A,_),dictionary33555602(C,_)) :- A \= C.
not_subtype(dictionary33555602(A,B),icollection33555619(C)) :- not_subtype(icollection33555619(keyvaluepair33555630(A,B)),icollection33555619(C)).
not_subtype(dictionary33555602(A,B),idictionary33555621(C,D)) :- not_subtype(idictionary33555621(A,B),idictionary33555621(C,D)).
not_subtype(dictionary33555602(A,B),ienumerable33555622(C)) :- not_subtype(ienumerable33555622(keyvaluepair33555630(A,B)),ienumerable33555622(C)).
not_subtype(dictionary33555602(A,B),ireadonlycollection33555626(C)) :- not_subtype(ireadonlycollection33555626(keyvaluepair33555630(A,B)),ireadonlycollection33555626(C)).
not_subtype(dictionary33555602(A,B),ireadonlydictionary33555628(C,D)) :- not_subtype(ireadonlydictionary33555628(A,B),ireadonlydictionary33555628(C,D)).
not_subtype(func33554502(_,_),dictionary33555602(_,_)).
not_subtype(func33554502(_,_),func33554503(_,_,_)).
not_subtype(func33554502(_,_),ia33554436(_)).
not_subtype(func33554502(_,_),icollection33555565).
not_subtype(func33554502(_,_),icollection33555619(_)).
not_subtype(func33554502(_,_),ideserializationcallback33556230).
not_subtype(func33554502(_,_),idictionary33555567).
not_subtype(func33554502(_,_),idictionary33555621(_,_)).
not_subtype(func33554502(_,_),ienumerable33555569).
not_subtype(func33554502(_,_),ienumerable33555622(_)).
not_subtype(func33554502(_,_),ireadonlycollection33555626(_)).
not_subtype(func33554502(_,_),ireadonlydictionary33555628(_,_)).
not_subtype(func33554502(_,_),keyvaluepair33555630(_,_)).
not_subtype(func33554502(_,_),valuetype33554777).
not_subtype(func33554502(_,B),func33554502(_,D)) :- not_covariant_subtype(B,D).
not_subtype(func33554502(A,_),func33554502(C,_)) :- not_contravariant_subtype(A,C).
not_subtype(func33554503(_,_,_),dictionary33555602(_,_)).
not_subtype(func33554503(_,_,_),func33554502(_,_)).
not_subtype(func33554503(_,_,_),ia33554436(_)).
not_subtype(func33554503(_,_,_),icollection33555565).
not_subtype(func33554503(_,_,_),icollection33555619(_)).
not_subtype(func33554503(_,_,_),ideserializationcallback33556230).
not_subtype(func33554503(_,_,_),idictionary33555567).
not_subtype(func33554503(_,_,_),idictionary33555621(_,_)).
not_subtype(func33554503(_,_,_),ienumerable33555569).
not_subtype(func33554503(_,_,_),ienumerable33555622(_)).
not_subtype(func33554503(_,_,_),ireadonlycollection33555626(_)).
not_subtype(func33554503(_,_,_),ireadonlydictionary33555628(_,_)).
not_subtype(func33554503(_,_,_),keyvaluepair33555630(_,_)).
not_subtype(func33554503(_,_,_),valuetype33554777).
not_subtype(func33554503(_,_,C),func33554503(_,_,F)) :- not_covariant_subtype(C,F).
not_subtype(func33554503(_,B,_),func33554503(_,E,_)) :- not_contravariant_subtype(B,E).
not_subtype(func33554503(A,_,_),func33554503(D,_,_)) :- not_contravariant_subtype(A,D).
not_subtype(ia33554436(_),delegate33554565).
not_subtype(ia33554436(_),dictionary33555602(_,_)).
not_subtype(ia33554436(_),func33554502(_,_)).
not_subtype(ia33554436(_),func33554503(_,_,_)).
not_subtype(ia33554436(_),icloneable33554495).
not_subtype(ia33554436(_),icollection33555565).
not_subtype(ia33554436(_),icollection33555619(_)).
not_subtype(ia33554436(_),ideserializationcallback33556230).
not_subtype(ia33554436(_),idictionary33555567).
not_subtype(ia33554436(_),idictionary33555621(_,_)).
not_subtype(ia33554436(_),ienumerable33555569).
not_subtype(ia33554436(_),ienumerable33555622(_)).
not_subtype(ia33554436(_),ireadonlycollection33555626(_)).
not_subtype(ia33554436(_),ireadonlydictionary33555628(_,_)).
not_subtype(ia33554436(_),iserializable33556234).
not_subtype(ia33554436(_),keyvaluepair33555630(_,_)).
not_subtype(ia33554436(_),multicastdelegate33554567).
not_subtype(ia33554436(_),valuetype33554777).
not_subtype(ia33554436(A),ia33554436(B)) :- not_covariant_subtype(A,B).
not_subtype(icloneable33554495,delegate33554565).
not_subtype(icloneable33554495,dictionary33555602(_,_)).
not_subtype(icloneable33554495,func33554502(_,_)).
not_subtype(icloneable33554495,func33554503(_,_,_)).
not_subtype(icloneable33554495,ia33554436(_)).
not_subtype(icloneable33554495,icollection33555565).
not_subtype(icloneable33554495,icollection33555619(_)).
not_subtype(icloneable33554495,ideserializationcallback33556230).
not_subtype(icloneable33554495,idictionary33555567).
not_subtype(icloneable33554495,idictionary33555621(_,_)).
not_subtype(icloneable33554495,ienumerable33555569).
not_subtype(icloneable33554495,ienumerable33555622(_)).
not_subtype(icloneable33554495,ireadonlycollection33555626(_)).
not_subtype(icloneable33554495,ireadonlydictionary33555628(_,_)).
not_subtype(icloneable33554495,iserializable33556234).
not_subtype(icloneable33554495,keyvaluepair33555630(_,_)).
not_subtype(icloneable33554495,multicastdelegate33554567).
not_subtype(icloneable33554495,valuetype33554777).
not_subtype(icollection33555565,delegate33554565).
not_subtype(icollection33555565,dictionary33555602(_,_)).
not_subtype(icollection33555565,func33554502(_,_)).
not_subtype(icollection33555565,func33554503(_,_,_)).
not_subtype(icollection33555565,ia33554436(_)).
not_subtype(icollection33555565,icloneable33554495).
not_subtype(icollection33555565,icollection33555619(_)).
not_subtype(icollection33555565,ideserializationcallback33556230).
not_subtype(icollection33555565,idictionary33555567).
not_subtype(icollection33555565,idictionary33555621(_,_)).
not_subtype(icollection33555565,ienumerable33555622(_)).
not_subtype(icollection33555565,ireadonlycollection33555626(_)).
not_subtype(icollection33555565,ireadonlydictionary33555628(_,_)).
not_subtype(icollection33555565,iserializable33556234).
not_subtype(icollection33555565,keyvaluepair33555630(_,_)).
not_subtype(icollection33555565,multicastdelegate33554567).
not_subtype(icollection33555565,valuetype33554777).
not_subtype(icollection33555619(_),delegate33554565).
not_subtype(icollection33555619(_),dictionary33555602(_,_)).
not_subtype(icollection33555619(_),func33554502(_,_)).
not_subtype(icollection33555619(_),func33554503(_,_,_)).
not_subtype(icollection33555619(_),ia33554436(_)).
not_subtype(icollection33555619(_),icloneable33554495).
not_subtype(icollection33555619(_),icollection33555565).
not_subtype(icollection33555619(_),ideserializationcallback33556230).
not_subtype(icollection33555619(_),idictionary33555567).
not_subtype(icollection33555619(_),idictionary33555621(_,_)).
not_subtype(icollection33555619(_),ireadonlycollection33555626(_)).
not_subtype(icollection33555619(_),ireadonlydictionary33555628(_,_)).
not_subtype(icollection33555619(_),iserializable33556234).
not_subtype(icollection33555619(_),keyvaluepair33555630(_,_)).
not_subtype(icollection33555619(_),multicastdelegate33554567).
not_subtype(icollection33555619(_),valuetype33554777).
not_subtype(icollection33555619(A),icollection33555619(B)) :- A \= B.
not_subtype(icollection33555619(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ideserializationcallback33556230,delegate33554565).
not_subtype(ideserializationcallback33556230,dictionary33555602(_,_)).
not_subtype(ideserializationcallback33556230,func33554502(_,_)).
not_subtype(ideserializationcallback33556230,func33554503(_,_,_)).
not_subtype(ideserializationcallback33556230,ia33554436(_)).
not_subtype(ideserializationcallback33556230,icloneable33554495).
not_subtype(ideserializationcallback33556230,icollection33555565).
not_subtype(ideserializationcallback33556230,icollection33555619(_)).
not_subtype(ideserializationcallback33556230,idictionary33555567).
not_subtype(ideserializationcallback33556230,idictionary33555621(_,_)).
not_subtype(ideserializationcallback33556230,ienumerable33555569).
not_subtype(ideserializationcallback33556230,ienumerable33555622(_)).
not_subtype(ideserializationcallback33556230,ireadonlycollection33555626(_)).
not_subtype(ideserializationcallback33556230,ireadonlydictionary33555628(_,_)).
not_subtype(ideserializationcallback33556230,iserializable33556234).
not_subtype(ideserializationcallback33556230,keyvaluepair33555630(_,_)).
not_subtype(ideserializationcallback33556230,multicastdelegate33554567).
not_subtype(ideserializationcallback33556230,valuetype33554777).
not_subtype(idictionary33555567,delegate33554565).
not_subtype(idictionary33555567,dictionary33555602(_,_)).
not_subtype(idictionary33555567,func33554502(_,_)).
not_subtype(idictionary33555567,func33554503(_,_,_)).
not_subtype(idictionary33555567,ia33554436(_)).
not_subtype(idictionary33555567,icloneable33554495).
not_subtype(idictionary33555567,icollection33555619(_)).
not_subtype(idictionary33555567,ideserializationcallback33556230).
not_subtype(idictionary33555567,idictionary33555621(_,_)).
not_subtype(idictionary33555567,ienumerable33555622(_)).
not_subtype(idictionary33555567,ireadonlycollection33555626(_)).
not_subtype(idictionary33555567,ireadonlydictionary33555628(_,_)).
not_subtype(idictionary33555567,iserializable33556234).
not_subtype(idictionary33555567,keyvaluepair33555630(_,_)).
not_subtype(idictionary33555567,multicastdelegate33554567).
not_subtype(idictionary33555567,valuetype33554777).
not_subtype(idictionary33555621(_,_),delegate33554565).
not_subtype(idictionary33555621(_,_),dictionary33555602(_,_)).
not_subtype(idictionary33555621(_,_),func33554502(_,_)).
not_subtype(idictionary33555621(_,_),func33554503(_,_,_)).
not_subtype(idictionary33555621(_,_),ia33554436(_)).
not_subtype(idictionary33555621(_,_),icloneable33554495).
not_subtype(idictionary33555621(_,_),icollection33555565).
not_subtype(idictionary33555621(_,_),ideserializationcallback33556230).
not_subtype(idictionary33555621(_,_),idictionary33555567).
not_subtype(idictionary33555621(_,_),ireadonlycollection33555626(_)).
not_subtype(idictionary33555621(_,_),ireadonlydictionary33555628(_,_)).
not_subtype(idictionary33555621(_,_),iserializable33556234).
not_subtype(idictionary33555621(_,_),keyvaluepair33555630(_,_)).
not_subtype(idictionary33555621(_,_),multicastdelegate33554567).
not_subtype(idictionary33555621(_,_),valuetype33554777).
not_subtype(idictionary33555621(_,B),idictionary33555621(_,D)) :- B \= D.
not_subtype(idictionary33555621(A,_),idictionary33555621(C,_)) :- A \= C.
not_subtype(idictionary33555621(A,B),icollection33555619(C)) :- not_subtype(icollection33555619(keyvaluepair33555630(A,B)),icollection33555619(C)).
not_subtype(idictionary33555621(A,B),ienumerable33555622(C)) :- not_subtype(ienumerable33555622(keyvaluepair33555630(A,B)),ienumerable33555622(C)).
not_subtype(ienumerable33555569,delegate33554565).
not_subtype(ienumerable33555569,dictionary33555602(_,_)).
not_subtype(ienumerable33555569,func33554502(_,_)).
not_subtype(ienumerable33555569,func33554503(_,_,_)).
not_subtype(ienumerable33555569,ia33554436(_)).
not_subtype(ienumerable33555569,icloneable33554495).
not_subtype(ienumerable33555569,icollection33555565).
not_subtype(ienumerable33555569,icollection33555619(_)).
not_subtype(ienumerable33555569,ideserializationcallback33556230).
not_subtype(ienumerable33555569,idictionary33555567).
not_subtype(ienumerable33555569,idictionary33555621(_,_)).
not_subtype(ienumerable33555569,ienumerable33555622(_)).
not_subtype(ienumerable33555569,ireadonlycollection33555626(_)).
not_subtype(ienumerable33555569,ireadonlydictionary33555628(_,_)).
not_subtype(ienumerable33555569,iserializable33556234).
not_subtype(ienumerable33555569,keyvaluepair33555630(_,_)).
not_subtype(ienumerable33555569,multicastdelegate33554567).
not_subtype(ienumerable33555569,valuetype33554777).
not_subtype(ienumerable33555622(_),delegate33554565).
not_subtype(ienumerable33555622(_),dictionary33555602(_,_)).
not_subtype(ienumerable33555622(_),func33554502(_,_)).
not_subtype(ienumerable33555622(_),func33554503(_,_,_)).
not_subtype(ienumerable33555622(_),ia33554436(_)).
not_subtype(ienumerable33555622(_),icloneable33554495).
not_subtype(ienumerable33555622(_),icollection33555565).
not_subtype(ienumerable33555622(_),icollection33555619(_)).
not_subtype(ienumerable33555622(_),ideserializationcallback33556230).
not_subtype(ienumerable33555622(_),idictionary33555567).
not_subtype(ienumerable33555622(_),idictionary33555621(_,_)).
not_subtype(ienumerable33555622(_),ireadonlycollection33555626(_)).
not_subtype(ienumerable33555622(_),ireadonlydictionary33555628(_,_)).
not_subtype(ienumerable33555622(_),iserializable33556234).
not_subtype(ienumerable33555622(_),keyvaluepair33555630(_,_)).
not_subtype(ienumerable33555622(_),multicastdelegate33554567).
not_subtype(ienumerable33555622(_),valuetype33554777).
not_subtype(ienumerable33555622(A),ienumerable33555622(B)) :- not_covariant_subtype(A,B).
not_subtype(ireadonlycollection33555626(_),delegate33554565).
not_subtype(ireadonlycollection33555626(_),dictionary33555602(_,_)).
not_subtype(ireadonlycollection33555626(_),func33554502(_,_)).
not_subtype(ireadonlycollection33555626(_),func33554503(_,_,_)).
not_subtype(ireadonlycollection33555626(_),ia33554436(_)).
not_subtype(ireadonlycollection33555626(_),icloneable33554495).
not_subtype(ireadonlycollection33555626(_),icollection33555565).
not_subtype(ireadonlycollection33555626(_),icollection33555619(_)).
not_subtype(ireadonlycollection33555626(_),ideserializationcallback33556230).
not_subtype(ireadonlycollection33555626(_),idictionary33555567).
not_subtype(ireadonlycollection33555626(_),idictionary33555621(_,_)).
not_subtype(ireadonlycollection33555626(_),ireadonlydictionary33555628(_,_)).
not_subtype(ireadonlycollection33555626(_),iserializable33556234).
not_subtype(ireadonlycollection33555626(_),keyvaluepair33555630(_,_)).
not_subtype(ireadonlycollection33555626(_),multicastdelegate33554567).
not_subtype(ireadonlycollection33555626(_),valuetype33554777).
not_subtype(ireadonlycollection33555626(A),ienumerable33555622(B)) :- not_subtype(ienumerable33555622(A),ienumerable33555622(B)).
not_subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)) :- not_covariant_subtype(A,B).
not_subtype(ireadonlydictionary33555628(_,_),delegate33554565).
not_subtype(ireadonlydictionary33555628(_,_),dictionary33555602(_,_)).
not_subtype(ireadonlydictionary33555628(_,_),func33554502(_,_)).
not_subtype(ireadonlydictionary33555628(_,_),func33554503(_,_,_)).
not_subtype(ireadonlydictionary33555628(_,_),ia33554436(_)).
not_subtype(ireadonlydictionary33555628(_,_),icloneable33554495).
not_subtype(ireadonlydictionary33555628(_,_),icollection33555565).
not_subtype(ireadonlydictionary33555628(_,_),icollection33555619(_)).
not_subtype(ireadonlydictionary33555628(_,_),ideserializationcallback33556230).
not_subtype(ireadonlydictionary33555628(_,_),idictionary33555567).
not_subtype(ireadonlydictionary33555628(_,_),idictionary33555621(_,_)).
not_subtype(ireadonlydictionary33555628(_,_),iserializable33556234).
not_subtype(ireadonlydictionary33555628(_,_),keyvaluepair33555630(_,_)).
not_subtype(ireadonlydictionary33555628(_,_),multicastdelegate33554567).
not_subtype(ireadonlydictionary33555628(_,_),valuetype33554777).
not_subtype(ireadonlydictionary33555628(_,B),ireadonlydictionary33555628(_,D)) :- B \= D.
not_subtype(ireadonlydictionary33555628(A,_),ireadonlydictionary33555628(C,_)) :- A \= C.
not_subtype(ireadonlydictionary33555628(A,B),ienumerable33555622(C)) :- not_subtype(ienumerable33555622(keyvaluepair33555630(A,B)),ienumerable33555622(C)).
not_subtype(ireadonlydictionary33555628(A,B),ireadonlycollection33555626(C)) :- not_subtype(ireadonlycollection33555626(keyvaluepair33555630(A,B)),ireadonlycollection33555626(C)).
not_subtype(iserializable33556234,delegate33554565).
not_subtype(iserializable33556234,dictionary33555602(_,_)).
not_subtype(iserializable33556234,func33554502(_,_)).
not_subtype(iserializable33556234,func33554503(_,_,_)).
not_subtype(iserializable33556234,ia33554436(_)).
not_subtype(iserializable33556234,icloneable33554495).
not_subtype(iserializable33556234,icollection33555565).
not_subtype(iserializable33556234,icollection33555619(_)).
not_subtype(iserializable33556234,ideserializationcallback33556230).
not_subtype(iserializable33556234,idictionary33555567).
not_subtype(iserializable33556234,idictionary33555621(_,_)).
not_subtype(iserializable33556234,ienumerable33555569).
not_subtype(iserializable33556234,ienumerable33555622(_)).
not_subtype(iserializable33556234,ireadonlycollection33555626(_)).
not_subtype(iserializable33556234,ireadonlydictionary33555628(_,_)).
not_subtype(iserializable33556234,keyvaluepair33555630(_,_)).
not_subtype(iserializable33556234,multicastdelegate33554567).
not_subtype(iserializable33556234,valuetype33554777).
not_subtype(keyvaluepair33555630(_,_),delegate33554565).
not_subtype(keyvaluepair33555630(_,_),dictionary33555602(_,_)).
not_subtype(keyvaluepair33555630(_,_),func33554502(_,_)).
not_subtype(keyvaluepair33555630(_,_),func33554503(_,_,_)).
not_subtype(keyvaluepair33555630(_,_),ia33554436(_)).
not_subtype(keyvaluepair33555630(_,_),icloneable33554495).
not_subtype(keyvaluepair33555630(_,_),icollection33555565).
not_subtype(keyvaluepair33555630(_,_),icollection33555619(_)).
not_subtype(keyvaluepair33555630(_,_),ideserializationcallback33556230).
not_subtype(keyvaluepair33555630(_,_),idictionary33555567).
not_subtype(keyvaluepair33555630(_,_),idictionary33555621(_,_)).
not_subtype(keyvaluepair33555630(_,_),ienumerable33555569).
not_subtype(keyvaluepair33555630(_,_),ienumerable33555622(_)).
not_subtype(keyvaluepair33555630(_,_),ireadonlycollection33555626(_)).
not_subtype(keyvaluepair33555630(_,_),ireadonlydictionary33555628(_,_)).
not_subtype(keyvaluepair33555630(_,_),iserializable33556234).
not_subtype(keyvaluepair33555630(_,_),multicastdelegate33554567).
not_subtype(keyvaluepair33555630(_,B),keyvaluepair33555630(_,D)) :- B \= D.
not_subtype(keyvaluepair33555630(A,_),keyvaluepair33555630(C,_)) :- A \= C.
not_subtype(multicastdelegate33554567,dictionary33555602(_,_)).
not_subtype(multicastdelegate33554567,func33554502(_,_)).
not_subtype(multicastdelegate33554567,func33554503(_,_,_)).
not_subtype(multicastdelegate33554567,ia33554436(_)).
not_subtype(multicastdelegate33554567,icollection33555565).
not_subtype(multicastdelegate33554567,icollection33555619(_)).
not_subtype(multicastdelegate33554567,ideserializationcallback33556230).
not_subtype(multicastdelegate33554567,idictionary33555567).
not_subtype(multicastdelegate33554567,idictionary33555621(_,_)).
not_subtype(multicastdelegate33554567,ienumerable33555569).
not_subtype(multicastdelegate33554567,ienumerable33555622(_)).
not_subtype(multicastdelegate33554567,ireadonlycollection33555626(_)).
not_subtype(multicastdelegate33554567,ireadonlydictionary33555628(_,_)).
not_subtype(multicastdelegate33554567,keyvaluepair33555630(_,_)).
not_subtype(multicastdelegate33554567,valuetype33554777).
not_subtype(object33554493,delegate33554565).
not_subtype(object33554493,dictionary33555602(_,_)).
not_subtype(object33554493,func33554502(_,_)).
not_subtype(object33554493,func33554503(_,_,_)).
not_subtype(object33554493,ia33554436(_)).
not_subtype(object33554493,icloneable33554495).
not_subtype(object33554493,icollection33555565).
not_subtype(object33554493,icollection33555619(_)).
not_subtype(object33554493,ideserializationcallback33556230).
not_subtype(object33554493,idictionary33555567).
not_subtype(object33554493,idictionary33555621(_,_)).
not_subtype(object33554493,ienumerable33555569).
not_subtype(object33554493,ienumerable33555622(_)).
not_subtype(object33554493,ireadonlycollection33555626(_)).
not_subtype(object33554493,ireadonlydictionary33555628(_,_)).
not_subtype(object33554493,iserializable33556234).
not_subtype(object33554493,keyvaluepair33555630(_,_)).
not_subtype(object33554493,multicastdelegate33554567).
not_subtype(object33554493,valuetype33554777).
not_subtype(valuetype33554777,delegate33554565).
not_subtype(valuetype33554777,dictionary33555602(_,_)).
not_subtype(valuetype33554777,func33554502(_,_)).
not_subtype(valuetype33554777,func33554503(_,_,_)).
not_subtype(valuetype33554777,ia33554436(_)).
not_subtype(valuetype33554777,icloneable33554495).
not_subtype(valuetype33554777,icollection33555565).
not_subtype(valuetype33554777,icollection33555619(_)).
not_subtype(valuetype33554777,ideserializationcallback33556230).
not_subtype(valuetype33554777,idictionary33555567).
not_subtype(valuetype33554777,idictionary33555621(_,_)).
not_subtype(valuetype33554777,ienumerable33555569).
not_subtype(valuetype33554777,ienumerable33555622(_)).
not_subtype(valuetype33554777,ireadonlycollection33555626(_)).
not_subtype(valuetype33554777,ireadonlydictionary33555628(_,_)).
not_subtype(valuetype33554777,iserializable33556234).
not_subtype(valuetype33554777,keyvaluepair33555630(_,_)).
not_subtype(valuetype33554777,multicastdelegate33554567).
subtype(delegate33554565,delegate33554565).
subtype(delegate33554565,icloneable33554495).
subtype(delegate33554565,iserializable33556234).
subtype(delegate33554565,object33554493).
subtype(dictionary33555602(_,_),icollection33555565).
subtype(dictionary33555602(_,_),ideserializationcallback33556230).
subtype(dictionary33555602(_,_),idictionary33555567).
subtype(dictionary33555602(_,_),ienumerable33555569).
subtype(dictionary33555602(_,_),iserializable33556234).
subtype(dictionary33555602(_,_),object33554493).
subtype(dictionary33555602(A,B),dictionary33555602(C,D)) :- A = C, B = D.
subtype(dictionary33555602(A,B),icollection33555619(C)) :- subtype(icollection33555619(keyvaluepair33555630(A,B)),icollection33555619(C)).
subtype(dictionary33555602(A,B),idictionary33555621(C,D)) :- subtype(idictionary33555621(A,B),idictionary33555621(C,D)).
subtype(dictionary33555602(A,B),ienumerable33555622(C)) :- subtype(ienumerable33555622(keyvaluepair33555630(A,B)),ienumerable33555622(C)).
subtype(dictionary33555602(A,B),ireadonlycollection33555626(C)) :- subtype(ireadonlycollection33555626(keyvaluepair33555630(A,B)),ireadonlycollection33555626(C)).
subtype(dictionary33555602(A,B),ireadonlydictionary33555628(C,D)) :- subtype(ireadonlydictionary33555628(A,B),ireadonlydictionary33555628(C,D)).
subtype(func33554502(_,_),delegate33554565).
subtype(func33554502(_,_),icloneable33554495).
subtype(func33554502(_,_),iserializable33556234).
subtype(func33554502(_,_),multicastdelegate33554567).
subtype(func33554502(_,_),object33554493).
subtype(func33554502(A,B),func33554502(C,D)) :- contravariant_subtype(A,C), covariant_subtype(B,D).
subtype(func33554503(_,_,_),delegate33554565).
subtype(func33554503(_,_,_),icloneable33554495).
subtype(func33554503(_,_,_),iserializable33556234).
subtype(func33554503(_,_,_),multicastdelegate33554567).
subtype(func33554503(_,_,_),object33554493).
subtype(func33554503(A,B,C),func33554503(D,E,F)) :- contravariant_subtype(A,D), contravariant_subtype(B,E), covariant_subtype(C,F).
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
subtype(ideserializationcallback33556230,ideserializationcallback33556230).
subtype(ideserializationcallback33556230,object33554493).
subtype(idictionary33555567,icollection33555565).
subtype(idictionary33555567,idictionary33555567).
subtype(idictionary33555567,ienumerable33555569).
subtype(idictionary33555567,object33554493).
subtype(idictionary33555621(_,_),ienumerable33555569).
subtype(idictionary33555621(_,_),object33554493).
subtype(idictionary33555621(A,B),icollection33555619(C)) :- subtype(icollection33555619(keyvaluepair33555630(A,B)),icollection33555619(C)).
subtype(idictionary33555621(A,B),idictionary33555621(C,D)) :- A = C, B = D.
subtype(idictionary33555621(A,B),ienumerable33555622(C)) :- subtype(ienumerable33555622(keyvaluepair33555630(A,B)),ienumerable33555622(C)).
subtype(ienumerable33555569,ienumerable33555569).
subtype(ienumerable33555569,object33554493).
subtype(ienumerable33555622(_),ienumerable33555569).
subtype(ienumerable33555622(_),object33554493).
subtype(ienumerable33555622(A),ienumerable33555622(B)) :- covariant_subtype(A,B).
subtype(ireadonlycollection33555626(_),ienumerable33555569).
subtype(ireadonlycollection33555626(_),object33554493).
subtype(ireadonlycollection33555626(A),ienumerable33555622(B)) :- subtype(ienumerable33555622(A),ienumerable33555622(B)).
subtype(ireadonlycollection33555626(A),ireadonlycollection33555626(B)) :- covariant_subtype(A,B).
subtype(ireadonlydictionary33555628(_,_),ienumerable33555569).
subtype(ireadonlydictionary33555628(_,_),object33554493).
subtype(ireadonlydictionary33555628(A,B),ienumerable33555622(C)) :- subtype(ienumerable33555622(keyvaluepair33555630(A,B)),ienumerable33555622(C)).
subtype(ireadonlydictionary33555628(A,B),ireadonlycollection33555626(C)) :- subtype(ireadonlycollection33555626(keyvaluepair33555630(A,B)),ireadonlycollection33555626(C)).
subtype(ireadonlydictionary33555628(A,B),ireadonlydictionary33555628(C,D)) :- A = C, B = D.
subtype(iserializable33556234,iserializable33556234).
subtype(iserializable33556234,object33554493).
subtype(keyvaluepair33555630(_,_),object33554493).
subtype(keyvaluepair33555630(_,_),valuetype33554777).
subtype(keyvaluepair33555630(A,B),keyvaluepair33555630(C,D)) :- A = C, B = D.
subtype(multicastdelegate33554567,delegate33554565).
subtype(multicastdelegate33554567,icloneable33554495).
subtype(multicastdelegate33554567,iserializable33556234).
subtype(multicastdelegate33554567,multicastdelegate33554567).
subtype(multicastdelegate33554567,object33554493).
subtype(object33554493,object33554493).
subtype(valuetype33554777,object33554493).
subtype(valuetype33554777,valuetype33554777).
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (subtype(B,ia33554436(D)), subtype(D,ia33554436(B)), subtype(L,func33554502(M,dictionary33555602(N,O))), subtype(func33554503(N,P,M),func33554503(N,func33554502(N,O),N)), not_subtype(valuetype33554777,A), not_subtype(B,ia33554436(B)), not_subtype(C,ia33554436(B)), not_subtype(D,ia33554436(D)), not_subtype(E,ia33554436(D)), not_subtype(F,B), not_subtype(G,B), not_subtype(F,H), not_subtype(G,H), not_subtype(A,H), not_subtype(I,H), not_subtype(J,H), not_subtype(K,H), not_subtype(L,func33554502(M,dictionary33555602(N,O))), not_subtype(func33554503(N,P,M),func33554503(N,func33554502(N,O),N)), default_constructor(A), is_reference(J), format('~w ~w~n', ['B =', B]),format('~w ~w~n', ['D =', D]),format('~w ~w~n', ['L =', L]),format('~w ~w~n', ['M =', M]),format('~w ~w~n', ['N =', N]),format('~w ~w~n', ['O =', O]),format('~w ~w~n', ['P =', P]),format('~w ~w~n', ['A =', A]),format('~w ~w~n', ['C =', C]),format('~w ~w~n', ['E =', E]),format('~w ~w~n', ['F =', F]),format('~w ~w~n', ['G =', G]),format('~w ~w~n', ['H =', H]),format('~w ~w~n', ['I =', I]),format('~w ~w~n', ['J =', J]),format('~w ~w~n', ['K =', K]))))).
