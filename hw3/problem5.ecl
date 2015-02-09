


add(z,B,B).
add(s(A),B,Sum) :- add(A,s(B),Sum).
mult(z,N,z).
mult(s(M),N,P) :- mult(M,N,W), add(W,N,P).
pow(N,s(z),N).
pow(N,z,s(z)).
pow(M,s(N),P) :- pow(M,N,W), mult(W,M,P).
