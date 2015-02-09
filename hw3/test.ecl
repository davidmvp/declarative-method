add(z,B,B).
add(s(A),B,Sum) :- add(A,s(B),Sum).
