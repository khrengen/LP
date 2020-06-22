:- ['Khrenov.pl'].

dvourbrat(X,Y) :-
	child(X,Parents),
	child(Parents, Grandpar),
	female(Grandpar),
	child(Z,Grandpar),
	Z \= Parents,
	male(Y),
	child(Y,Z).

sister(Ch1, X):-child(Ch1, Par), child(X, Par), female(X), (Ch1\=X),!.
brother(Ch1, X):-child(Ch1, Par), child(X,Par), male(X), (Ch1\=X),!.
mother(Moth, X):-child(X,Moth), female(Moth), !.
father(Fath, X):-child(X,Fath), male(Fath), !.
son(X, Par):-child(X,Par), male(X).
daughter(X, Par):-child(X,Par), female(X).

relship(father, Fath, Ch1):-
    father(Fath, Ch1).

relship(mother, Moth, Ch1):-
    mother(Moth, Ch1).

relship(husband, Husb, Wife):-
	child(Ch1,Husb),
	child(Ch1,Wife),
	Husb \= Wife,
    male(Husb).

relship(wife, Wife, Husb):-
	child(Ch1,Husb),
	child(Ch1,Wife),
	Husb \= Wife,
    female(Wife).

relship(brother, Bro, X):-
    brother(X,Bro).

relship(sister, Sis, Y):-
    sister(Y, Sis).

relship(parent, Par, Ch1):-
    child(Ch1, Par).

relship(child, Ch1, Par):-
    child(Ch1, Par).

relship(son, Ch1, Par):-
    son(Ch1, Par).

relship(daughter, Ch1, Par):-
    daughter(Ch1, Par).

  relchain(X):-
      member(X, [father, mother, sister, brother, son, daughter, husband, wife]).

move(X,Y):-
    relship(_, X, Y).


relative_thread(X, Y, Res):-
    width_search(X, Y, Res).

relative(X, Y, Res):-
    width_search(X, Y, Res1), !,
    result(Res1, Res).

result([_],[]):-!.
result([First, Second|Tail], ResList):-
    relship(Relation, First, Second),
    ResList = [Relation|Tmp],
    result([Second|Tail], Tmp),!.

prolong([X|Tail],[New,X|Tail]):-
    move(X,New),
    not(member(New,[X|Tail])).


width_search(X, Y, P):-
    width([[X]],Y, L),
    reverse(L, P).

width([[X|T]|_], X, [X|T]).
width([P|T1], X, R):-
    findall(Z, prolong(P,Z), T),
    append(T1, T, W),
    width(W, X, R),!.

width([_|T], Y, L):-
    width(T, Y, L).