:- ['one.pl'].


listsum([], 0).
listsum([Head|Tail], Result) :-
    listsum(Tail, SumOfTail),
    Result is Head + SumOfTail.

rem_dup([], []):-!.
rem_dup([X|T], Y):-
      member(X, T),
      !, rem_dup(T, Y).
rem_dup([X|T], [X|Y]):-
      !, rem_dup(T, Y).

elem([H|_],H).
elem([_|T],X) :-
	elem(T,X).

man_in_all(N) :- 
	findall(Z,student(_,Z),L),length(L, N).


first :-
	man_in_all(N),
	findall(X,subject(X,_),L),
	elem(L,S),
	findall(Z,grade(_, S, Z),L1), listsum(L1,P),
	SUB is P / N,
	write(S),write(": "), write(SUB),nl,fail.
	
	
bad(X,S) :- 
	findall(Z,grade(Z, X, 2),L), length(L,S).


third :-

	findall(Z,subject(Z,_),L),
	elem(L,S),
	bad(S,X),
	write("failed in "),write(S),write(": "),write(X),write(" student(s)"),nl,fail.


group(X,L) :-
    findall(Z,student(X,Z),L).

bin(L, Name) :-
    member(Name, L),
    grade(Name, _, 2).

binar(G, N) :-
    group(G, L),
    findall(Name, bin(L, Name), All),
    rem_dup(All, Aln),
    length(Aln, N).


print_binar(G) :-
	elem(G,Group),
	binar(Group, Num),
	write('group: '), write(Group), write(' failed: '), write(Num), nl, fail.

second :-
	findall(X,student(X,_),L),
	rem_dup(L,G),
	print_binar(G),
	!.

