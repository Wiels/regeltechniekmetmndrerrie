%% 
load('references_08.mat')
load 'discrete_linearized_tustin.mat';
%good values: 0.8/12/9,19/10
%% Controller
damping=0.71;
tsettle=8;
omega=4.6/(damping*tsettle);
a = -damping*omega;
b = omega*sqrt(1-damping^2);
dompoles=[-a+1i*b,...
    -a-1i*b];

otherpoles=linspace(5,10,10)*a;

cl_poles = [dompoles,otherpoles];
cl_poles_d = exp(cl_poles.*0.05);
Kpp = place(sysd.A,sysd.B,cl_poles_d);
eig(sysd.A-sysd.B*Kpp)

%% Observer
obspoles=cl_poles*5;
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

