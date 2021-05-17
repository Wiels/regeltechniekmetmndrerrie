% Calculate LQR gain K and save it in order to be used in Simulink
% Tuning of Q and R happens here
function K = lqr_controller(sys)
    Q = diag([1000,4000,0,0]);
    R = 300;
    K = lqr(sys,Q,R);
end