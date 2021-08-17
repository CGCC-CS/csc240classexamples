% do_some_stuff
%   - replace numbers with their square
%   - replace lists with the atom list
%   - remove everything else
do_some_stuff([],[]) :- !.
do_some_stuff([H|T],[H2|TResult]) :- number(H), !, H2 is H ** 2, do_some_stuff(T, TResult).
do_some_stuff([ [_|_] | T ], [list | TResult]) :- !, do_some_stuff(T,TResult).
do_some_stuff([_H | T], TResult) :- do_some_stuff(T,TResult).

:- dynamic division/2.
division(nl_west, diamondbacks). 
division(nl_west, giants). 
division(nl_west, padres). 
division(nl_west, rockies). 
division(al_west, rangers). 
division(al_west, angels). 
division(al_west, mariners). 
division(al_west, as). 

nl_west(Teams) :- findall(Team, division(nl_west, Team), Teams).
mlb_teams(Teams) :- findall(Team, division(_, Team), Teams).
mlb_divisions(Divisions) :- setof(Division, division(Division, _), Divisions).

:- dynamic favorite_team/1.
favorite_team(diamondbacks).
change_team(NewFavorite) :- 
	division(_, NewFavorite),
	retractall(favorite_team(_)), 
	asserta(favorite_team(NewFavorite)).

change_for_a_dollar(HalfDollars, Quarters, Dimes, Nickels, Pennies) :- 
	member(Nickels, [0, 1, 2, 3, 4, 5 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
	member(Dimes, [0, 1, 2, 3, 4, 5 6, 7, 8, 9, 10]),
	member(Quarters, [0, 1, 2, 3, 4]),
	member(HalfDollars, [0, 1, 2]),
	SubTotal is ( (HalfDollars * 50) + (Quarters * 25) + (Dimes * 10) + (Nickels * 5) ),
	SubTotal =< 100,
	Pennies is 100 - SubTotal.

