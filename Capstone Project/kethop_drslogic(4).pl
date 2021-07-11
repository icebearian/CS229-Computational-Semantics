sởchỉ([X|_],Y,X):- unifiable(X, Y, _).
sởchỉ([_|T],Y,X):- sởchỉ(T, Y, X).
 
danhsáchdrs(drs(A,B), [drs(A,B)]).
danhsáchdrs(alpha(X,A), [alpha(X,A)]).
danhsáchdrs(lambda(X,A), [lambda(X,A)]).
danhsáchdrs(A x B, R):-
	danhsáchdrs(A, RA), 
	danhsáchdrs(B,RB),
	!, 
	append(RA, RB, R).
 

kếthợp(drs(D,C1),drs(D,C2)):-
    kếthợp(C1,C2).

kếthợp(alpha(X, drs(D,C1)), alpha(X, drs(D,C2))):-
    kếthợp(C1,C2).
 
kếthợp(B1 x alpha((X,XB), B2), drs(D3,C3)):-
    kếthợp(B1,drs(D1,C1)),
kếthợp(B2,drs(D2,C2)),
    append(D2,D1,D3t),
	sởchỉ(D1, (X,XB), (V,_)),
	append(C1, [X=V], C1t),
	append(C1t,C2,C3t), 
	list_to_set(D3t, D3), 
	list_to_set(C3t, C3).

kếthợp(B1 x B2,drs(D3,C3)):- kếthợp(B1,drs(D1,C1)),
kếthợp(B2,drs(D2,C2)),
    append(D2,D1,D3t),
	append(C1,C2,C3t), 
	list_to_set(D3t, D3), 
	list_to_set(C3t, C3).
 
kếthợp([B1 => B2|C1],[B3 => B4|C2]):-
    !, 
	kếthợp(B1,B3), 
	kếthợp(B2,B4),
    kếthợp(C1,C2).
kếthợp([B1 v B2|C1],[B3 v B4|C2]):-
    !,
	kếthợp(B1,B3),
	kếthợp(B2,B4),
    kếthợp(C1,C2).
 
kếthợp([~ B1|C1], [~ B2|C2]):-
    !,
	kếthợp(B1,B2),
	kếthợp(C1,C2).
 
kếthợp([C|C1],[C|C2]):- kếthợp(C1,C2).
 
kếthợp([],[]).
 
kếthợpcâu(drs(P,Q), [], drs(P,Q)).
kếthợpcâu(drs(P,Q), [B1|T] ,drs(D3,C3)):- 
    kếthợp(drs(P,Q) x B1, R1), 
	kếthợpcâu(R1, T, drs(D3, C3)).
 
kếthợpcâu(lambda(X, drs(P,Q)), [B1|T], lambda(X, drs(D3,C3))):- 
    kếthợp(drs(P,Q) x B1, R1), 
	kếthợpcâu(R1, T, drs(D3, C3)).

kếthợpcâu(drs(P,Q), [lambda(X, B1)|T], lambda(X, drs(D3,C3))):- 
    kếthợp(drs(P,Q) x B1, R1), 
	kếthợpcâu(R1, T, drs(D3, C3)).

dịchvănbản(A,[],A):-!.
dịchvănbản(P,[S|T],R):- s(Rs, S, []), biến_đổi_b(Rs, E), danhsáchdrs(E, Re), kếthợpcâu(P, Re, Rp), dịchvănbản(Rp, T, R), !.


drs2logic(A,A):-A=..[R|_], từ_vựng(R,_).
drs2logic(A,A):-A=..[=|_].

 

drs2logic(drs([],[drs([(X,_)],A) => B|T]), với_mọi(X, (Ra => Rb) & Rt)):-drs2logic(A,Ra), drs2logic(B, Rb), drs2logic(T, Rt).
drs2logic(drs([],[drs([(X,_)|TX],A) => B|T]), với_mọi(X, R)):-drs2logic(drs([],[drs(TX,A) => B|T]), R).

 

drs2logic(drs([],[A]), R):-drs2logic(A,R).
drs2logic(drs([],[A|T]), Ra & Rt):- drs2logic(A,Ra), drs2logic(drs([],T),Rt).
drs2logic(drs([(A,_)],B), tồn_tại(A, R)):-drs2logic(drs([],B), R).
drs2logic(drs([(A,_)|T], B), tồn_tại(A, R)):-drs2logic(drs(T,B), R).
