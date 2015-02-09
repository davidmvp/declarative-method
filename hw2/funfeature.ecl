:- lib(ic).

go :-
        cputime(T0),
        ( solve(Solution), writeln(Solution), fail ; true ),
        T is cputime - T0,
        writeln([T, 'seconds']).

solve(Pattern) :-
        Pattern = [
                 A, B, C, D, E
                  ],
        Pattern :: 0..9,
        Od :: [1..9],
        % Problem constraints
        % no leading zeroes
        A #\= 0, 
        % last digit is even makes the whole thing even
        2*Od #= E,
        E #= A + B + C + D,

%       Choice=input_order,             % slowest
        Choice=first_fail,              % fastest
%       Choice=most_constrained,        % medium
        search(Pattern, 0, Choice, indomain, complete, []).
