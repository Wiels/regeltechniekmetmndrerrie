clear;
load 'discrete_linearized.mat';

A = sysd.A;
B = sysd.B;
C = sysd.C;
D = sysd.D;

%% stability
eigenvalues =eig(A); 
%stable = sum(abs(eig(A)) > 1) == 0;

%% observability
OO=obsv(A,C);
observable = rank(OO) == length(A);
[V,d]=eig(A);
Po = C*V; %colum 10 is zero => eigvalue 10 is unobservable

%% controllabilty
Cont = ctrb(A, B)
controllable = length(A) == rank(Cont)
[V, d] = eig(A');
Pc = B'*V; %colum 5,6,7 equal zero => eigenvalue 5,6,7 uncontrollable

%% stabilizable
% not stabilizable as eigenvalue 5,6,7 are unstable and uncontrollable

%% detectable
% not detectable as eigenvalue 10 is unstable and unobservable

%% minimal realization
sysmin = minreal(sysd);

[Am,Bm,Cm,Dm] = ssdata(sysmin);

%% Transmission zeros
%TODO