add(z,B,B).				% 0+B=B.
add(s(A),B,Sum) :- add(A,s(B),Sum).  
