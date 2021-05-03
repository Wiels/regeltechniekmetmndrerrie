load 'discrete_linearized.mat';
%% full system (dlqr not usable)
A = sysd.A;
B = sysd.B;
C = sysd.C;
D = sysd.D;
Q = eye(12)*0.01;
R = diag([10,10,1,10]);
K = dlqr(A,B,Q,R);

%% with minimal (without 5,6,7 and 10)
Qx = 100;
Qy = 10;
Qz = 100;

Qmin = diag([Qx,Qy,Qz,ones(1,5)*0.01]);
Rmin = eye(4)*1000;
Kmin = dlqr(sysmin.A,sysmin.B,Qmin,Rmin);