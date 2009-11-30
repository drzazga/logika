podterm(P,P).
podterm(P,T(X)) :- nonvar(P), nonvar(T), write(X), nl, podterm(P,X).

