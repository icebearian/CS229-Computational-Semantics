s(N@V)-->np(N),vp(V).
np(N)-->nnp(N).
np(N)-->nn(N).
np(N)-->prp(N).
np(D@N)-->dt(D),nn(N).
np(N1@N2)-->nn(N1),nnp(N2).
np((C@N1)@N2)-->np1(N1),cc(C),np(N2).
np1(N)-->nnp(N).
np2(N)-->nn(N).
vp(V@N)-->vb(V),np(N).
vp(V@N1)-->vb(V),np2(N1).
vp(V@J)-->vb(V),jj(J).

vb(lambda(P,P)) -->[là];[thì].
vb(lambda(P,lambda(X,P@ lambda(Y,drs([],[mua(X,Y)])))))-->[mua].
vb(lambda(P,lambda(X,P@ lambda(Y,drs([],[học(X,Y)])))))-->[học].
nnp(lambda(P, drs([(c_Hoàng, người)],[]) x P@c_Hoàng)) -->[hoàng].
nnp(lambda(P, drs([(c_Nga, người)],[]) x P@c_Nga)) -->[nga].
nnp(lambda(P, drs([(c_Tuấn, người)],[]) x P@c_Tuấn)) -->[tuấn].

nn(lambda(P, drs([], [con_mèo(P)]))) --> [con,mèo].
nn(lambda(P, drs([], [học_sinh(P)]))) --> [học,sinh].
nn(lambda(P, drs([], [con_chó(P)]))) --> [con,chó].
nn(lambda(P, drs([], [con_mèo_mun(P)]))) --> [con,mèo,mun].
nn(lambda(P, lambda(X, P@ lambda(Y, drs([],[em(X,Y)]))))) --> [em].
nn(lambda(P, lambda(X, P@ lambda(Y, drs([],[bạn(X,Y)]))))) --> [bạn].
nn(lambda(P, lambda(X, P@ lambda(Y, drs([],[anh(X,Y)]))))) --> [anh].

prp(lambda(P, drs([(X,người)],[]) x (P@X)))-->[ai].
prp(lambda(P, drs([(X,_)],[]) x (P@X))) --> [cái,gì].

cc(lambda(P,lambda(Q,lambda(X,(P@X) x (Q@X))))) --> [và].
dt(lambda(P, lambda(Q, (drs([(X,_)],[]) x (P@X)) x (Q@X)))) -->[một].

jj(lambda(P, drs([],[giỏi(P)]))) --> [giỏi].
