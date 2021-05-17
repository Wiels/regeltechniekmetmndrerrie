%% Set parameters
clear;
% 16 bits quantisation, -10 to 10 V
quantisation_step=20/(2^16);

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
  Q = diag([1,1,0,0]);
  R = 1e12;
    
dist = [0;-pi/(180/50);0;0];
%dist = [0;0;0;0];
params = get_params();
sys = get_system(params);
x_d = desired_state(theta_d, params)
initial_conditions = [init_x, init_theta,0,0];
K = lqr(sys,Q,R);


