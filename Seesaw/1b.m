%openloop analysis

%% stability
eigenvalues =eig(A); 
stable = sum(real(eig(A)) > 0) ==0 ; %system is unstable

%% observability
OO=obsv(A,C);
observable = rank(OO) == length(A);
[V,d]=eig(A);
Po = C*V; %system observable

%% controllabilty
Cont = ctrb(A, B)
controllable = length(A) == rank(Cont)
[V, d] = eig(A');
Pc = B'*V; %system controllable

%% stabilizable
% stabilizable as the system is controllable

%% detectable
% detectable as the system is observable

%% minimal realization
sys = ss(A,B,C,D,-1);
sysmin = minreal(sys);

[Am,Bm,Cm,Dm] = ssdata(sysmin);
%system is minimal

%% Transmission zeros
D = [0 ;0];
zz = tzero(A,B,C,D)
%there are no transmission zeros
if size(zz,1) > 0
    zeta=zz(1); % choose one of the transmission zeros
    M=[zeta*eye(length(A))-A -B; C ];
    z=null(M);
    x0=z(1:length(A),1);
    u0=z(length(A)+1:length(z),1);
end