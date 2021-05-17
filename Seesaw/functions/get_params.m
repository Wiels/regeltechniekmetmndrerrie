function params = get_params()
 %specifications
params.Rm = 2.6; %Ohm
params.Kt = 0.00767; %Nm/A
params.Km = 0.00767; %V/(rad/s)
params.Kg = 3.71; % gear ratio, output is slower
params.eta_m = 1; % motor efficiency
params.eta_g = 1; % gearbox efficiency
params.Mc = 0.52; % kg cart mass
params.Msw = 3.6; % kg seesaw mass
params.Jsw = 0.3950; % kg m^2 moment of inertia 
params.Dt = 0.1250; % m distance from pivot to track
params.Dc = 0.058; % m distance from pivot to center of gravity seesaw
params.r = 0.00635; % m radius of output gear
params.g = 9.81; % m/s^2 acceleration of gravity
params.Beq = 0.9; % Nms/rad equivalent viscous damping coefficient seen at motor pinion
params.Bsw = 0; % Nms/rad viscous damping coefficient seen from seesaw pivot
end