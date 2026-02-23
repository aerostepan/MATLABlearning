clear; clc;
%% PARAMETERS
m   = 0.8;
rho = 1.227;
cw  = 0.45;
d   = 0.25;
g   = 9.81;
A = pi*(d/2)^2;
roof_height = 80*0.3048;
hZiel = roof_height - 2;
xZiel = 10;
vWind = 4;
v0 = 12;
% Send to workspace (used by Simulink blocks)
assignin('base','m',m);
assignin('base','h0', roof_height);
assignin('base','rho',rho);
assignin('base','cw',cw);
assignin('base','A',A);
assignin('base','g',g);
assignin('base','hZiel',hZiel);
assignin('base','xZiel',xZiel);
assignin('base','vWind',vWind);
%% ANGLE SWEEP
angles = -5:5:85;
figure; hold on;
xlabel('x [m]')
ylabel('y [m]')
title('Trajectories for different angles')
grid on
for alpha = angles
    vx0 = v0*cosd(alpha);
    vy0 = v0*sind(alpha);
    simOut = sim('wurfwettesim');
    pos = simOut.pos;
    x = pos(:,1);
    y = pos(:,2);
    plot(x,y)
    fprintf('Angle %3d° → Range %.2f m\n',alpha,x(end));
end
legend(string(angles) + "°")