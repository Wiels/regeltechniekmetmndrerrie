clear;
load('references_08.mat')
load 'discrete_linearized_tustin.mat';
X = [sysd.A - eye(12), sysd.B; sysd.C(1:3,:), sysd.D(1:3,:)];
I = [zeros(12,3); eye(3)];
N = X\I;
Nx = N(1:12,:);
Nu = N(13:end,:);
%% full system (dlqr not usable)
A = sysd.A;
B = sysd.B;
C = sysd.C;
D = sysd.D;
% Qx = 100;
% Qy = 100;
% Qz = 1000;
% Qvx = 100;
% Qvy = 100;
% Qvz = 1000;
% Qphi = 1;
% Qtheta = 1;
% Qpsi = 1;
% Qox = 1;
% Qoy = 1;
% Qoz= 1;
% Q = diag([Qx,Qy,Qz,Qvx,Qvy,Qvz,Qphi,Qtheta,Qpsi,Qox,Qoy,Qoz]);
% R = 1*eye(4);

Qx = 1;
Qy = 1;
Qz = 100000;
Qvx = 1;
Qvy = 1;
Qvz = 1;
Qphi = 1;
Qtheta = 1;
Qpsi = 1;
Qox = 1;
Qoy = 1;
Qoz= 1;
Q = diag([Qx,Qy,Qz,Qvx,Qvy,Qvz,Qphi,Qtheta,Qpsi,Qox,Qoy,Qoz]);
R = 40*eye(4);
K = dlqr(A,B,Q,R);
