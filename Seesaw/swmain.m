%% Set parameters
theta_d = pi/100;
init_theta = pi/50;
init_x = -0.1;

%% Open Simulink library
slLibraryBrowser
%% Setup
params = get_params();
sys = get_system(params);
sys2 = get_system2(params);
x_d = desired_state(theta_d, params)
initial_conditions = [init_x, init_theta, 0, 0];
K = lqr_controller(sys2);