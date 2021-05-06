clear;
load('references_08.mat')
load 'sysaug.mat';
%% 
% A = sysaug.A;
% B = sysaug.B;
% C = sysaug.C;
% D = sysaug.D;
Qxi = 10000;
Qyi = 10000;
Qzi = 100000;
Qx = 1000;
Qy = 1000;
Qz = 10000;
Qvx = 1;
Qvy = 1;
Qvz = 1000;
others = ones(1,6);
Q = diag([Qxi,Qyi,Qzi,Qx,Qy,Qz,Qvx,Qvy,Qvz,others]);
R = 0.001*eye(4);
Kfull = dlqr(sysaug.A,sysaug.B,Q,R);
Ki = Kfull(:,1:3);
Ks = Kfull(:,4:15);
