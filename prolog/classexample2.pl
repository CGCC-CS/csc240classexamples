% Recursion:
%   f(0) = 1
%   f(n) = f(n-1) + 2n

% base case: f(0)
recfunc(0, 1).
%         f(n) =                            f(n-1)        f(n-1) + 2n
recfunc(N, F) :- N > 0, N1 is N - 1,  recfunc(N1, F1),  F is F1 + (2 * N).

% lists & pairs
% PAIR: [ Head | Tail ]
% LIST: [] or [ Head | TailIsAList ]

% pairparts/3 - get head & tail of a pairparts
pairparts([H | T], H, T).

% sample output
% ?- pairparts([a|b], a, b).
% true.
% 
% ?- pairparts([1,2,3], 1, [2,3]).
% true.
% ?- pairparts([1|2], X, Y).
% X = 1,
% Y = 2.
% 
% ?- pairparts([a,b,c,d], H, T).
% H = a,
% T = [b, c, d].
% 
% ?- pairparts([1,2,3,4], Car, Cdr).
% Car = 1,
% Cdr = [2, 3, 4].
% 
% ?- pairparts(List, h, t).
% List = [h|t].
% 
% ?- pairparts(1, X, Y).
% false.
% 
% ?- pairparts([x,y,z], x, Y).
% Y = [y, z].
% 
% ?- pairparts([a,b,c,d], x, Y).
% false.
% 
% ?- pairparts(X, [1,2,3], [a,b,c]).
% X = [[1, 2, 3], a, b, c].

% is_pair/1
is_pair([_|_]).

% ?- is_pair(x).
% false.
% 
% ?- is_pair(Y).
% Y = [_|_].
% 
% ?- is_pair([a|b]).
% true.
% 
% ?- is_pair([a,b]).
% true.
% 
% ?- is_pair([]).
% false.
% 
% ?- is_pair([a,b,c,d]).
% true.

% is_list/1
is_list([]).
is_list([_|T]) :- is_list(T).

% swap_head_tail/2
swap_head_tail([H|T], [T|H]).

% ?- swap_head_tail([1,2,3,4,5],X).
% X = [[2, 3, 4, 5]|1].
% 
% ?- swap_head_tail(X, [1,2,3,4,5]).
% X = [[2, 3, 4, 5]|1].
% 
% ?- swap_head_tail([a|b],X).
% X = [b|a].
% % 
% ?- swap_head_tail(X, [[a,b,c],1,2,3]).
% X = [[1, 2, 3], a, b, c].
%
% ?- swap_head_tail([a,b,c,d], [H|T]).
% H = [b, c, d],
% T = a.
% 
% ?- swap_head_tail([a|X], [Y|a]).
% X = Y.
% 
% ?- swap_head_tail(7, X).
% false.

% at_least_four_elements/1 - does a list have at least 4 elements?
at_least_four_elements([_,_,_,_|_]).

% thirst_element/2 - what is the third element?
third_element([_, _, Third|_], Third).

% this_is_wierd/6
this_is_weird(A,B,C,D,E,[A, [B,B], [C|D], [E,E,E]]).

% sum_list/2 - add the elements of a list together
add_list([],0).
add_list([H|T], Result) :- add_list(T, TailSum), Result is H + TailSum.

% increment/2 - increment each element in the list
increment([],[]).
increment([H|T], [H1|TailIncremented]) :- H1 is H + 1, increment(T,TailIncremented).

% multiples_of_n/2
multiples_of_n([], _, []).
multiples_of_n([H|T], N, [H|TailMults]) :- 0 is H mod N, multiples_of_n(T, N, TailMults).
multiples_of_n([H|T], N, TailMults) :- X is H mod N, X > 0, multiples_of_n(T, N, TailMults).

% add_neighbors/2
add_neighbors([],[]).
add_neighbors([X],[X2]) :- X2 is 2 * X.
add_neighbors([H1,H2|T], [Sum|TailResult] ) :- Sum is H1 + H2, add_neighbors(T,TailResult).

% append/3
append([], L, L).
append(L, [], L).
append([H|T], L, [H|AppendedTail]) :- append(T, L, AppendedTail).