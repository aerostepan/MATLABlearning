V = [0 10 20 30 40 50 60]; %Velocity
D = [0 5 20 46 70 102 153]; %Distance
p2 = polyfit(D, V, 2);
V_fit = polyval(p2, D);

d_limit = 60;
v_limit = polyval(p2, d_limit)

plot(V_fit,D)
xlabel('Speed')
ylabel('Distance')
hold on;
plot(v_limit,d_limit, 'r*')