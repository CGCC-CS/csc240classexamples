% recursion:
%   f(0) = 1 
%   f(n) = 2n + f(n-1)

% f(0)=1
recfunc(0,1).
%   f(n)     =     N-1       f(n-1)                   2n    + f(n-1)
recfunc(N, F) :- N1 is N - 1, recfunc(N1, F1),  F is (2 * N) + F1.

% unify two arguments to same value - use the same var name!
same(X,X).

% lists & pairs
% PAIR: [ Head | Tail ]
% LIST: [] or [ Head | TailIsAList ]

% pairparts/3 - get head & tail of a pair
pairparts([H|T], H, T).
% sample output
%    ?- pairparts([1|b],X,Y).
%    X = 1,
%    Y = b.
%    
%    ?- pairparts(X, 2, 3).
%    X = [2|3].
%    
%    ?- pairparts([1,2,3,4],Car,Cdr).
%    Car = 1,
%    Cdr = [2, 3, 4].
%    
%    ?- pairparts(Pair, 1, 2).
%    Pair = [1|2].
%    
%    ?- pairparts(List, a, [b,c,d]).
%    List = [a, b, c, d].
%
%    ?- pairparts(1, X, Y).
%    false.

% is_pair/1
is_pair([_|_]).

% is_list/1
is_list([]).
is_list([_|T]) :- is_list(T).

% swap_head_tail/2
swap_head_tail([H|T], [T|H]).

% at_least_four_elements/1 - does a list have at least 4 elements?
at_least_four_elements([_,_,_,_|_]).

% third_element/2 - what is the 3rd elements in a list?
third_element([_,_,Third|_], Third).

% add_list/2 - add the elements of a list together
add_list([],0).
add_list([H|T], Sum) :- add_list(T, TailSum), Sum is H + TailSum.

% increment/2 - increment each element of a list
increment([],[]).
increment([H|T], [H1|TailIncremented]) :- H1 is H + 1, increment(T, TailIncremented).

% multiples_of_n/3 - get the multiples of N
multiples_of_n([], _, []).
multiples_of_n([H|T], N, [H|TailMultiples]) :- 0 is H mod N, multiples_of_n(T, N, TailMultiples).
multiples_of_n([H|T], N, TailMultiples) :- X is H mod N, X>0, multiples_of_n(T, N, TailMultiples).

% append/3
append([], L, L).
append(L, [], L).
append([H|T], L, [H|Appended]) :- append(T, L, Appended).
