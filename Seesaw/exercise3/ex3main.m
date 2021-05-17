%% Set parameters
clear;
%desired angle
theta_d = 0;

%initial angle and pos
init_theta = 0;
init_x = 0;

%filter settings
f = 2;
wc = 2*f*pi;
Ts = 1/200;

%% Setup
  Q = diag([1000,4000,100,1]);
  R = 1e5;
    
dist = [0;-pi/(180/50);0;0];
%dist = [0;0;0;0];
params = get_params();
sys = get_system(params);
x_d = desired_state(theta_d, params)
initial_conditions = [init_x, init_theta,0,0];
K = lqr(sys,Q,R);


