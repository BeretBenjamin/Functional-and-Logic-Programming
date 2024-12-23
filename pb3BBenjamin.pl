/* write a predicate to generate the list of all subsets with all
 elements of a given list. Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]
*/

% combinari(l1...ln, k) =
%	[], k = 0
%	l1 U combinari(l2...ln,k-1),k>0
%	combinari(l2...ln,k),k>0

% combinari(L:list,i, K:number,i, R:list,o)

combinari(_,0,[]).
combinari([H|T],K,[H|R]) :-
    K>0,
    NK is K-1,
    combinari(T,NK,R).
combinari([_|T],K,R) :-
    K>0,
    combinari(T,K,R).


% all(L:list-i, N:number-i, R:list-o)

all(L, N, R) :-
    findall(RP, combinari(L, N, RP), R).
