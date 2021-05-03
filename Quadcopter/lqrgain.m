clear;
load 'discrete_linearized_tustin.mat';
%% full system (dlqr not usable)
A = sysd.A;
B = sysd.B;
C = sysd.C;
D = sysd.D;
Q = eye(12)*0.01;
R = diag([10,10,1,10]);
K = dlqr(A,B,Q,R);