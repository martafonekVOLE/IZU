% Zadání č. 40:
% Napište program řešící úkol daný predikátem u40(LIN), kde LIN je vstupní 
% celočíselný seznam s nejméně dvěma čísly. Predikát je pravdivý (má hodnotu 
% true), pokud se v seznamu LIN pravidelně střídají lichá a sudá čísla, 
% jinak je nepravdivý (má hodnotu false).

% Testovací predikáty:
u40_1:- u40([4,-3,2,1,8,3,8,-1]).			% true
u40_2:- u40([4,-3,2,1,8,4,8,-1]).			% false
u40_3:- u40([-3,2]).					% true
u40_r:- write('Zadej LIN: '),read(LIN),u40(LIN).

u40(LIN):-u40_checkValidity(LIN).

%Ověření sudosti
even(X) :- 
    X mod 2 =:= 0.

%Ověření lichosti
odd(X) :- 
    X mod 2 =:= 1.

u40_checkValidity([]).

%Rekurzivní kontrola střídání
u40_checkValidity([H|T]) :- even(H), u40_odd(T).
u40_checkValidity([H|T]) :- odd(H), u40_even(T).

%První číslo musí být liché, zbytek zkontroluj v u40_even
%Validní i tehdy, pokud je to poslední prvek seznamu
u40_odd([H|T]) :- odd(H), u40_even(T).
u40_odd([]).

%První číslo musí být sudé, zbytek zkontroluj v u40_odd
%Validní i tehdy, pokud je to poslední prvek seznamu
u40_even([H|T]) :- even(H), u40_odd(T).
u40_even([]).
