% coronavirus/4 
% country	infections	deaths	recoveries
coronavirus(USA,47916190,783565,37918301).
coronavirus(India,34447536,463655,33849785).
coronavirus(Brazil,21957967	611318,21151342).
coronavirus(UK,9561099,142898,7825200).
coronavirus(Russia,9109094,256597,7812557).
coronavirus(Turkey,8408166,73531,7888959).
coronavirus(France,7287645,118154,7009009).
coronavirus(Iran,6037718,128167	5695949).
coronavirus(Spain,5047156,87673,4889801).

% population/2
population(unitedstates,331002651).
population(india, 1380004385).
population(brazil, 212559417).
population(uk, 67886011).
population(russia(145964432).
population(turkey, 84339067).
population(france,65273511).
population(iran, 83992949).
population(spain,46754778).

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


