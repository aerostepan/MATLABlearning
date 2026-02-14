clear all;
close all;

tspan = [0 inf]; 

h0=0;           
v0=0;           
m0 = 1500;    

y0=[h0;
    v0;
    m0];  

optionen = odeset('Events',@groundContact,'RelTol',1e-6);

[tt,Y,TE,YE,IE] = ode45(@dgl_rocket, tspan, y0, optionen);




h = Y(:,1);   
v = Y(:,2);  
m = Y(:,3);   
 
figure(1)
subplot(3,1,1)
plot(tt,v,'-r.'), grid
xlabel('Time t in s'),ylabel('Speed in m/s'), title('Speed versus Time')
hold on
scatter(TE,YE(:,2))

 
subplot(3,1,2)
plot(tt,h/1000,'-b.'), grid
xlabel('Time t in s'),ylabel('Hˆhe in km'), title('Hˆhe versus Time')
hold on
scatter(TE,YE(:,1)/1000)


subplot(3,1,3)
plot(tt,m/1000,'-k.'), grid
xlabel('Time t in s'),ylabel('Mass in Tons'), title('Mass versus Time')
hold on
scatter(TE,YE(:,3)/1000)



