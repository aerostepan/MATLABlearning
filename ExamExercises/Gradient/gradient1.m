clear all
close all

syms x y
f = 0.1*x^2 + 0.2*y^2+1;
fg = gradient(f, [x y]);

f = matlabFunction(f);
fg = matlabFunction(fg);

max = 3;
S0 = randi([-max max],2,1);

u = linspace(-max,max,100);
[XX,YY] = meshgrid(u,u);
ZZ = f(XX,YY);
plot3(XX,YY,ZZ)
hold on

h1 = plot3(S0(1),S0(2),f(S0(1),S0(2)));
itermax = 1500;
etha = 0.001;

W = NaN(itermax, 3);
W(1,:)=[S0(1),S0(2),f(S0(1),S0(2))];

for k = 2:itermax
    W(k,1:2)=W(k-1,1:2)-etha*fg(W(k-1,1),W(k-1,2))';
    W(k,3)=f(W(k-1,1),W(k-1,2));
    set(h1,'XData',W(:,1),'Ydata',W(:,2),'Zdata',W(:,3))
end



