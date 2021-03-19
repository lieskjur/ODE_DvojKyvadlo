clc; clear all; close all;

syms s s_t [6,1] 'real'
syms y(t) [12,1]

% Pohybove rovnice
m1=1;
m2=1;
Is1=0.5;
Is2=0.5;
M = diag([m1,m1,Is1,m2,m2,Is2]);

g=10;
M1=0;
M2=0;
p1 = [0;-m1*g;M1-M2;0;-m2*g;M2];

% Langrangeovy multiplikatory
l1=1;
l2=1;
t1=0.5;
t2=0.5;

f = [	s(1)-t1*cos(s(3))
		s(2)-t1*sin(s(3))
		s(4)-(l1*cos(s(3))+t2*cos(s(6)))
		s(5)-(l1*sin(s(3))+t2*sin(s(6))) ];
Phi = jacobian(f,s)
Phi_t = TimeDiff(Phi,s,s_t)

% Soustava Pohybovych rovnic
L = [M,Phi';Phi,zeros(4,4)];
alpha=10; beta=10;
P = [p1;-Phi_t*s_t-2*alpha*Phi*s_t-beta^2*f];

% Export funkci
L = matlabFunction(L,'vars',{[s;s_t]});
P = matlabFunction(P,'vars',{[s;s_t]});

% Simulace
Y0 = [0.5*cos(pi/6);0.5*sin(pi/6);pi/6;0.5+cos(pi/6);sin(pi/6);0;0;0;0;0;0;0];
[T,Y] = ode23(@(t,x) ODE_Baumgarte(L,P,t,x),[0,3],Y0);

figure; plot(T,Y)
figure; plot(Y(:,1),Y(:,2))
figure; plot(Y(:,4),Y(:,5))