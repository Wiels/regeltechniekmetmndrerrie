%% 
load('references_08.mat')
load 'discrete_linearized_tustin.mat';

%% Controller
damping=0.8;
tsettle=12;
omega=4.6/(damping*tsettle);
dompoles=[-damping*omega+1i*omega*sqrt(1-damping^2),...
    -damping*omega-1i*omega*sqrt(1-damping^2)];

otherpoles=linspace(5,10,10)*-abs(dompoles(1));
%otherpoles=linspace(5,10,10)*-damping*omega;
% otherpoles=ones(1,2)*-6+0.1i;
% evenotherpoles=ones(1,2)*-6-0.1i;
% morepoles=ones(1,2)*-8+0.15i;
% extrapoles=ones(1,2)*-8-0.15i;

p = [dompoles,otherpoles];
pd = exp(p.*0.05);
Kpp = place(sysd.A,sysd.B,pd);
eig(sysd.A-sysd.B*Kpp);

%% Observer
obspoles=p*6;
obspolesd=exp(obspoles*0.05);
Lpp = place(sysd.A',sysd.C',obspolesd)';



%%
App = sysd.A-sysd.B*Kpp-Lpp*sysd.C;
Bpp = Lpp;
Cpp = -Kpp;
Dpp = zeros(4,6);
syscomp=ss(App,Bpp,Cpp,Dpp,0.05);
eig(App);
isstable(syscomp)

%% other way
% mySeed = 10;
% rng(mySeed);

% G = randn(4,12);
% Lambda1 = blkdiag([-3 +1; -1 -3],otherpoles);
% X1 = lyap(sys.A,-Lambda1,-sys.B*G);
% K1 = G/X1;

