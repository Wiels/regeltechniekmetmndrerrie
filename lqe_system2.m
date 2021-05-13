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
Qxi = 1e1;
Qyi = 1e1;
Qzi = 1e1;
Qx = 1e1;
Qy = 1e1;
Qz = 1e1;
Qvx = 1e1;
Qvy = 1e1;
Qvz = 1e1;
others = ones(1,6);
Q = diag([Qxi,Qyi,Qzi,Qx,Qy,Qz,Qvx,Qvy,Qvz,others]);
R = 1e1*eye(4);
Kfull = dlqr(sysaug.A,sysaug.B,Q,R);
Ki = Kfull(:,1:3)
Ks = Kfull(:,4:15);
%%
B1=eye(12);

sigmasquared = 0.1;
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
Ac2 = sysd.A-L*sysd.C;
Bc2 = [sysd.B-L*sysd.D, L];
Cc2 = eye(size(sysd.A,1));
Dc2 = zeros(size(sysd.A,1),10);
syscomp2=ss(Ac2,Bc2,Cc2,Dc2,0.05);
%second way, same result
% [M,P] = dlqe(sysd.A,eye(12),sysd.C,Q,R);
% L2 = sysd.A*M;



%% poles, seems stable?
abs(union(eig(sysd.A-sysd.B*Ks), eig(sysd.A-L*sysd.C)));







