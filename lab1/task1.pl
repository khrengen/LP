mylength([],0).
mylength([_|Y], N) :-
    mylength(Y, N1), 
    N is 1 + N1.

mymember(X,[X|_]).
mymember(X,[_|T]) :- 
    mymember(X,T).


myappend([],X,X).
myappend([X|Y],Z,[X|T]) :-
    myappend(Y,Z,T).

myremove(X,[X|T],T).
myremove(X,[Y|T],[Y|R]) :-
    myremove(X,T,R).

mypermute([],[]).
mypermute(X,[Y|T1]) :-
    myremove(Y,X,T),
    mypermute(T,T1).

mysublist(S,R) :-
    myappend(X,_,S),
    myappend(_,R,X). 


insert(X,T,1,[X|T]).
insert(X,[Y|T],K,[Y|Y2]) :- 
    K > 1, K1 is K - 1, insert(X,T,K1,Y2).

elemN([H|_],1,H).
elemN([_|T],N,X) :-
    M is N - 1, elemN(T,M,X).

insert2(X,T,K,NT) :-
    append(T,X,Y),
    mypermute(Y,NT),
    elemN(NT,K,N),
    myremove(N,NT,Z),
    mysublist(Z,T).


geom([A, B], Q) :-
    Q is B / A.
    geom([_, B | T], Q) :-
    geom([B|T], P),
    P = Q.

is_geom([A, B | T]) :-
    Q is B / A,
    geom([A, B|T], Q).


rm([X|Tail],X,[Tail]).
rm([X|Tail],Y,[X|Tail2]) :-
    rm(Tail,Y,Tail2).