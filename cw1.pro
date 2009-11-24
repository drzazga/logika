mezczyzna(marek).
mezczyzna(patryk).
mezczyzna(bartek).
mezczyzna(kuba).
mezczyzna(grzesiek).

kobieta(janina).
kobieta(ewa).

rodzic(marek,bartek). % oznacza, ze adam jest rodzicem piotra
rodzic(ewa,bartek).
rodzic(marek,patryk).
rodzic(ewa,patryk).
rodzic(janina,marek).
rodzic(janina,grzesiek).
rodzic(grzesiek,kuba).

ojciec(O,C) :- mezczyzna(O), rodzic(O,C).
matka(M,C)  :- kobieta(M), rodzic(M,C).

jest_ojcem(O) :- ojciec(O,_).
jest_matka(M) :- matka(M,_).

rodzenstwo(A,B) :- rodzic(P,A), rodzic(P,B), A\=B.

pelne_rodzenstwo(A,B) :- matka(M,A), matka(M,B), ojciec(O,A), ojciec(O,B), A\=B.
wujek(A,B) :- rodzenstwo(A,O), rodzic(O,B).
kuzyn(A,B) :- ojciec(R,A), wujek(R,B).

%janina - marek - bartek

przodek(A,B) :- rodzic(A,B).
przodek(A,B) :- rodzic(C,B), przodek(A,C).

potomek(A,B) :- rodzic(B,A).
potomek(A,B) :- rodzic(C,A), potomek(C,B).

