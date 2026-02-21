clear all
close all

syms x y

% Function definition
f_sym = sin(2*sqrt(x^2 + y^2)) + x^2 + 2*y^2 + 0.15*y^3;
grad_sym = gradient(f_sym,[x y]);

% Convert to numeric functions
f  = matlabFunction(f_sym);
fg = matlabFunction(grad_sym);

% Random start in [-6,6]
max = 6;
S0 = -max + 2*max*rand(2,1);

% Plotting grid
u = linspace(-max,max,200);
[XX,YY] = meshgrid(u,u);
ZZ = f(XX,YY);

figure
surf(XX,YY,ZZ,'EdgeColor','none')
hold on
colormap turbo
view(3)

% Plot start point
h1 = plot3(S0(1),S0(2),f(S0(1),S0(2)),'r','LineWidth',2);

% Parameters
itermax = 500;
alpha = 0.01;     % step size
beta  = 0.8;      % momentum parameter

% Memory allocation
W = NaN(itermax,3);
W(1,:) = [S0(1), S0(2), f(S0(1),S0(2))];

g_prev = [0;0];   % initial momentum

for k = 2:itermax
    
    grad_val = fg(W(k-1,1), W(k-1,2));
    
    % Momentum update
    g_new = beta*g_prev + grad_val;
    
    % Position update
    w_new = W(k-1,1:2)' - alpha*g_new;
    
    % Store results
    W(k,1:2) = w_new';
    W(k,3)   = f(w_new(1), w_new(2));
    
    % Update momentum
    g_prev = g_new;
    
    % Update plot
    set(h1,'XData',W(1:k,1), ...
           'YData',W(1:k,2), ...
           'ZData',W(1:k,3));
    
    drawnow
end