contravariant_subtype(A,B) :- B = A, is_valuetype(B).
contravariant_subtype(A,B) :- is_reference(B), subtype(B,A).
covariant_subtype(A,B) :- A = B, is_valuetype(A).
covariant_subtype(A,B) :- is_reference(A), subtype(A,B).
default_constructor(object33554493).
is_reference(icomparable33554520).
is_reference(istructuralcomparable33555577).
is_reference(istructuralequatable33555576).
is_reference(ituple33556673).
is_reference(itupleinternal33554526).
is_reference(object33554493).
is_reference(tuple33554528(_)).
is_reference(tuple33554529(_,_)).
is_unmanaged(_) :- false.
is_valuetype(_) :- false.
not_contravariant_subtype(A,B) :- B \= A, is_valuetype(B).
not_contravariant_subtype(A,B) :- is_reference(B), not_subtype(B,A).
not_covariant_subtype(A,B) :- A \= B, is_valuetype(A).
not_covariant_subtype(A,B) :- is_reference(A), not_subtype(A,B).
not_subtype(icomparable33554520,istructuralcomparable33555577).
not_subtype(icomparable33554520,istructuralequatable33555576).
not_subtype(icomparable33554520,ituple33556673).
not_subtype(icomparable33554520,itupleinternal33554526).
not_subtype(icomparable33554520,tuple33554528(_)).
not_subtype(icomparable33554520,tuple33554529(_,_)).
not_subtype(istructuralcomparable33555577,icomparable33554520).
not_subtype(istructuralcomparable33555577,istructuralequatable33555576).
not_subtype(istructuralcomparable33555577,ituple33556673).
not_subtype(istructuralcomparable33555577,itupleinternal33554526).
not_subtype(istructuralcomparable33555577,tuple33554528(_)).
not_subtype(istructuralcomparable33555577,tuple33554529(_,_)).
not_subtype(istructuralequatable33555576,icomparable33554520).
not_subtype(istructuralequatable33555576,istructuralcomparable33555577).
not_subtype(istructuralequatable33555576,ituple33556673).
not_subtype(istructuralequatable33555576,itupleinternal33554526).
not_subtype(istructuralequatable33555576,tuple33554528(_)).
not_subtype(istructuralequatable33555576,tuple33554529(_,_)).
not_subtype(ituple33556673,icomparable33554520).
not_subtype(ituple33556673,istructuralcomparable33555577).
not_subtype(ituple33556673,istructuralequatable33555576).
not_subtype(ituple33556673,itupleinternal33554526).
not_subtype(ituple33556673,tuple33554528(_)).
not_subtype(ituple33556673,tuple33554529(_,_)).
not_subtype(itupleinternal33554526,icomparable33554520).
not_subtype(itupleinternal33554526,istructuralcomparable33555577).
not_subtype(itupleinternal33554526,istructuralequatable33555576).
not_subtype(itupleinternal33554526,tuple33554528(_)).
not_subtype(itupleinternal33554526,tuple33554529(_,_)).
not_subtype(object33554493,icomparable33554520).
not_subtype(object33554493,istructuralcomparable33555577).
not_subtype(object33554493,istructuralequatable33555576).
not_subtype(object33554493,ituple33556673).
not_subtype(object33554493,itupleinternal33554526).
not_subtype(object33554493,tuple33554528(_)).
not_subtype(object33554493,tuple33554529(_,_)).
not_subtype(tuple33554528(_),tuple33554529(_,_)).
not_subtype(tuple33554528(A),tuple33554528(B)) :- A \= B.
not_subtype(tuple33554529(_,_),tuple33554528(_)).
not_subtype(tuple33554529(_,B),tuple33554529(_,D)) :- B \= D.
not_subtype(tuple33554529(A,_),tuple33554529(C,_)) :- A \= C.
subtype(icomparable33554520,icomparable33554520).
subtype(icomparable33554520,object33554493).
subtype(istructuralcomparable33555577,istructuralcomparable33555577).
subtype(istructuralcomparable33555577,object33554493).
subtype(istructuralequatable33555576,istructuralequatable33555576).
subtype(istructuralequatable33555576,object33554493).
subtype(ituple33556673,ituple33556673).
subtype(ituple33556673,object33554493).
subtype(itupleinternal33554526,ituple33556673).
subtype(itupleinternal33554526,itupleinternal33554526).
subtype(itupleinternal33554526,object33554493).
subtype(object33554493,object33554493).
subtype(tuple33554528(_),icomparable33554520).
subtype(tuple33554528(_),istructuralcomparable33555577).
subtype(tuple33554528(_),istructuralequatable33555576).
subtype(tuple33554528(_),ituple33556673).
subtype(tuple33554528(_),itupleinternal33554526).
subtype(tuple33554528(_),object33554493).
subtype(tuple33554528(A),tuple33554528(B)) :- A = B.
subtype(tuple33554529(_,_),icomparable33554520).
subtype(tuple33554529(_,_),istructuralcomparable33555577).
subtype(tuple33554529(_,_),istructuralequatable33555576).
subtype(tuple33554529(_,_),ituple33556673).
subtype(tuple33554529(_,_),itupleinternal33554526).
subtype(tuple33554529(_,_),object33554493).
subtype(tuple33554529(A,B),tuple33554529(C,D)) :- A = C, B = D.
go :- set_prolog_flag(occurs_check, true), time(call_with_time_limit(20, limit(1, (not_subtype(A,tuple33554529(tuple33554528(A),A)), not_subtype(B,tuple33554529(tuple33554528(A),A)), not_subtype(A,tuple33554529(A,C)), not_subtype(B,tuple33554529(A,C)), format('~w ~w~n', ['A =', A]),format('~w ~w~n', ['B =', B]),format('~w ~w~n', ['C =', C]))))).
