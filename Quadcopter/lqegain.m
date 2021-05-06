load('references_08.mat')
load 'discrete_linearized_tustin.mat';
%%
Q = 
[M,P] = dlqe(sysd.A,eye(12),sysd.C,Q,R);
L = sysd.A*M;





