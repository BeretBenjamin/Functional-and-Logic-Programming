/*
  a Write a predicate to create a list (m, ..., n)
  of all integer numbers from the interval [m, n]

 create(a,b) =
 =[], if a > b
 = a  U create(a+1,b), otherwise


 create(M-integer,given , N-integer,given, R-list,result,output)
*/


create(M,N,[]):-
    M>N,
    !.
create(M,N,[M|R]):-
    M1 is M+1,
    create(M1,N,R).

/*
  b. Write a predicate to compute the intersection of two sets

 search(l1l2...ln, elem) =
 = true, if l1 = elem
 = false, if n = 0
 = search(l2...ln, elem), otherwise

 intersection(l1l2...ln, p1p2...pm) =
 = [], if n = 0
 = {l1} U intersection(l2...ln, p1p2...pm), if search(p1p2...pm, l1) =
 true
 = intersection(l2...ln, p1p2...pm), otherwise

 intersection( L:list,input ; P:list,input ; R:list,output ).


 search(L:list,input ; E:integer,input)


    */



%search(i,i)
search([H|_],EL):-
    H=:=EL,!.
search([_|T],EL):-
    search(T,EL).

intersection([],[],[]).
intersection([],B,[]):-!.
intersection(A,[],[]):-!.
intersection([H|T],B,[H|R]):-
    search(B,H),
    !,
    intersection(T,B,R).
intersection([_|T],B,R):-
    intersection(T,B,R).
