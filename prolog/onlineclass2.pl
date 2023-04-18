% Recursion:
%   f(0) = 1
%   f(n) = f(n-1) + 2n

% base case: f(0)
recfunc(0,1).
%  f(n)       =    N - 1           f(n-1)        f(n-1)
recfunc(N, F) :- N1 is N - 1, recfunc(N1, F1), F is F1 + (2 * N).

% unify two aruments to the same value by using the same variable name
same(X, X).

% lists & pairs
% PAIR: [ Head | Tail ]
% LIST: [] or [ Head | TailIsAList ]

% pairparts/3 - get head & tail of a pair
pairparts([H | T], H, T).

% sample output
%    ?- pairparts([a|b], X, Y).
%    X = a,
%    Y = b.
%    
%    ?- pairparts(X, 1, 2).
%    X = [1|2].
%    
%    ?- pairparts([a,b,c,d,e],Car,Cdr).
%    Car = a,
%    Cdr = [b, c, d, e].
%    
%    ?- pairparts(List, 1, [2,3,4]).
%    List = [1, 2, 3, 4].
%    
%    ?- pairparts(1,X,Y).
%    false.
%    ?- pairparts(X, [1,2,3], [a,b]).
%    X = [[1, 2, 3], a, b].

% is_pair/1
is_pair([_|_]).

% is_list/1
is_list([]).
is_list([_|T]) :- is_list(T).

% swap_head_tail/2
swap_head_tail([H|T], [T|H]).
%sample output
%   ?- swap_head_tail([a|b],X).
%   X = [b|a].
%   
%   ?- swap_head_tail([a|b],[K|R]).
%   K = b,
%   R = a.
%   
%   ?- swap_head_tail(7,X).
%   false.

% at_least_four_element/1 - does a list have at least 4 elements?
at_least_four_elements([_,_,_,_|_]).

% third_element/2 - what is the 3rd element of a list?
third_element([_,_,Third|_], Third).

% this_is_weird
this_is_weird(A,B,C,D,E,[A,[B,B],[C|D],[E,E,E]]).

% add_list/2 - add the elements of a list together
add_list([], 0).
add_list([H|T], Sum) :- add_list(T, TailSum), Sum is H + TailSum.

% increment/2 - increment each element is list
increment([], []).
increment([H|T], [H1|TailIncremented]) :- H1 is H + 1, increment(T, TailIncremented).

% multiples_of_n/2 - get the multiples of N
multiples_of_n([], _, []).
multiples_of_n([H|T], N, [H | TailMults]) :- 0 is H mod N, multiples_of_n(T, N, TailMults).
multiples_of_n([H|T], N, TailMults) :- X is H mod N, X > 0, multiples_of_n(T, N, TailMults).

% append/3
append([], L, L).
append(L, [], L).
append([H|T], L, [H|AppendedTL] ) :- append(T, L, AppendedTL).
