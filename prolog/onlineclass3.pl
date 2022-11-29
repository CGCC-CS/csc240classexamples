% do_some_stuff
%   - replace numbers with their square
%   - replace lists & pairs with the atom list
%   - remove everything else

do_some_stuff([], []) :- !.
do_some_stuff([H|T], [H2|TResult]) :- number(H), !, H2 is H * H, do_some_stuff(T, TResult).
do_some_stuff([[_|_] | T], [list|TResult ]) :- !, do_some_stuff(T, TResult).
do_some_stuff([_H | T], TResult) :- do_some_stuff(T, TResult).

% Using assert & retractall
:- dynamic favorite_team/1.
favorite_team(cardinals).
change_team(NewFavorite) :- retractall(favorite_team(_)), assertz(favorite_team(NewFavorite)).

% make_change/6
make_change(Amount, HalfDollars, Quarters, Dimes, Nickels, Pennies) :-
	member(HalfDollars, [2,1,0]),
	member(Quarters, [4,3,2,1,0]),
	member(Dimes, [10,9,8,7,6,5,4,3,2,1,0]),
	member(Nickels, [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0]),
	SubTotal is ( (HalfDollars * 50) + (Quarters * 25) + (Dimes * 10) + (Nickels * 5)),
	SubTotal =< Amount,
	Pennies is Amount - SubTotal.

