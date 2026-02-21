function dydt = stratoODE(~,y,m,cDA,gamma,RE,ME)

z = y(1);
v = y(2);

% Air density
rho = 1.28 * exp(-z/7975);

% Gravity
g = gamma*ME/(RE + z)^2;

% Equation of motion
dzdt = v;
dvdt = -g - (cDA/m) * rho * abs(v)*v / 2;

dydt = [dzdt; dvdt];

end