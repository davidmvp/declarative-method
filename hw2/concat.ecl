%
%  Puzzle from Khayri Ali, SICS
%
%  Using ECLiPSe finite domain variables.
%  Written by Andre Veron and Liang-liang Li, ECRC.
%
%

:- lib(ic).

go :-
        cputime(T0),
        ( solve(Solution), writeln(Solution), fail ; true ),
        T is cputime - T0,
        writeln([T, 'seconds']).

solve(Pattern) :-
        Pattern = [
                  X,Y
                  ],
        Pattern :: 100 .. 999,
        % Problem constraints
	6 * (X * 1000 + Y) #= Y * 1000 + X,        

% Optional anti-symmetry constraints
        % Forbid rotated solutions: require A to be the smallest corner
        % Forbid solutions mirrored on the A-S diagonal

%       Choice=input_order,             % slowest
        Choice=first_fail,              % fastest
%       Choice=most_constrained,        % medium
        search(Pattern, 0, Choice, indomain, complete, []).
