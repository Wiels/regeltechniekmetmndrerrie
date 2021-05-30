% Implementation of augmented system, necessary to include integral action
clear;
load('references_08.mat')
load 'sys.mat';
load 'discrete_linearized_tustin.mat';
%% 
hs = ss(sys.A,sys.B,[eye(3),zeros(3,9)],zeros(3,4));
hsd = c2d(hs,0.05,'tustin');
Aaug = [diag([1,1,1]),hsd.C;zeros(12,3),sysd.A];
Baug = [hsd.D;sysd.B];
Caug = [diag([ones(1,3)]),zeros(3,12)];
Daug = zeros(3,4);
sysaug = ss(Aaug,Baug,Caug,Daug,0.05);

%% checking controllability
Cont = ctrb(Aaug, Baug)
controllable = length(Aaug) == rank(Cont) %controllable
[V, d] = eig(Aaug');
Pc = Baug'*V; %all are controllable












