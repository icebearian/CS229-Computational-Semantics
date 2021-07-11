:-op(1000,yfx,x).
:-op(950,yfx,@).
:-op(900,yfx,=>).
:-op(850,yfx,v).
:-op(800,yfx,&).
:-op(750,fy,~).

biến_đổi_b(A, KQ):-
	var(A),!,KQ=A.
biến_đổi_b(F@A,KQ):-
	compound(F),biến_đổi_b(F,KQ1),
	triển_khai(KQ1,A,KQ2),!,
	biến_đổi_b(KQ2,KQ).
biến_đổi_b(F,KQ):-
	F=..[A|B],biến_đổi_ds(B,KQ1),
	KQ=..[A|KQ1].

biến_đổi_ds([],[]).
biến_đổi_ds([F|A],[KQ|B]):-
	biến_đổi_b(F,KQ),
	biến_đổi_ds(A,B).

triển_khai(lambda(X,F),A,KQ):-
	thay_thế(A,X,F,KQ).

thay_thế(A,B,F,KQ):-F==B,!,KQ=A.
thay_thế(_,_,F,KQ):-
	not(compound(F)),!,KQ=F.
thay_thế(A,B,F,KQ):-
	F=..[H|[B1|F1]],
	member(H,[lamda,với_mọi,tất_cả]),!,
	(
		B1==B,!,KQ=F;

		thay_thế(A,B,F1,KQ1),
		KQ=..[H|[B1|KQ1]]
	).
thay_thế(A,B,F,KQ):-
	F=..[H|B1],thay_thế_ds(A,B,B1,KQ1),
	!,KQ=..[H|KQ1].

thay_thế_ds(_,_,[],[]).
thay_thế_ds(A,B,[F|T1],[KQ|T2]):-
	thay_thế(A,B,F,KQ),
	thay_thế_ds(A,B,T1,T2).

dịch(S,KQ):-
	s(T,S,[]),biến_đổi_b(T,KQ).

khớp(A,A):-var(A).
khớp(F,A):-F=..[_|T], khớp_ds(T,A).

khớp_ds([A|_]|A):-var(A).
khớp_ds([_|T],A):-khớp_ds(T,A).

dịch_văn_bản(S,KQ):-
	s(T,S,[]),biến_đổi_b(T,KQ).
	
	
