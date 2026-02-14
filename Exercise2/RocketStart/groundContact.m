function [wert,isterminal,direction] = groundContact(t,y)
 
wert(1) = y(1);    % Hˆhe ==0
isterminal(1) = 1; % Abbruch wenn wert = 0
direction(1) = -1;   

wert(2) = abs(y(2))-75;    % v==75
isterminal(2) = 0; % Abbruch wenn wert(2) == 0
direction(2) = 0;   

wert(3) = y(2);    % v==0
isterminal(3) = 0; % Abbruch wenn wert(3) == 0
direction(3) = -1;   
