function [val,isTerminal,direction] = eventFkn(~,x)

val = x(1) - 0.6;
isTerminal = 1;
direction = 0;
