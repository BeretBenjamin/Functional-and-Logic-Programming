
is_valley([]).

is_valley([_]).

is_valley([H | T]) :-
    valley_check(T, H).

valley_check([], _).

valley_check([H | T], Prev) :-
    H < Prev,
    decreasing_sequence(T, H),
    increasing_sequence(T).

decreasing_sequence([], _).

decreasing_sequence([H | T], Prev) :-
    H < Prev,
    decreasing_sequence(T, H).

increasing_sequence([H | T]) :-
    increasing_sequence(T, H).

increasing_sequence([], _).

increasing_sequence([H | T], Prev) :-
    H > Prev,
    increasing_sequence(T, H).
