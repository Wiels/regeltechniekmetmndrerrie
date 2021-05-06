clear;
load('references_08.mat')
load 'sysaug.mat';
%% 
% A = sysaug.A;
% B = sysaug.B;
% C = sysaug.C;
% D = sysaug.D;
Qxi = 1;
Qyi = 1;
Qzi = 1;
Qvxi = 1;
Qvyi = 1;
Qvzi = 1;
Qx = 1;
Qy = 1;
Qz = 1;
Qvx = 1;
Qvy = 1;
Qvz = 1;
others = ones(1,6);
Q = diag([Qxi,Qyi,Qzi,Qvxi,Qvyi,Qvzi,Qx,Qy,Qz,Qvx,Qvy,Qvz,others]);
R = 1*eye(4);
Kfull = dlqr(sysaug.A,sysaug.B,Q,R);
Ki = Kfull(:,1:3);
Ks = Kfull(:,7:18);
