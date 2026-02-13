function xd = dglDroplet(~,x)

d = 0.00025;
rhow = 1000;
rhol = 1;
vAir = 10;
m = (pi*rhow*d^3)/6;
a = (pi*d^2)/4;
vDrop = x(2);
vRel = vAir - vDrop;

Re = 15.5 * vRel;

if Re < 10
    Cw = Re/24;
else
    Cw = 0.47;

end


xd = [x(2);
    (rhol*a*Cw*vRel*abs(vRel))/(2*m)];

end
