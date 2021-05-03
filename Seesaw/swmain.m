%% Set parameters
theta_d = pi/200;
init_theta = pi/150;
init_x = 0;
%filter settings
f = 2;
wc = 2*f*pi;
Ts = 1/200;


%% Setup
params = get_params();
sys = get_system(params);
sys2 = get_system2(params);
x_d = desired_state(theta_d, params)
initial_conditions = [init_x, init_theta, 0, 0];
K = lqr_controller(sys2);