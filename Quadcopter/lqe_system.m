%%
clear
load('references_08.mat')
load 'discrete_linearized_tustin.mat';
load 'sysaug.mat';
%% 
% A = sysaug.A;
% B = sysaug.B;
% C = sysaug.C;
% D = sysaug.D;
Qxi = 1;
Qyi = 1;
Qzi = 100;
Qx = 1000;
Qy = 1000;
Qz = 1000;
Qvx = 1;
Qvy = 1;
Qvz = 100;
others = ones(1,6);
Q = diag([Qxi,Qyi,Qzi,Qx,Qy,Qz,Qvx,Qvy,Qvz,others]);
R = 0.7*eye(4);
Kfull = dlqr(sysaug.A,sysaug.B,Q,R);
Ki = Kfull(:,1:3);
Ks = Kfull(:,4:15);
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
Ac = sysd.A-sysd.B*Ks-L*sysd.C;
Bc = L;
Cc = -Ks;
Dc = zeros(4,6);
syscomp=ss(Ac,Bc,Cc,Dc,0.05);
%second way, same result
% [M,P] = dlqe(sysd.A,eye(12),sysd.C,Q,R);
% L2 = sysd.A*M;



%% poles, seems stable?
abs(union(eig(sysd.A-sysd.B*Ks), eig(sysd.A-L*sysd.C)));


