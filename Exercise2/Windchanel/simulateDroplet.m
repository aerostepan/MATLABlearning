clear;
clc;
x0 = [0
    1];

opts = odeset('Events','eventFkn','RelTol',1e-6,'AbsTol',1e-8);
tspan = 0:0.001:0.2;

[t, Y] = ode45(@dglDroplet, tspan, x0, opts);

subplot(2,1,1)
plot(t,Y(:,1))
xlabel('time')
ylabel('distance')

subplot(2,1,2)
plot(t,Y(:,2))
xlabel('time')
ylabel('speed')


