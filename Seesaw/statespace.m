%specifications
Rm = 2.6; %Ohm
Kt = 0.00767; %Nm/A
Km = 0.00767; %V/(rad/s)
Kg = 3.71; % gear ratio, output is slower
eta_m = 1; % motor efficiency
eta_g = 1; % gearbox efficiency
Mc = 0.52; % kg cart mass
Msw = 3.6; % kg seesaw mass
Jsw = 0.3950; % kg m^2 moment of inertia 
Dt = 0.1250; % m distance from pivot to track
Dc = 0.058; % m distance from pivot to center of gravity seesaw
r = 0.00635; % m radius of output gear
g = 9.81; % m/s^2 acceleration of gravity
Beq = 0.9; % Nms/rad equivalent viscous damping coefficient seen at motor pinion
Bsw = 0; % Nms/rad viscous damping coefficient seen from seesaw pivot

a31 = -Mc*Dt*g/Jsw;
a32 = -(g*Mc*Rm*r^2*Jsw+Mc*Dt*Rm*r^2*g*Msw*Dc)/(Rm*r^2*Jsw*Mc);
a33 = (-Jsw*eta_g*Kg^2*eta_m*Kt*Km-Jsw*Beq*Rm*r^2-Mc*Dt^2*eta_g*Kg^2*eta_m*Kt*Km-Mc*Dt^2*Beq*Rm*r^2)/(Rm*r^2*Jsw*Mc);
a34 = -(Dt*Bsw)/Jsw;
a41 = -(g*Mc)/Jsw;
a42 = (g*Msw*Dc)/Jsw;
a43 = -(eta_g*Kg^2*eta_m*Kt*Km*Dt+Beq*Rm*r^2*Dt)/(Rm*r^2*Jsw);
a44 = -Bsw/Jsw;
b3 = (Jsw*eta_g*Kg*eta_m*Kt*r+Mc*Dt^2*eta_g*Kg*eta_m*Kt*r)/(Rm*r^2*Jsw*Mc);
b4 = (eta_g*Kg*eta_m*Kt*Dt)/(r*Rm*Jsw);

A = [0,0,1,0;
    0,0,0,1;
    a31, a32, a33, a34;
    a41, a42, a43, a44];
B = [0;0;b3;b4];

C = [1,0,0,0;
    0,1,0,0];
D = [0;0];
sys = ss(A,B,C,D);
