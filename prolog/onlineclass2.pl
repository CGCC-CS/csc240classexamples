% recursion:
%   f(0) = 1 
%   f(n) = 2n + f(n-1)
%    f(0)=1
recfunc(0,1).
%                 N-1            f(n-1)            2 * n + f(n-1)
recfunc(N,F) :- N1 is N - 1, recfunc(N1,F1), F is (2 * N) + F1.

% unify two arguments to same value
same(X,X).

% lists & pairs
% PAIR: [ Head | Tail ]
% LIST: [] or [ Head | TailIsAList ]

pairparts([H|T], H, T).
% Sample output:
% ?- pairparts([1,2,3,4],Car, Cdr).
% Car = 1,
% Cdr = [2, 3, 4].
%
% ༀ?- pairparts(Pair, 1, 2).
% Pair = [1|2].
% 
% ?- pairparts(List, a, [b,c,d]).
% List = [a, b, c, d].

is_pair([_H|_T]).

is_list([]).
is_list([_|T]) :- is_list(T).

swap_head_tail([H|T], [T|H]).

% does a list have at least 4 elements?
at_least_four_elements([_,_,_,_|_T]).

% what is the third element of a list?
third_element([_,_,Third | _T], Third).

% add the elements of a list together
add_list([],0).
add_list([H|T], Sum) :- add_list(T, TSum), Sum is H + TSum.

% increment/2 - increment each element of a list
increment([],[]).
increment([H|T], [H1|TInc]) :- H1 is H + 1, increment(T, TInc).

% multiples_of_n/3 - get the multiples of N
multiples_of_n([],_,[]).
multiples_of_n([H|T], N, [H|TMultiples]) :- 0 is H mod N, multiples_of_n(T, N, TMultiples).
multiples_of_n([H|T], N, TMultiples) :- X is H mod N, X>0, multiples_of_n(T, N, TMultiples).

% append/3 - append two lists
append([],L,L).
append(L,[],L).
append([H|T], L, [H|Appended]) :- append(T, L, Appended).
