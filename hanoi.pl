move(1, X, Y, _, [[X, Y]]).
    move(N, X, Y, Z, P) :-
    M is (N - 1),
    move(M, X, Z, Y, P1),
    move(1, X, Y, Z, P2),
    move(M, Z, Y, X, P3),
    append(P1, P2, Q),
    append(Q, P3, P).
