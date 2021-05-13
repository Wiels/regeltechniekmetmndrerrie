%% 
load('references_08.mat')
load 'discrete_linearized_tustin.mat';
%good values: 0.8/12/9,19/10
%% Controller
damping=0.8;
tsettle=12;
omega=4.6/(damping*tsettle);
dompoles=[-damping*omega+1i*omega*sqrt(1-damping^2),...
    -damping*omega-1i*omega*sqrt(1-damping^2)];

otherpoles=linspace(9,19,10)*-abs(dompoles(1));
%otherpoles=linspace(5,10,10)*-damping*omega;
% otherpoles=ones(1,2)*-6+0.1i;
% evenotherpoles=ones(1,2)*-6-0.1i;
% morepoles=ones(1,2)*-8+0.15i;
% extrapoles=ones(1,2)*-8-0.15i;

p = [dompoles,otherpoles];
pd = exp(p.*0.05);
Kpp = place(sysd.A,sysd.B,pd);
eig(sysd.A-sysd.B*Kpp)

%% Observer
obspoles=p*7;
obspolesd=exp(obspoles*0.05);
Lpp = place(sysd.A',sysd.C',obspolesd)';



%%
% App = sysd.A-sysd.B*Kpp-Lpp*sysd.C;
% Bpp = Lpp;
% Cpp = -Kpp;
% Dpp = zeros(4,6);
% syscomp=ss(App,Bpp,Cpp,Dpp,0.05);
% eig(App);
% isstable(syscomp)

%%
Ac2 = sysd.A-Lpp*sysd.C;
Bc2 = [sysd.B-Lpp*sysd.D, Lpp];
Cc2 = eye(size(sysd.A,1));
Dc2 = zeros(size(sysd.A,1),10);
syscomp2=ss(Ac2,Bc2,Cc2,Dc2,0.05);
isstable(syscomp2)
%% other way
% mySeed = 10;
% rng(mySeed);

% G = randn(4,12);
% Lambda1 = blkdiag([-3 +1; -1 -3],otherpoles);
% X1 = lyap(sys.A,-Lambda1,-sys.B*G);
% K1 = G/X1;

