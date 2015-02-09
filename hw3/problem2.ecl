greater_than(s(A),z).
greater_than(s(A), s(B)) :- greater_than(A, B)
