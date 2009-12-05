/* prosta implementacjia silni */
/*silnia(0,1).*/
/*silnia(N,S) :- N>0, N1 is N-1, silnia(N1,S1), S is N*S1, write(S), nl.*/

silnia3(0,S).
silnia3(N,S) :- N>0, N1 is N-1, silnia3(N1,S1), S1 is N*S, write(S1), nl.

silnia2(N,S) :- nonvar(N), silnia(N,Roz).

silnia(1,1).
silnia(N,Roz) :- N>1, N1=N-1, silnia(N1,X), Roz = N*X.
