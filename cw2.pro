/* prosta implementacjia silni */
silnia(0,1).
silnia(N,S) :- 
	N>0,
	N1 is N-1,
	silnia(N1,S1),
	S is N*S1.

