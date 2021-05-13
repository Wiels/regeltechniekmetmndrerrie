clear;
load('references_08.mat')
load 'sysaug.mat';
%% 
% A = sysaug.A;
% B = sysaug.B;
% C = sysaug.C;
% D = sysaug.D;
Qxi = 100;
Qyi = 100;
Qzi = 100;
Qx = 100;
Qy = 100;
Qz = 1;
Qvx = 1;
Qvy = 1;
Qvz = 1;
others = ones(1,6);
Q = diag([Qxi,Qyi,Qzi,Qx,Qy,Qz,Qvx,Qvy,Qvz,others]);
R = 0.00000001*eye(4);
Kfull = dlqr(sysaug.A,sysaug.B,Q,R);
Ki = Kfull(:,1:3);
Ks = Kfull(:,4:15);
