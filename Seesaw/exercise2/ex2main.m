%% Set parameters
clear;
load exercise2/references2
%desired angle
theta_d = 0;

%initial angle and pos
init_theta_degrees=0;
init_theta = -pi/(180/init_theta_degrees);
init_x = 0;


%% Setup %settings step: r=50, 1000,1e6,0,5*1e4
    Q = diag([1000,1e6,0,5*1e4]);
    %Q = diag([1e6,1e6,0,0]);
   % R = 1e4;
   %Q = diag([1000,4000,0,0]);
   R = 1e2;
dist = [0;pi/(180/100);0;0]
params = get_params();
sys = get_fullstate_system(params);
 K = lqr(sys,Q,R);
x_d = desired_state(theta_d, params)
initial_conditions = [init_x, init_theta, 0, 0];


