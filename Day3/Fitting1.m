A = [1 -1 1; 0 0 1; 4 2 1];
B = [0; -1; 3];
x = A \ B; 
disp('The solution vector x is:');
disp(x);

X = [-1 0 2];
Y = [0 -1 3];
p2=polyfit(X,Y,2)