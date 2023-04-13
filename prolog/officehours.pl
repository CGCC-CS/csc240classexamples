% recursive function:
%     f(0) = 1
%     f(n) = 2 * f(n-1) + 5
func(0,0).  % base case 
func(N, Result) :- N1 is N - 1, func(N1, ResultN1), Result is (2 * ResultN1) + 5.
          %            n-1           f(n-2)                     2 * f(n-1) + 5

% lists
% 2 times the first element in a list
two_times_first([H|_], Result) :- Result is 2 * H.
two_times_first(X, Result) :- Result is 2 * X.

% give me an 8
% give_me_an_8(X) :- X == 8.
give_me_an_8(8).

% facts
grade(drew, 60).
grade(sarah, 95).
grade(rachel, 78).
grade(liam, 88).

teachers_pet(xyz).
teachers_pet(liam).
teachers_pet(rachel).

pass(john).
pass(X) :- grade(X, Y), Y > 79.
pass(X) :- teachers_pet(X).

always(_).