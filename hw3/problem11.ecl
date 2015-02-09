
inorder1(t(X, nil, nil), [X]).
inorder1(t(X, Subtree, nil), List) :- inorder1(Subtree, T), append(T, [X], List).
inorder1(t(X, nil, Subtree), List) :- inorder1(Subtree, T), append([X], T, List).
inorder1(t(X, L, R),List) :- inorder1(L, L1), inorder1(R, R1), append(L1, [X], Mid), append(Mid, R1, List).

%part b
inorder2(t(X,nil,nil),[X]).
inorder2(t(X, nil, Subtree),List ) :- append([X], T, List), inorder2(Subtree, T).
inorder2(t(X, Subtree, nil), List) :- append(T, [X], List), inorder2(Subtree, T).
inorder2(t(X, L, R), List) :-  append(Mid,R1,List),append(L1, [X], Mid), inorder2(R, R1), inorder2(L, L1).
