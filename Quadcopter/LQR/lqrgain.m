clear;
load('references_08.mat')
load 'discrete_linearized_tustin.mat';
%% full system (dlqr not usable)
A = sysd.A;
B = sysd.B;
C = sysd.C;
D = sysd.D;
Qx = 100;
Qy = 100;
Qz = 1000;
Qvx = 100;
Qvy = 100;
Qvz = 1000;
Qphi = 1;
Qtheta = 1;
Qpsi = 1;
Qox = 1;
Qoy = 1;
Qoz= 1;
Q = diag([Qx,Qy,Qz,Qvx,Qvy,Qvz,Qphi,Qtheta,Qpsi,Qox,Qoy,Qoz]);
R = 1*eye(4);
K = dlqr(A,B,Q,R);
