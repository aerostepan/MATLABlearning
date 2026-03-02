clear
close all
clc

A = [-0.65 2.2;
    -1.2 -1];
B = [-0.15;
    -15.8];

tspan = [0 10];
x0 = [0;0];

[t,x] = ode45(@(t,x) longitudinal(t,x,A,B),tspan,x0);
alpha = x(:,1);
q = x(:,2);

plot(t,alpha,'LineWidth',2); hold on
plot(t,q,'LineWidth',2);
legend('/alpha','q')
grid on

a22_opt = fminsearch(@costFkt, -1)
disp(['Optimal a22 = ',num2str(a22_opt)])