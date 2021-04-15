%% Calculate LQR gain K and save it in order to be used in Simulink
Q = diag([1000,4000,0,0]);
R=10;
K = lqr(sys,Q,R);
save('lqr_K.mat','K');