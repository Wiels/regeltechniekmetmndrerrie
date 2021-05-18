%% Set parameters
clear;
load exercise2/references2
%desired angle
theta_d = pi/90;

%initial angle and pos
init_theta_degrees=0;
init_theta = -pi/(180/init_theta_degrees);
init_x = 0.0;


%% Setup
    %Q = diag([1000,5000,0,0]);
    %R = 1e10;
   Q = diag([1000,4000,0,0]);
   R = 10;
dist = [0;pi/(180/110);0;0]
params = get_params();
sys = get_fullstate_system(params);
 K = lqr(sys,Q,R);
x_d = desired_state(theta_d, params)
initial_conditions = [init_x, init_theta, 0, 0];


