%% 
load('references_08.mat')
load 'discrete_linearized_tustin.mat';
%good values: 0.8/12/9,19/10
%official tuning for pp
%% Controller
damping=1;
tsettle=7;
omega=4.6/(damping*tsettle);
a = -damping*omega;
b = omega*sqrt(1-damping^2);
dompoles=[a+1i*b,...
    a-1i*b];

%otherpoles=linspace(8,12,10)*(-abs(dompoles(1)));
otherpoles=linspace(5,9,10)*(-abs(dompoles(1)));

cl_poles = [dompoles,otherpoles];
cl_poles_d = exp(cl_poles.*0.05);
Kpp = place(sysd.A,sysd.B,cl_poles_d);
eig(sysd.A-sysd.B*Kpp)

%% Observer
obspoles=cl_poles*2;
obspolesd=exp(obspoles*0.05);
Lpp = place(sysd.A',sysd.C',obspolesd)';



%%
Ac2 = sysd.A-Lpp*sysd.C;
Bc2 = [sysd.B-Lpp*sysd.D, Lpp];
Cc2 = eye(size(sysd.A,1));
Dc2 = zeros(size(sysd.A,1),10);
syscomp2=ss(Ac2,Bc2,Cc2,Dc2,0.05);
isstable(syscomp2)

%%Nx and Ny
X = [sysd.A - eye(12), sysd.B; sysd.C(1:3,:), sysd.D(1:3,:)];
I = [zeros(12,3); eye(3)];
N = X\I;
Nx = N(1:12,:);
Nu = N(13:end,:);

%% other way
% mySeed = 10;
% rng(mySeed);

% G = randn(4,12);
% Lambda1 = blkdiag([-3 +1; -1 -3],otherpoles);
% X1 = lyap(sys.A,-Lambda1,-sys.B*G);
% K1 = G/X1;

% official tuning for pp
% %% Controller
% damping=1;
% tsettle=7;
% omega=4.6/(damping*tsettle);
% a = -damping*omega;
% b = omega*sqrt(1-damping^2);
% dompoles=[a+1i*b,...
%     a-1i*b];
% 
% %otherpoles=linspace(8,12,10)*(-abs(dompoles(1)));
% otherpoles=linspace(5,9,10)*(-abs(dompoles(1)));
% 
% cl_poles = [dompoles,otherpoles];
% cl_poles_d = exp(cl_poles.*0.05);
% Kpp = place(sysd.A,sysd.B,cl_poles_d);
% eig(sysd.A-sysd.B*Kpp)
% 
% %% Observer
% obspoles=cl_poles*2;
% obspolesd=exp(obspoles*0.05);
% Lpp = place(sysd.A',sysd.C',obspolesd)';

%% plotting of poles
figure
hold on
scatter(real(cl_poles),imag(cl_poles),'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5);
scatter(real(obspoles),imag(obspoles),'MarkerEdgeColor',[0.5 0 .5],...
              'MarkerFaceColor',[0.7 0 .7],...
              'LineWidth',1.5);
grid on
  
hold off

%% plotting of poles discrete
figure
hold on
syms t;
t=0:0.001:2*pi;
x=cos(t);
y=sin(t);
plot(x,y,'k','linewidth',2);
axis square;
scatter(real(cl_poles_d),imag(cl_poles_d),'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5);
scatter(real(obspolesd),imag(obspolesd),'MarkerEdgeColor',[0.5 0 .5],...
              'MarkerFaceColor',[0.7 0 .7],...
              'LineWidth',1.5);
grid on
  
hold off







