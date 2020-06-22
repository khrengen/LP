move(A,B):-
    append(H,[w,space|T],A),
    append(H,[space,w|T],B).
move(A,B):-
    append(H,[space,b|T],A),
    append(H,[b,space|T],B).
move(A,B):-
    append(H,[w,b,space|T],A),
    append(H,[space,b,w|T],B).
move(A,B):-
    append(H,[space,w,b|T],A),
    append(H,[b,w,space|T],B).
 

result([_]):-!.
result([A,B|Tail]):-
    result([B|Tail]),
    nl,write(B),write(' -> '),write(A).


search_depth(Start,Finish):-
	get_time(B1),
	depth([Start],Finish,Way),
	result(Way),
	get_time(E1),
    TIME1 is E1 - B1,
    nl,nl,write('Time: '), write(TIME1),nl,!.
 
prolong([X|Tail],[New,X|Tail]):-
    move(X,New),
    not(member(New,[X|Tail])).
 
depth([Finish|Tail],Finish,[Finish|Tail]).
depth(XWay,Finish,Way):-
    prolong(XWay,NewWay),
    depth(NewWay,Finish,Way).


width([[Finish|Tail]|_],Finish,[Finish|Tail]).
width([XWay|OtherWays],Finish,Way):-
    findall(W,prolong(XWay,W),Ways),
    append(OtherWays,Ways,NewWays),
    width(NewWays,Finish,Way).

search_width(Start,Finish):-
	get_time(B2),
    width([[Start]],Finish,Way),
    result(Way),
    get_time(E2),
    TIME2 is E2 - B2,
    nl,nl,write('Time: '), write(TIME2),nl,!.

int(1).
int(N):-
	int(M),
	N is M + 1.

iter([Finish|Tail],Finish,[Finish|Tail],0).
iter(XWay,Finish,Way,N):-
	N > 0,
    prolong(XWay,NewWay),N1 is N-1,
    iter(NewWay,Finish,Way,N1).

search_iter(Start,Finish):-
	get_time(B3),
    int(Count),
    (Count > 100,!;%защита от зацикливание если пути нет
    iter([Start],Finish,Way,Count),
    result(Way)),
    get_time(E3),
    TIME3 is E3 - B3,
    nl,nl,write('Time: '), write(TIME3),nl,!.
 

