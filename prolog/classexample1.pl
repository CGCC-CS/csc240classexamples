% Facts

% coronavirus/4 
%           country     infection  deaths  recoveries
coronavirus(usa,        99681448, 1098387, 97251592).
coronavirus(india,      44661516,  530509, 44116492).
coronavirus(brazil,     34897510,  688444, 34085759).
coronavirus(uk,         23930041,  194704, 23602927).
coronavirus(russia,	    21468271,  390649, 20860277).
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

% Rules
recovery_rate(Country, Rate) :- coronavirus(Country, Cases, _, Recoveries),
	                            Rate is Recoveries / Cases * 100.

mortality(Country, Rate) :- coronavirus(Country, Cases, Deaths, _),
	                        Rate is Deaths / Cases * 100.

covid_percent(Country, Percent) :- coronavirus(Country, Cases, _, _), 
	                               population(Country, Population),
								   Percent is Cases / Population * 100.


% is_one_or_two/2 : is a parameter 1 or 2?
is_one_or_two(1).
is_one_or_two(2).

% is_seven/1
is_seven(7).

% big_num/1 : is a number greater than 100
big_num(X) :- X > 100.

% increment/2
increment(X, X1) :- X1 is X + 1.

% is_integer/1
is_integer(X) :- member(X, [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]).

% same/x : if two variables have the same value, use the same name!
same(A, A).

% Example:
% ?- same(a,b).
% false.
% 
% ?- same(a,a).
% true.
% 
% ?- A is 4 / 2, B is 1 + 1, same(A,B).
% A = B, B = 2.

% equation/3 - A + B = C
equation(A, B, C) :- is_integer(A), is_integer(B), C is A + B.

% ?- equation(3,4,X).
% X = 7 .
% 
% ?- equation(3,9,7).
% false.
% 
% ?- equation(7,X,13).
% X = 6 .
% 
% ?- equation(Y,4,9).
% Y = 5 .
% 
% ?- equation(X,Y,3).
% X = 0,
% Y = 3 ;
% X = 1,
% Y = 2 ;
% X = 2,
% Y = 1 ;
% X = 3,
% Y = 0 ;
% false.

% Recursion:
%   f(0) = 1
%   f(n) = f(n-1) + 2n

% base case: f(0) =0
recfunc(0,1).
%       f(n)   =           N - 1         f(n-1)           f(n-1) + 2n
recfunc(N, F) :- N > 0,  N1 is N - 1, recfunc(N1, F1), F is F1 + (2 * N).

% Example expert system
animal(X) :- mammal(X).
animal(X) :- bird(X).
animal(X) :- reptile(X).

mammal(X) :- has_fur(X), warm_blooded(X).
bird(X) :- has_feathers(X), lays_eggs(X).
reptile(X) :- has_scales(X), cold_blooded(X).

% facts about animals
has_fur(dog).
has_fur(cat).
warm_blooded(dog).
warm_blooded(cat).
has_feathers(eagle).
lays_eggs(eagle).
has_scales(snake).
cold_blooded(snake).

% ?- animal(dog).
% true .
% 
% ?- mammal(cat).
% true.
% 
% ?- reptile(cat).
% false.
% 
% ?- reptile(snake).
% true.
% 
% ?- mammal(X).
% X = dog ;
% X = cat.
% 
% ?- animal(Y).
% Y = dog ;
% Y = cat ;
% 
% ?- animal(Y).
% Y = dog ;
% Y = cat ;
% Y = eagle ;
% Y = snake.

% lists & pairs
% PAIR: [Head | Tail]
% LIST: [] or [Head | TailIsAList]

% pairparts/3 : get head & tail of a pair
pairparts([H|T], H, T).

% % ?- pairparts([a|b], H, T).
% H = a,
% T = b.
% 
% ?- pairparts(X, c, d).
% X = [c|d].
% 
% ?- pairparts([1,2,3,4,5,6], H, T).
% H = 1,
% T = [2, 3, 4, 5, 6].
% 
% ?- pairparts(X, [1,2,3], [4,5,6]).
% X = [[1, 2, 3], 4, 5, 6].
% 
% ?- pairparts(a,b,c).
% false.

