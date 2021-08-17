% coronavirus/4 country  # of cases  # of deaths # of recoveries
coronavirus(unitedstates,10421956,244448,6552610).
coronavirus(spain,1426602,39345,1073577).
coronavirus(italy,960373,41750,345298).
coronavirus(india,8591075,127104,7957206).
coronavirus(france,1807479,30793,129735).

% population/2
population(unitedstates,331002651).
population(spain,46754778).
population(italy,60451826).
population(germany,83783942).
population(france,65273511).

% Rules
recovery_rate(Country, Rate) :- coronavirus(Country, Cases, _, Recoveries),
                                Rate is Recoveries / Cases * 100.
mortality(Country, Rate) :- coronavirus(Country, Cases, Deaths, _),
                            Rate is Deaths / Cases * 100.
covid_percent(Country, Percent) :- coronavirus(Country, Cases, _, _),
                                   population(Country, Population),
                                   Percent is Cases / Population * 100.

% same/2 - if two variables should have the same value, use the same name!
same(A, A).

% Rule - increment/2
increment(X, X1) :- X1 is X + 1.

% Rule - is_integer/1
is_integer(X) :- member(X, [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]).

% equation A + B = C
equation(A, B, C) :- is_integer(A), is_integer(B), C is A + B.


