load('references_08.mat')
load 'discrete_linearized_tustin.mat';
%% full system (dlqr not usable)
A = sysd.A;
B = sysd.B;
C = sysd.C;
D = sysd.D;
Qx = 1e4;
Qy = 1e4;
Qz = 1e6;
Q = diag([Qx,Qy,Qz,ones(1,9)*0.1]);
R = eye(4)*10000;
K = dlqr(A,B,Q,R);


