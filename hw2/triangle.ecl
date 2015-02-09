% Da Lu Problem 2a

:- lib(ic).

go :-
        cputime(T0),
        % to get answers use below as:  eclps -b magictriangle.ecl -e 'go' | uniq > triangleout
        %( solve(Solution, N), writeln(Solution), writeln(N), fail ; true ),
        ( solve(Solution, N), writeln(N), fail ; true ),
        T is cputime - T0,
        writeln([T, 'seconds']).

solve(Pattern, N) :-
        Pattern = [
                     A,
                   B,C,D,
                 E,F,G,H,I
                  ],
        Pattern :: 1 .. 9,
        N :: 10 .. 30, 
        % Problem constraints
        alldifferent(Pattern),
          A+B+C+D #= N,
          B+E+F+G #= N,
          D+G+H+I #= N, 

%       Choice=input_order,             % slowest
        Choice=first_fail,              % fastest
%       Choice=most_constrained,        % medium
        search(Pattern, 0, Choice, indomain, complete, []).


