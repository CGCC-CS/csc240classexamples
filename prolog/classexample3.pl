% From practice 2 - using cuts to prevent backtracking
double([],[]) :- !.
double([H | T], [H2 | T2]) :- !, double(H, H2), double(T,T2).
double(X, Y) :- Y is X * 2.
% double([1, 2, 3], X)
% double(5, X)

% example with cut
% single_digits/2 - return single digit numbers in a list
single_digit([], []) :- !.
single_digit([H|T], [H|T1]) :- H > -10, H < 10, !, single_digit(T, T1).
single_digit([_H | T], T1) :- single_digit(T, T1).
% single_digit([5, 15, -3, 9, 12], X)

% do_some_stuff/2
%   - replace numbers with their square
%   - replace non-empty lists & pairs with the atom list
%   - remove everything else
do_some_stuff([],[]) :- !.
do_some_stuff([H|T], [H2 | TResult]) :- number(H), !, H2 is H ** 2, do_some_stuff(T, TResult).
do_some_stuff([[_|_] | T], [list | TResult]) :- !, do_some_stuff(T, TResult).
do_some_stuff([_H|T], TResult) :- do_some_stuff(T, TResult).
% do_some_stuff([1, [a, b], foo, 3, [], bar], X)

% using assert & retractall								  
:- dynamic favorite_team/1.
favorite_team(cardinals).
change_team(NewFavorite) :- retractall(favorite_tream(_)), asserta(favorite_team(NewFavorite)).
% favorite_team(X)
% change_team(dbacks)
% favorite_team(X)


% make_change/6 - makes change for any given amount (up to a dollar)
make_change(Amount, HalfDollars, Quarters, Dimes, Nickels, Pennies) :-
	member(Nickels, [20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2,1,0]),
	member(Dimes, [10, 9, 8, 7, 6, 5, 4, 3, 2,1,0]),
	member(Quarters, [4, 3, 2,1,0]),
	member(HalfDollars, [2,1,0]),
	SubTotal is ( (HalfDollars * 50) + (Quarters * 25) + (Dimes * 10) + (Nickels * 5) ), 
	SubTotal =< Amount, 
	Pennies is Amount - SubTotal,
	Pennies < 5.
% make_change(67, H, Q, D, N, P)
