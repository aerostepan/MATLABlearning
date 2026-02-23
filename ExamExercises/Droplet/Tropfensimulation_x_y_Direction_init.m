
clear all
global v0 h0
v0=[7.5;0];
h0=[0;3];
%Vorher noch Solver erinstellungen Output einstellungen und Graph
%einstellungen Prüfen
out=sim('Tropfensimulation_x_y_Direction',[0 inf]);
vxy=out.xyout.signals(1).values;
hxy=out.xyout.signals(2).values;
opt_Duesen_Hoehe=abs(hxy(end,2)-hxy(1,2));
alpha=atand(vxy(end,2)/vxy(end,1));