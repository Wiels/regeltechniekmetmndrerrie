%% Set parameters
clear;
% 16 bits quantisation, -10 to 10 V
%quantisation_step=20/(2^16);
qintervalsx=0.441*2^16;
resolutionx=0.456*2/qintervalsx;

qintervalstheta=0.3166*2^16;
radtheta=pi/(180/15);
resolutiontheta=radtheta*2/qintervalstheta;
%desired angle
theta_d_degrees=0;
theta_d = pi/(180/theta_d_degrees);

%initial angle and pos
init_theta_degrees=0;
init_theta = pi/(180/init_theta_degrees);
init_x = 0;

%step response
stepThetaDegrees=2;
stepTheta=pi/(180/stepThetaDegrees);
stepValue=[0,stepTheta,0,0];

%filter settings
f = 5;
wc = 2*f*pi;
Ts = 1/200;
load('extreme.mat')

load('ref02.mat')
factor1=(wc*Ts)/(1+wc*Ts);
factor2=1/(1+wc*Ts);
%% Setup
%best:
Q = diag([1000,1e6,0,5*1e4]);
 R = 50;
%
  %Q = diag([1000,4000,0,0]);
  
  %Q = diag([1e6,1e6,0,0]);
 %R=1e4;
    
%dist = [0;-pi/(180/50);0;0];
dist_theta_degrees=100;
dist_theta=pi/(180/dist_theta_degrees);
dist = [0;dist_theta;0;0];
params = get_params();
%sys = get_system(params);
sys = get_fullstate_system(params);
x_d = desired_state(theta_d, params);
initial_conditions = [init_x, init_theta,0,0];
K = lqr(sys,Q,R);
clsystem=feedback(sys,K);


%% plotting of poles
[cl_poles,cl_zeros]=pzmap(clsystem);
figure
hold on
scatter(real(cl_poles),imag(cl_poles),'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5);
scatter(real(cl_zeros),imag(cl_zeros),'MarkerEdgeColor',[0.5 0 .5],...
              'MarkerFaceColor',[0.7 0 .7],...
              'LineWidth',1.5);
grid on
 xlim([-25,0])
hold off


