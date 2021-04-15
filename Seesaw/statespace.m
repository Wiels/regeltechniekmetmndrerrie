function sys = get_system(params)

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

C =eye(4);
D = zeros(4,1);
sys = ss(A,B,C,D);
end
