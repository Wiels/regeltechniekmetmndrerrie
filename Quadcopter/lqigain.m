clear;
load('references_08.mat')
load 'discrete_linearized_tustin.mat';
%% full system (dlqr not usable)
A = sysd.A;
B = sysd.B;
C = sysd.C;
D = sysd.D;
Qx = 1;
Qy = 1;
Qz = 1000000000;
Qvx = 1;
Qvy = 1;
Qvz = 1000000000;
Qphi = 1;
Qtheta = 1;
Qpsi = 1;
Qox = 1;
Qoy = 1;
Qoz= 1;
Q = diag([Qx,Qy,Qz,Qvx,Qvy,Qvz,Qphi,Qtheta,Qpsi,Qox,Qoy,Qoz]);
R = 10000000000*eye(4);
K = dlqr(A,B,Q,R);

