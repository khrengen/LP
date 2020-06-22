test --> append([1]).
p([X,_|T],[X|R]) :- p(T,R).
p([],[]).
p([X],[X]).

getlast(L,X) :- append(_,[X],L).

next2(L,X,Y) :- append(_,[X,Y|_],L).

fib(0,0).
fib(1,1).
fib(N,X) :- N1 is N - 1,
	fib(N1,Y),
	N2 is N - 2,
	fib(N2,Z),
	 X is Y+Z.

leng([],0).
leng([_|T],N) :- leng(T,M), N is M+1.

leng2(L,N) :- leng2(L,0,N).
leng2(_|T,S,N) :-
	S1 is S + 1,
	leng2(T,S1,N).
leng2([],N,N).

last3(L,X,Y,Z) :- append(Q,[Z],L), append(W,[Y],Q), append(_,[X],W).

pow(_,0,1).
pow(X,N,Res) :- pow(X,N1,Res1), N is N1 + 1, Res is Res1 * X.


pairs([], []).
pairs([_],[]).
pairs([Head|[Head1|Tail]], [Resh|ResT]) :- pairs([Head1|Tail], ResT), Resh is Head1 + Head. 


pow2(X,N,R) :- pow2(X,N,0,1,R).
pow2(_,N,N,R,R).
pow2(X,N,N1,R1,R) :-
	N2 is N1 + 1,
	R2 is R1 * X,
	pow2(X,N,N2,R2,R).


rm([X|Tail],X,Tail).
rm([X|Tail],Y,[X|Tail2]) :-
    rm(Tail,Y,Tail2).