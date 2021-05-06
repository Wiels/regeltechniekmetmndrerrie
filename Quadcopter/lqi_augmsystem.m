load('references_08.mat')
load 'discrete_linearized_tustin.mat';
%% 
Aaug = [diag([1,1,1,zeros(1,3)]),sysd.C;zeros(12,6),sysd.A];
Baug = [sysd.D;sysd.B];
Caug = diag([ones(1,3),ones(1,3),zeros(1,12)]);
Daug = zeros(18,4);
sysaug = ss(Aaug,Baug,Caug,Daug,0.05);













