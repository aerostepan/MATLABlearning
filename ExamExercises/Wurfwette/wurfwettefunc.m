function w=wurfwettefunc(In_Vec)
x0=In_Vec(1);
alpha=In_Vec(2);



%Berechnung der Integrationsconstanten - Vektorform weil Simulinkmodel auf
%Vektorform ausgelegt
global v0i h0i v0 Koerpergr
v0i=v0*[cosd(alpha);sind(alpha)];
h0i=[x0;-0.1*x0^2+Koerpergr];

%Simulieren des Systems
out=sim('wurfwettesim');

%Herausholen der Simulierten Werte aus Simulation - Output einstellungen in
%Simulink:
%Output="xy"
xy_Werte=out.get('xy');

%Wurfweite ist letzter gespeicherter x Wert
w=xy_Werte(end,1);
