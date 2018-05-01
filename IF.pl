Verificacion para condicion sencilla:

if(i > m)
  i++
else
  i--

%if_verification______________
if(G) :-
			nl, write('Starting verifing if'), nl,
			cond(G), bodyif(G), bodyelse(G).
	
cond(G) :-
			nl, write('verifing conditions'), nl,
			condelement(G,A),
            condelement(G,B),
            type(G,A,B).

bodyif(G):-
            nl, write("verifing if body"), nl,
            lines(G).
			
bodyelse(G):-
            nl, write("verifing else body"), nl,
            lines(G).
			
%conditions_verification______
condelement(G,A):-
            nl, write("verifing conditions elements"), nl,
            initelement(A),
            whilecond(G,A,C,B).

%body_verification____________
bodyif (G) :- 
			typebody(G, A).
			
bodyelse (G) :- 
			typebody(G, A).
			
%facts________________________

initelement(a).
initelement(b).

ifcond(cond_1,a,'bool',b).
type(cond_1,int,int).
typebody(cond_1,int).

lines(cond_1).
