/*
 5. a
 Substitute all occurrences of an element of a list with all the elements
 of another list

    subst(L,elem,X)
      = [], if L=[]
      = X U subst(l2,l3...,ln;elem;X), if l1 = elem
      = l1 U subst(l2,l3,...,ln;elem;X), if l2 =! elem

      subst(L : List - input ; elem - integer - input ; X - List - input
      ; R - List - output)

      conc(L - list,input; R-List,input; R-list,output)

      conc(L,R,R)
       =R, if L=[]
       =L1 U conc(l2,l3,...ln,R,R), otherwise

*/
conc([],R,R).
conc([H|T],R,[H|TR]):-
     conc(T,R,TR).



subst([],E,X,R):-
    R=[].
subst([H|T],E,X,R):-
    H=:=E,
    !,
    conc(X,R2,R),
    subst(T,E,X,R2).
subst([H|T],E,X,[H|R]):-
    subst(T,E,X,R).

/*
b. For a heterogeneous list, formed from integer numbers and list of numbers, replace in every sublist all
occurrences of the first element from sublist it a new given list.

    ifList(L)
    =true, if L is a list
    =true, if L is a nonempty list
    =false, otherwise

    ifList(L ; List - input)

    getFirst([l1,l2,...,ln])
    =elem, if L is empty
    =l1, otherwise

    getFirst(L : list, input ; elem : integer, output)

    replace(L,X,R)
    =[], if L is empty
    = subst(l1,l1.1,X,R) U replace(l2,l3,...,ln ; X, R), if l1 is List
    = l1 U replace(l2,l3,...,ln ; X, R), otherwise

    replace(L:list,input;X:list,input;R:list,output)

*/



isList([]):-true.
isList([_|_]):-true.

getFirst([],_).
getFirst([H|T],E):-
    E is H.


replace([],_,[]).
replace([H|T],X,[HR|R]):-
     isList(H),
     !,
     getFirst(H,E),
     subst(H,E,X,HR),
     replace(T,X,R).
replace([H|T],X,[H|R]):-
     replace(T,X,R).






