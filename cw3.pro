/* liczby naturalne: 0, s(0), s(s(0)), ...*/
dod(0,X,X).
dod(s(X),Y,Z) :- dod(X,s(Y),Z).

mnoz(0,X,0).
mnoz(s(X),Y,Z) :- mnoz(X,Y,XY), dod(XY,Y,Z).

licz(0,S) :- write(S).
licz(s(X),Z) :- S is Z+1, licz(X,S).
 
kod(0,0,S) :- write(S).
kod(s(X),Z) :- S is Z+1, N>0, K is N-1, kod(K,X,S).

 

