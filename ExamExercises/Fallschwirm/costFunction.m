function J = costFunction(m,cDA,t_meas,v_meas,y0,gamma,RE,ME)
tspan = [t_meas(1) t_meas(end)];
[t,y] = ode45(@(t,y) stratoODE(t,y,m,cDA,gamma,RE,ME), tspan, y0);
v_sim = interp1(t,y(:,2),t_meas);
J = sum((v_sim - v_meas).^2);
end