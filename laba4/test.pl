sentence(likes(agent(S),object(O))) -->
	agent_clause(S,F), verb_clause(_,F), {F=f(_,act)}, object_clause(O,_).

sentence(likes(agent(S), object(O))) -->
	object_clause(O,_), verb_clause(_,F), {F=f(_,pass)}, agent_clause(S,F).

sentence(S,R) :- sentence(R,S,[]).

agent_clause(X,F) --> agent(X,F).
agent_clause([A,'и',B], f(mn,_)) --> agent(A,_), ['и'], agent(B,_).

object_clause(X,F) --> object(X,F).


verb_clause(action(A), f(N,act)) --> verb(A,f(N, act)).
verb_clause(action(A), f(N,pass)) --> verb(A,f(N, pass)).

verb(A,f(ed,act)) --> {member(A,['любит'])}, [A].
verb(A,f(mn,act)) --> {member(A,['любят'])}, [A].
verb(A,f(_,pass)) --> {member(A, ['любим'])}, [A].

agent(S,f(ed,act)) --> {member(S, ['Саша', 'Петя', 'Лена'])}, [S].
agent(S,f(ed,pass)) --> {member(n(S,N), [n('Саша','Сашей'), n('Петя','Петей'), n('Лена','Леной')])}, [N].
object(S,f(ed,_)) --> {member(S, ['шоколад'])}, [S].

compare(A,B,Ph1,Ph2,Z) :- 
	sentence(A,Ph1),
	sentence(B,Ph2),
	synonim(A,B,Z).

synonim(A,B,Z) :- sentence(A,F), sentence(B,F), Z = 'yes'.
synonim(A,B,Z) :- sentence(A,D), sentence(B,F), D\=F, Z = 'no'.




