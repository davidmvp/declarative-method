
:- lib(ic).

go :-
        cputime(T0),
        ( solve(Solution), writeln(Solution), fail ; true ),
        T is cputime - T0,
        writeln([T, 'seconds']).

solve(Pattern) :-
        Pattern = [
                 S1, S2, Y
                  ],
        Pattern :: 0 .. 1000,
        P :: 0 .. 10000,
        A :: 0 .. 1000000,
        % Problem constraints
        % Sides are S1=S2, Y, and H(height), P (perimeter), A(area)
        S1 #= S2,
	% Find the height
        S1*S2 #= (Y/2)*(Y/2) + H * H,
	S1 + S2 #> Y,
        P #= 2*S1 + Y,
        A #= (Y * H)/2,
        A #= 6*P,

%       Choice=input_order,             % slowest
        Choice=first_fail,              % fastest
%       Choice=most_constrained,        % medium
        search(Pattern, 0, Choice, indomain, complete, []),
        printf("P: %d A: %d", [P, A]).



