contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(a33554459).
default_constructor(b33554460).
default_constructor(c33554461).
default_constructor(e33554463).
default_constructor(k33554466).
default_constructor(m33554470).
default_constructor(n33554471).
default_constructor(object33554493).
default_constructor(thing33554490).
is_reference(a33554459).
is_reference(b33554460).
is_reference(c33554461).
is_reference(e33554463).
is_reference(ibox33554489(_)).
is_reference(ic33554438(_)).
is_reference(ie33554440).
is_reference(if33554441).
is_reference(ig33554442).
is_reference(ih33554443).
is_reference(ik33554445).
is_reference(iq33554451).
is_reference(k33554466).
is_reference(m33554470).
is_reference(n33554471).
is_reference(object33554493).
is_reference(thing33554490).
is_unmanaged(_) :- false.
is_valuetype(_) :- false.
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(a33554459,b33554460).
not_subtype(a33554459,c33554461).
not_subtype(a33554459,e33554463).
not_subtype(a33554459,ibox33554489(_)).
not_subtype(a33554459,ic33554438(_)).
not_subtype(a33554459,ie33554440).
not_subtype(a33554459,if33554441).
not_subtype(a33554459,ig33554442).
not_subtype(a33554459,ih33554443).
not_subtype(a33554459,ik33554445).
not_subtype(a33554459,iq33554451).
not_subtype(a33554459,k33554466).
not_subtype(a33554459,m33554470).
not_subtype(a33554459,n33554471).
not_subtype(a33554459,thing33554490).
not_subtype(b33554460,c33554461).
not_subtype(b33554460,e33554463).
not_subtype(b33554460,ibox33554489(_)).
not_subtype(b33554460,ic33554438(_)).
not_subtype(b33554460,ig33554442).
not_subtype(b33554460,ih33554443).
not_subtype(b33554460,iq33554451).
not_subtype(b33554460,k33554466).
not_subtype(b33554460,m33554470).
not_subtype(b33554460,n33554471).
not_subtype(b33554460,thing33554490).
not_subtype(c33554461,e33554463).
not_subtype(c33554461,ibox33554489(_)).
not_subtype(c33554461,ic33554438(_)).
not_subtype(c33554461,ig33554442).
not_subtype(c33554461,ih33554443).
not_subtype(c33554461,iq33554451).
not_subtype(c33554461,k33554466).
not_subtype(c33554461,m33554470).
not_subtype(c33554461,n33554471).
not_subtype(c33554461,thing33554490).
not_subtype(e33554463,ibox33554489(_)).
not_subtype(e33554463,ic33554438(_)).
not_subtype(e33554463,k33554466).
not_subtype(e33554463,m33554470).
not_subtype(e33554463,n33554471).
not_subtype(e33554463,thing33554490).
not_subtype(ibox33554489(_),a33554459).
not_subtype(ibox33554489(_),b33554460).
not_subtype(ibox33554489(_),c33554461).
not_subtype(ibox33554489(_),e33554463).
not_subtype(ibox33554489(_),ic33554438(_)).
not_subtype(ibox33554489(_),ie33554440).
not_subtype(ibox33554489(_),if33554441).
not_subtype(ibox33554489(_),ig33554442).
not_subtype(ibox33554489(_),ih33554443).
not_subtype(ibox33554489(_),ik33554445).
not_subtype(ibox33554489(_),iq33554451).
not_subtype(ibox33554489(_),k33554466).
not_subtype(ibox33554489(_),m33554470).
not_subtype(ibox33554489(_),n33554471).
not_subtype(ibox33554489(_),thing33554490).
not_subtype(ibox33554489(A),ibox33554489(B)) :- not_contravariant_subtype(A,B).
not_subtype(ic33554438(_),a33554459).
not_subtype(ic33554438(_),b33554460).
not_subtype(ic33554438(_),c33554461).
not_subtype(ic33554438(_),e33554463).
not_subtype(ic33554438(_),ibox33554489(_)).
not_subtype(ic33554438(_),ie33554440).
not_subtype(ic33554438(_),if33554441).
not_subtype(ic33554438(_),ig33554442).
not_subtype(ic33554438(_),ih33554443).
not_subtype(ic33554438(_),ik33554445).
not_subtype(ic33554438(_),iq33554451).
not_subtype(ic33554438(_),k33554466).
not_subtype(ic33554438(_),m33554470).
not_subtype(ic33554438(_),n33554471).
not_subtype(ic33554438(_),thing33554490).
not_subtype(ic33554438(A),ic33554438(B)) :- A \= B.
not_subtype(ie33554440,a33554459).
not_subtype(ie33554440,b33554460).
not_subtype(ie33554440,c33554461).
not_subtype(ie33554440,e33554463).
not_subtype(ie33554440,ibox33554489(_)).
not_subtype(ie33554440,ic33554438(_)).
not_subtype(ie33554440,if33554441).
not_subtype(ie33554440,ig33554442).
not_subtype(ie33554440,ih33554443).
not_subtype(ie33554440,ik33554445).
not_subtype(ie33554440,iq33554451).
not_subtype(ie33554440,k33554466).
not_subtype(ie33554440,m33554470).
not_subtype(ie33554440,n33554471).
not_subtype(ie33554440,thing33554490).
not_subtype(if33554441,a33554459).
not_subtype(if33554441,b33554460).
not_subtype(if33554441,c33554461).
not_subtype(if33554441,e33554463).
not_subtype(if33554441,ibox33554489(_)).
not_subtype(if33554441,ic33554438(_)).
not_subtype(if33554441,ie33554440).
not_subtype(if33554441,ig33554442).
not_subtype(if33554441,ih33554443).
not_subtype(if33554441,ik33554445).
not_subtype(if33554441,iq33554451).
not_subtype(if33554441,k33554466).
not_subtype(if33554441,m33554470).
not_subtype(if33554441,n33554471).
not_subtype(if33554441,thing33554490).
not_subtype(ig33554442,a33554459).
not_subtype(ig33554442,b33554460).
not_subtype(ig33554442,c33554461).
not_subtype(ig33554442,e33554463).
not_subtype(ig33554442,ibox33554489(_)).
not_subtype(ig33554442,ic33554438(_)).
not_subtype(ig33554442,ie33554440).
not_subtype(ig33554442,if33554441).
not_subtype(ig33554442,ih33554443).
not_subtype(ig33554442,ik33554445).
not_subtype(ig33554442,iq33554451).
not_subtype(ig33554442,k33554466).
not_subtype(ig33554442,m33554470).
not_subtype(ig33554442,n33554471).
not_subtype(ig33554442,thing33554490).
not_subtype(ih33554443,a33554459).
not_subtype(ih33554443,b33554460).
not_subtype(ih33554443,c33554461).
not_subtype(ih33554443,e33554463).
not_subtype(ih33554443,ibox33554489(_)).
not_subtype(ih33554443,ic33554438(_)).
not_subtype(ih33554443,ie33554440).
not_subtype(ih33554443,if33554441).
not_subtype(ih33554443,ig33554442).
not_subtype(ih33554443,ik33554445).
not_subtype(ih33554443,iq33554451).
not_subtype(ih33554443,k33554466).
not_subtype(ih33554443,m33554470).
not_subtype(ih33554443,n33554471).
not_subtype(ih33554443,thing33554490).
not_subtype(ik33554445,a33554459).
not_subtype(ik33554445,b33554460).
not_subtype(ik33554445,c33554461).
not_subtype(ik33554445,e33554463).
not_subtype(ik33554445,ibox33554489(_)).
not_subtype(ik33554445,ic33554438(_)).
not_subtype(ik33554445,ie33554440).
not_subtype(ik33554445,if33554441).
not_subtype(ik33554445,ig33554442).
not_subtype(ik33554445,ih33554443).
not_subtype(ik33554445,iq33554451).
not_subtype(ik33554445,k33554466).
not_subtype(ik33554445,m33554470).
not_subtype(ik33554445,n33554471).
not_subtype(ik33554445,thing33554490).
not_subtype(iq33554451,a33554459).
not_subtype(iq33554451,b33554460).
not_subtype(iq33554451,c33554461).
not_subtype(iq33554451,e33554463).
not_subtype(iq33554451,ibox33554489(_)).
not_subtype(iq33554451,ic33554438(_)).
not_subtype(iq33554451,ie33554440).
not_subtype(iq33554451,if33554441).
not_subtype(iq33554451,ig33554442).
not_subtype(iq33554451,ih33554443).
not_subtype(iq33554451,ik33554445).
not_subtype(iq33554451,k33554466).
not_subtype(iq33554451,m33554470).
not_subtype(iq33554451,n33554471).
not_subtype(iq33554451,thing33554490).
not_subtype(k33554466,ibox33554489(_)).
not_subtype(k33554466,ic33554438(_)).
not_subtype(k33554466,m33554470).
not_subtype(k33554466,n33554471).
not_subtype(k33554466,thing33554490).
not_subtype(m33554470,a33554459).
not_subtype(m33554470,b33554460).
not_subtype(m33554470,c33554461).
not_subtype(m33554470,e33554463).
not_subtype(m33554470,ibox33554489(_)).
not_subtype(m33554470,ic33554438(A)) :- not_subtype(ic33554438(b33554460),ic33554438(A)).
not_subtype(m33554470,ie33554440).
not_subtype(m33554470,if33554441).
not_subtype(m33554470,ig33554442).
not_subtype(m33554470,ih33554443).
not_subtype(m33554470,ik33554445).
not_subtype(m33554470,iq33554451).
not_subtype(m33554470,k33554466).
not_subtype(m33554470,n33554471).
not_subtype(m33554470,thing33554490).
not_subtype(n33554471,a33554459).
not_subtype(n33554471,b33554460).
not_subtype(n33554471,c33554461).
not_subtype(n33554471,e33554463).
not_subtype(n33554471,ibox33554489(_)).
not_subtype(n33554471,ic33554438(A)) :- not_subtype(ic33554438(k33554466),ic33554438(A)).
not_subtype(n33554471,ie33554440).
not_subtype(n33554471,if33554441).
not_subtype(n33554471,ig33554442).
not_subtype(n33554471,ih33554443).
not_subtype(n33554471,ik33554445).
not_subtype(n33554471,iq33554451).
not_subtype(n33554471,k33554466).
not_subtype(n33554471,m33554470).
not_subtype(n33554471,thing33554490).
not_subtype(object33554493,a33554459).
not_subtype(object33554493,b33554460).
not_subtype(object33554493,c33554461).
not_subtype(object33554493,e33554463).
not_subtype(object33554493,ibox33554489(_)).
not_subtype(object33554493,ic33554438(_)).
not_subtype(object33554493,ie33554440).
not_subtype(object33554493,if33554441).
not_subtype(object33554493,ig33554442).
not_subtype(object33554493,ih33554443).
not_subtype(object33554493,ik33554445).
not_subtype(object33554493,iq33554451).
not_subtype(object33554493,k33554466).
not_subtype(object33554493,m33554470).
not_subtype(object33554493,n33554471).
not_subtype(object33554493,thing33554490).
not_subtype(thing33554490,a33554459).
not_subtype(thing33554490,b33554460).
not_subtype(thing33554490,c33554461).
not_subtype(thing33554490,e33554463).
not_subtype(thing33554490,ibox33554489(A)) :- not_subtype(ibox33554489(ibox33554489(thing33554490)),ibox33554489(A)).
not_subtype(thing33554490,ic33554438(_)).
not_subtype(thing33554490,ie33554440).
not_subtype(thing33554490,if33554441).
not_subtype(thing33554490,ig33554442).
not_subtype(thing33554490,ih33554443).
not_subtype(thing33554490,ik33554445).
not_subtype(thing33554490,iq33554451).
not_subtype(thing33554490,k33554466).
not_subtype(thing33554490,m33554470).
not_subtype(thing33554490,n33554471).
subtype(a33554459,a33554459).
subtype(a33554459,object33554493).
subtype(b33554460,a33554459).
subtype(b33554460,b33554460).
subtype(b33554460,ie33554440).
subtype(b33554460,if33554441).
subtype(b33554460,ik33554445).
subtype(b33554460,object33554493).
subtype(c33554461,a33554459).
subtype(c33554461,b33554460).
subtype(c33554461,c33554461).
subtype(c33554461,ie33554440).
subtype(c33554461,if33554441).
subtype(c33554461,ik33554445).
subtype(c33554461,object33554493).
subtype(e33554463,a33554459).
subtype(e33554463,b33554460).
subtype(e33554463,c33554461).
subtype(e33554463,e33554463).
subtype(e33554463,ie33554440).
subtype(e33554463,if33554441).
subtype(e33554463,ig33554442).
subtype(e33554463,ih33554443).
subtype(e33554463,ik33554445).
subtype(e33554463,iq33554451).
subtype(e33554463,object33554493).
subtype(ibox33554489(_),object33554493).
subtype(ibox33554489(A),ibox33554489(B)) :- contravariant_subtype(A,B).
subtype(ic33554438(_),object33554493).
subtype(ic33554438(A),ic33554438(B)) :- A = B.
subtype(ie33554440,ie33554440).
subtype(ie33554440,object33554493).
subtype(if33554441,if33554441).
subtype(if33554441,object33554493).
subtype(ig33554442,ig33554442).
subtype(ig33554442,object33554493).
subtype(ih33554443,ih33554443).
subtype(ih33554443,object33554493).
subtype(ik33554445,ik33554445).
subtype(ik33554445,object33554493).
subtype(iq33554451,iq33554451).
subtype(iq33554451,object33554493).
subtype(k33554466,a33554459).
subtype(k33554466,b33554460).
subtype(k33554466,c33554461).
subtype(k33554466,e33554463).
subtype(k33554466,ie33554440).
subtype(k33554466,if33554441).
subtype(k33554466,ig33554442).
subtype(k33554466,ih33554443).
subtype(k33554466,ik33554445).
subtype(k33554466,iq33554451).
subtype(k33554466,k33554466).
subtype(k33554466,object33554493).
subtype(m33554470,ic33554438(A)) :- subtype(ic33554438(b33554460),ic33554438(A)).
subtype(m33554470,m33554470).
subtype(m33554470,object33554493).
subtype(n33554471,ic33554438(A)) :- subtype(ic33554438(k33554466),ic33554438(A)).
subtype(n33554471,n33554471).
subtype(n33554471,object33554493).
subtype(object33554493,object33554493).
subtype(thing33554490,ibox33554489(A)) :- subtype(ibox33554489(ibox33554489(thing33554490)),ibox33554489(A)).
subtype(thing33554490,object33554493).
subtype(thing33554490,thing33554490).
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (subtype(C,ibox33554489(thing33554490)), subtype(A,m33554470), subtype(B,n33554471), not_subtype(A,m33554470), not_subtype(B,n33554471), format('~w ~w~n', ['C =', C]),format('~w ~w~n', ['A =', A]),format('~w ~w~n', ['B =', B]))))).
