uniq([],[]).
uniq([X|Xs], Ys) :- member(X,Xs),  uniq(Xs,Ys), !.
uniq([X|Xs],[X|Ys]) :- uniq(Xs,Ys).
