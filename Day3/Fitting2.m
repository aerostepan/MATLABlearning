X = [-4:0.1:4];
Y = X.^2;

p2 = polyfit(X,Y,2);

noise = randn(size(X));
y_noisy = Y + noise;
figure
plot(X, y_noisy, '.', 'MarkerSize', 10)
hold on
grid on
p = polyfit(X, y_noisy, 2);
y_fit = polyval(p, X);
plot(X, y_fit, 'r', 'LineWidth', 2)

xlabel('x')
ylabel('y')
legend('Noisy data', 'Fitted polynomial')
title('Quadratic fit to noisy data')