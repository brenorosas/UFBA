exist(X,[X|_]) :- !.
exist(X,[_|R]) :- exist(X,R).

interseccao([],_,[]) :- !.
interseccao([X|R], L, [X|W]) :- exist(X,L), interseccao(R,L,W), !.
interseccao([_|R], L, W) :- interseccao(R,L,W).

%1
oculte(_,[],[]) :- !.
oculte(X,[X|R], [xxxx|W]) :- oculte(X,R,W), !.
oculte(X,[Y|R], [Y|W]) :- oculte(X,R,W).

%2
oculteConj(_,[],[]) :- !.
oculteConj(X, [Y|R], [xxxx|W]) :- exist(Y,X), oculteConj(X,R,W), !.
oculteConj(X,[Y|R],[Y|W]) :- oculteConj(X,R,W).

%3
intercala(_,_,0,[]) :- !.
intercala(X,_,1,[X]) :- !.
intercala(X,Y,N,[X,Y|W]) :- Z is N-2, intercala(X,Y,Z,W).

%4
cont(_, [], 0) :- !.
cont(X, [X|R], Y) :- Z is 1, cont(X,R,W), Y is Z+W, !.
cont(X, [_|R], Y) :- Z is 0, cont(X,R,W), Y is Z+W.

remova(_,[],[]) :- !.
remova(X,[X|T],W) :- remova(X,T,W), !.
remova(X,[H|T],[H|NT]):-remova(X,T,NT).

sumarize([],[],[]) :- !.
sumarize([X|R], [X|R1], [Y|R2]) :- cont(X,[X|R],Y), remova(X,[X|R],L), sumarize(L,R1,R2).

%5
make(V,[X],[X],[]) :- V==X, !.
make(_,[X],[],[X]) :- !.
make(V,[X|R],[X|W],L) :- V==X, make(V,R,W,L), !.
make(_, L, [], L).

empacote([],[]) :- !.
empacote([X|R], [L|W]) :- make(X,[X|R],L,L2), empacote(L2,W).
