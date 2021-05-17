%% Set parameters

%desired angle
theta_d = 0;

%initial angle and pos
init_theta = -pi/25;
init_x = 0.0;

%filter settings
f = 2;
wc = 2*f*pi;
Ts = 1/200;

%% Setup
params = get_params();
sys = get_fullstate_system(params);
x_d = desired_state(theta_d, params)
initial_conditions = [init_x, init_theta, 0, 0];
K = lqr_controller(sys);