/* liczby naturalne: 0, s(0), s(s(0)), ...*/
dod(0,X,X).
dod(s(X),Y,Z) :- dod(X,s(Y),Z).

times(0,X,0).
times(s(X),Y,Z) :- times(X,Y,XY), dod(XY,Y,Z).
 
kod(0,0).
kod(N,s(X)) :-
	N>0, K is N-1, kod(K,X).

