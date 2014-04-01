fact1(0,Result) :-
    Result is 1.
fact1(N,Result) :-
    N > 0,
    N1 is N-1,
    fact1(N1,Result1),
    Result is Result1*N.
	
	
fact2(N, R) :- fact2(N, 1, R).
fact2(0, R, R) :- !.
fact2(N, Acc, R) :-
    NewN is N - 1,
    NewAcc is Acc * N,
    fact2(NewN, NewAcc, R).	