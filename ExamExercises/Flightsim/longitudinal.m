function dx = longitudinal(t,x,A,B)

alpha = x(1);
q = x(2);

if t >= 1 && t <= 1.5
    eta = -5 * pi/180;
else
    eta = 0;
end
dx = zeros(2,1);
dx(1) = A(1,1)*alpha + A(1,2)*q + B(1)*eta;
dx(2) = A(2,1)*alpha + A(2,2)*q + B(2)*eta;
end