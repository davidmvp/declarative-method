:- lib(branch_and_bound).
:- lib(ic).

inc_subseq([],[]).
inc_subseq([_|A],B) :- inc_subseq(A,B).
inc_subseq([A|As],[A|B]) :- inc_subseq(As, B), (B = [] ; B = [C|_], A#<C).

%part d
max_inc_subseq(A,B) :-  minimize( (inc_subseq(A,B), length(B,N), Cost is -N), Cost).


