% coronavirus/4 

%           country     infection  deaths  recoveries
coronavirus(usa,        99681448, 1098387, 97251592).
coronavirus(india,      44661516,  530509, 44116492).
coronavirus(brazil,     34897510,  688444, 34085759).
coronavirus(uk,         23930041,  194704, 23602927).
coronavirus(russia,	21468271,  390649, 20860277).
coronavirus(turkey,     16919638,  101203, 16818435).
coronavirus(france,     36971727,  157429, 36198265).
coronavirus(iran,        7558502,  144600,  7333139).
coronavirus(spain,      13529643,  115239, 13313832).
coronavirus(southkorea, 25919183,   29420, 25214865).
coronavirus(italy,      23642011,  179436, 23037464).
coronavirus(japan,      22706566,   47069, 20524855).
coronavirus(germany,    35823771,  154535, 34509500).
%           country     infection  deaths  recoveries

% population/2
population(usa,       331002651).
population(india,    1380004385).
population(brazil,    212559417).
population(uk,         67886011).
population(russia,    145964432).
population(turkey,     84339067).
population(france,     65273511).
population(iran,       83992949).
population(spain,      46754778).
population(southkorea, 51638809).

% rules
recovery_rate(Country, Rate) :- coronavirus(Country, Cases, _, Recoveries),
                                Rate is Recoveries / Cases * 100.

covid_percent(Country, Percent) :- coronavirus(Country, Cases, _, _),
                                   population(Country, Population),
				   Percent is Cases / Population * 100.

is_one_or_two(1).
is_one_or_two(2).

big_num(X) :- X > 100.

% is_integer/1
is_integer(X) :- member(X, [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]).

% equation/3 - A + B = C
equation(A, B, C) :- is_integer(A), is_integer(B), C is A + B.
equation2(A, B, C) :- C is A + B.


% Recursion:
%   f(0) = 1
%   f(n) = f(n-1) + 2n

% base case: f(0)
recfunc(0, 1).
%         f(n) =           n-1            f(n-1)       f(n-1) +   2n
recfunc(N, F) :- N > 0, N1 is N - 1, recfunc(N1, F1), F is F1 + (2 * N).


% lists & pairs
% PAIR: [ Head | Tail ]
% LIST: [] or [ Head | TailIsAList ]

% pairparts/3 - get head & tail of a pairparts
pairparts([H | T], H, T).

% is_pair/1
is_pair([_|_]).

% is_list/1
is_list([]).
is_list([_|Tail]) :- is_list(Tail).

% swap_head_tail/2
swap_head_tail([H|T], [T|H]).

% at_least_four_elements/1 - does a list have at least 4 elements?
at_least_four_elements([_,_,_,_|_]).

% third_element/2 - what is the 3rd element of a list?
third_element([_,_,Third|_], Third).

% this_is_weird/6
this_is_weird(A,B,C,D,E,[A, [B,B], [C|D], [E,E,E]]).

% add_elements/2
add_list([], 0).
add_list(H|T], Sum) :- add_list(T, TailSum), Sum is H + TailSum.

% increment_elements/2
increment([],[]).
increment([H|T], [H1 | TailIncremented]) :- H1 is H + 1, increment(T, TailIncremented).






