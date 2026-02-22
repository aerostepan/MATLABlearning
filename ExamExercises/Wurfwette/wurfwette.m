clear; clc;
g = 9.81;
m = 0.8;
cw = 0.45;
rho = 1.227;
d = 0.25;
v_up = 4;
neighbor_start = 10;
neighbor_roof = 80*0.3048 - 2;
street = 0;
v0 = 12;
angles = -5:5:85;

for alpha = angles
    
    vx0 = v0*cosd(alpha);
    vy0 = v0*sind(alpha);
    
    set_param('wurfwettesim/vx','InitialCondition',num2str(vx0));
    set_param('wurfwettesim/vy','InitialCondition',num2str(vy0));
    
    simOut = sim('your_model');
    
    x = simOut.logsout.getElement('x').Values.Data;
    range = x(end);
    
    fprintf('Angle %3d deg → Range %.2f m\n',alpha,range);
end