function J = costFkt(a22)
A = [-0.65 2.2;
    -1.2 a22];
B = [-0.15;
    -15.8];
tspan = [0 10];
x0 = [0;0];

[t,x] = ode45(@(t,x) longitudinal(t,x,A,B),tspan,x0);
alpha_sim = x(:,1);
q_sim = x(:,2);
load collegue_data.mat
alpha_interp = interp1(t,alpha_sim,t_ref);
q_iterp = interp1(t,q_sim,t_ref);
J = sum((alpha_interp - alpha_ref).^2) + sum((q_interp - q_ref).^2);
end