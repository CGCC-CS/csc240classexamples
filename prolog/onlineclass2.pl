% recursion:
%   f(0) = 1 
%   f(n)=2n + f(n-1)
%       0 1
recfunc(0,1).
%                  N-1            f(n-1)          2 * N + f(n-1)
recfunc(N,F) :- N1 is N - 1, recfunc(N1, F1), F is (2 * N) + F1.

% Unify two parameters to the same value
same(X,X).

% lists & pairs
% PAIR: [ Head | Tail ]
% LIST: [] or [ Head | TailIsAList ]
pairparts([H|T], H, T). 

is_pair([_H|_T]).

is_list([]).
is_list([_H|T]) :- is_list(T).

% swap the head and the tail?
swap_head_tail([H|T], [T|H]).

% does a list have at least 4 elements?
at_least_four_elements([_, _, _, _ | _T]).

% what is the third element of a list?
third_element_is([_, _, Third | _T], Third).

% add the elements of a list together
add_list([], 0).
add_list([H|T], Sum) :- add_list(T, Tsum), Sum is H + Tsum.

% increment each element of a list
increment([], []).
increment([H|T], [H1 | Tinc]) :- H1 is H + 1, increment(T, Tinc).

% include multiples N
multiples_of_n([], _, []).
multiples_of_n([H|T], N, [H|TMultiples]) :- 0 is H mod N, multiples_of_n(T, N, TMultiples).
multiples_of_n([H|T], N, TMultiples) :- X is H mod N, X > 0, multiples_of_n(T, N, TMultiples).

% append two lists
append([], L, L).
append(L, [], L).
append([Head|Tail], List, [Head | Appended]) :- append(Tail, List, Appended).
