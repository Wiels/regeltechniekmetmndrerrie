% All calculations to get the LQI controller running in Simulink
clear;
load('references_08.mat')
load 'sysaug.mat';
%% Tuning
% A = sysaug.A;
% B = sysaug.B;
% C = sysaug.C;
% D = sysaug.D;
% Qxi = 1;
% Qyi = 1;
% Qzi = 1000;
% Qx = 100;
% Qy = 100;
% Qz = 100;
% Qvx = 1;
% Qvy = 1;
% Qvz = 1;
% others = ones(1,6);
% Q = diag([Qxi,Qyi,Qzi,Qx,Qy,Qz,Qvx,Qvy,Qvz,others]);
% R = 10*eye(4);

% Qxi = 1;
% Qyi = 1;
% Qzi = 100;
% Qx = 1000;
% Qy = 1000;
% Qz = 1000;
% Qvx = 1;
% Qvy = 1;
% Qvz = 100;
% others = ones(1,6);
% Q = diag([Qxi,Qyi,Qzi,Qx,Qy,Qz,Qvx,Qvy,Qvz,others]);
% R = 0.1*eye(4);
% Kfull = dlqr(sysaug.A,sysaug.B,Q,R);
% Ki = Kfull(:,1:3);
% Ks = Kfull(:,4:15);

% official tuned parameters
Qxi = 1;
Qyi = 1;
Qzi = 100;
Qx = 1000;
Qy = 1000;
Qz = 100;
Qvx = 1000;
Qvy = 1000;
Qvz = 100000;
others = ones(1,6);
Q = diag([Qxi,Qyi,Qzi,Qx,Qy,Qz,Qvx,Qvy,Qvz,others]);
R = 0.01*eye(4);
Kfull = dlqr(sysaug.A,sysaug.B,Q,R);
Ki = Kfull(:,1:3);
Ks = Kfull(:,4:15);