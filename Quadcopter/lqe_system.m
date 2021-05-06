%%
load('references_08.mat')
load 'discrete_linearized_tustin.mat';
%%
B1=eye(12);
sigmasquared = 1;
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
Q=sigmasquared*eye(12);
varxyz = 2.5*10e-5;
varangles=7.57*10e-5;
R = diag([varxyz*ones(1,3),varangles*ones(1,3)]);
Qb=B1*Q*B1';
Lt = dlqr(sysd.A',sysd.C',Qb,R);
L = Lt';