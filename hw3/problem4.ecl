swap([X,Y|Rest], [Y,X|Rest]).
swap([Z|Rest], [Z|Rest1]) :- swap(Rest, Rest1).

mystery(W,Z) :- swap(W,X), swap(X,Y), swap(Y,Z).
