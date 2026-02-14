function ydot = dgl_rocket(t,y)

h = y(1); % Hˆhe
v = y(2); % Geschwindigkeit
m = y(3); % Masse 

% Daten
cW=0.65;
A=1.2;


mp0    = 40;     % nomineller Massenstrom kg/s
vg     = 1800;   % Gasgeschwindigkeit m/s
mempty = 400;    % Leermasse in kg

gamma=6.6742e-11;   % Gravitationskonstante
RE=6370000;         % Erdradius
ME=5.9736e24;       % Erdmasse

g = gamma*ME/(RE+h)^2;
rho = 1.29 * exp(-h/8000);

mp = mp0 * (m > mempty);

ydot  =  [v; 
          ( mp * vg - cW * A * rho * v * abs(v)/2 ) / m - g;
          -mp];

