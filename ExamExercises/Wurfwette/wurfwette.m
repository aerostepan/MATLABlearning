%% Methode 1 ohne Parameterbegrenzung x und alpha
% erneute Gobal definition (glaube nicht umbedingt nötig)
global v0i h0i v0 Koerpergr
%Betrag vo aus Angabe
v0=15;
%Festlegung Körpergröße falls nicht angegeben
Koerpergr=1.80;

% [Berechnung des Maximalen x dass die Abwurfhöhe positiv ist (für die
%Alternative Methode]
x_limits=(Koerpergr/(0.1))^0.5;

%Guess Vektoren für ersten Durchgang [x; alpha]
V_Guess=[2;40];

%Achtung bevor der Optimierung noch Checken ob alle Solver Einstellungen,
%Alle Output einstellungen und alle Scopes richtig Eingestellt sind

%Parameter so aussuchen dass Wurfweite maximal wird (Maximum=-Minimum)

[Optim_Vec_found, neg_Wurfmaximum]=fminsearch(@(In_Vec) wurfwettefunc(In_Vec),V_Guess);
format compact
Optimal_x=Optim_Vec_found(1)
Optimal_alpha=Optim_Vec_found(2)
Maximale_Wurfweite=-neg_Wurfmaximum



