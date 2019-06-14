move(1, A, _, Z, [[A, Z]]).
move(N, A, [H|T], Z, P) :-
    M1 is (N - floor(sqrt(2*N + 1)) + 1),
    M2 is (N - M1),
    move(M1, A, [Z|T], H, P1),
    move(M2, A, T    , Z, P2),
    move(M1, H, [A|T], Z, P3),
    append(P1, P2, Q),
    append(Q, P3, P).
