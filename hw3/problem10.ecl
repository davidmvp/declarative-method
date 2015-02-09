t(X, nil, nil).
isotree(nil,nil).
isotree(t(Label,L1,R1),t(Label,L2,R2)) :- isotree(L1,L2), isotree(R1,R2). 
