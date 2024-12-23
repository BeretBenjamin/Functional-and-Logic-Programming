/*Multiply elements of a list with a constant k*/
/*mullist(l1,l2,...,k)=0 if the list is empty
                        l1 if k intersected with mullist(l1,l2,..ln)
                        []=empty list
                        [H|T] = [Head|Tail]*/
% mulk(L-list,K-number,R-return list)
% flow model(i,i,o)
mulk([], _,[]).
mulk([H|T],K,R):-
    mulk(T,K, Res2),
    NewH is H*K,
    R=[NewH|Res2].

/* Insert an element at the end of the list
insertE(11,..,ln,E) = [E], n=0
                       l1, insertE(l2,..,,ln,E) otherwise */

%insertE(L-list,E-elem,R-result list
%flow model (i,i,o) (i,i,i)
insertE([], E, [E]).
insertE([H|T], E, [H|TR]):-
    insertE(T, E, TR).

/* sum of a list */

%suma(L-list, S:- sum)
%flow model (i,o) (i,i)
suma([], 0).
suma([H|T], S):-
    suma(T, TS),
    S is H + TS.
/* add an element E on position M in a list
inserOnM(l1,,...,ln,E,M)=[E], m=1 and L = []
                         [], M>l and L=[]
                         E U L if M=l and L<>[]
                         insertOnM(l2,...,ln,E,M-l), if M>l and L<>[]*/
%insertOnM(L-list,E-elem,M-position,R-result list)
%flow model(i,i,i,o) (i,i,i,i)
insertOnM([],E,l,[E]).
insertOnM([],  _,M,[]):-M>1.
insertOnM([H|T],E,l, [E,H|T]).
insertOnM([H|T],E,M,R):-
    M>l,
    NewM is M-l,
    insertM(T,E,NewM,RT),
    R =[H|RT].



