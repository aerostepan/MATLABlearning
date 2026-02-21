clear; clc; close all;

%% Constants
gamma = 6.67e-11;        % gravitational constant [m^3/(kg s^2)]
RE    = 6.37e6;          % earth radius [m]
ME    = 5.97e24;         % earth mass [kg]

%% Initial parameters
m     = 120;             % mass [kg]
cDA   = 1.2;             % drag parameter [m^2]

z0 = 39000;              % initial height [m]
v0 = 0;                  % initial velocity [m/s]

y0 = [z0; v0];

%% Simulation time
tspan = [0 110];

%% Solve ODE
[t,y] = ode45(@(t,y) stratoODE(t,y,m,cDA,gamma,RE,ME), tspan, y0);

z = y(:,1);
v = y(:,2);

%% Load measurement data
load stratospp.mat   % must contain t_meas and v_meas

%% Plot velocity comparison
figure
plot(t,v,'LineWidth',2)
hold on
plot(t_meas,v_meas,'ro')
xlabel('Time [s]')
ylabel('Velocity [m/s]')
legend('Simulation','Measurement')
grid on

%% Compute cost function
J = costFunction(m,cDA,t_meas,v_meas,y0,gamma,RE,ME);
disp(['Cost function J = ',num2str(J)])

%% Parameter Optimization
p0 = [m cDA];   % initial guess

p_opt = fminsearch(@(p) costFunction(p(1),p(2),...
                     t_meas,v_meas,y0,gamma,RE,ME), p0);

m_opt   = p_opt(1);
cDA_opt = p_opt(2);

disp(['Optimized mass: ', num2str(m_opt)])
disp(['Optimized cDA: ', num2str(cDA_opt)])