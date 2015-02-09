:- lib(ic).                     % include the standard interval constraint library
:- lib(branch_and_bound).       % include the branch and bound library for minimization
:- lib(ic_edge_finder).         % include the cumulative constraint library needed for resource constraints

solution(N) :-

                   % set the domain for the letters of the triangle
        Letters = [A,B,C,D,E,F,G,H,I],
        Sum = [N],
        Letters :: [1..9],
        alldifferent(Letters),
        Sum :: [10..30],

                   % constrain the sum to the same values
        A + B + C + D #= N,
        B + E + F + G #= N,
        D + G + H + I #= N,

        %flatten([Sum, Letters], AllVars),

                % find a labeling (aka assignment) of values to TaskFinishTimes that minimizes EndTime
        % minimize(labeling(Letters), Sum),

                   % ask for solution        
	labeling(Sum),
        labeling(Letters),
	printf("A%d B%d C%d D%d ", [A,B,C,D]).
        %findall(Sum,solve(Sum),List), printf("%Dw",[List]).
	%labeling(allVars).
