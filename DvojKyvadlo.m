clc; clear all; close all;

n_s = 6;
syms s s_t [n_s,1] 'real'

% Pohybove rovnic
m1=1;
m2=1;
Is1=0.5;
Is2=0.5;
M = diag([m1,m1,Is1,m2,m2,Is2]);

g=10;
M1=0;
M2=0;
p = [0;-m1*g;M1-M2;0;-m2*g;M2];

% Vazby
l1=1;
l2=1;
t1=0.5;
t2=0.5;

phi = [	s(1)-t1*cos(s(3))
		s(2)-t1*sin(s(3))
		s(4)-(l1*cos(s(3))+t2*cos(s(6)))
		s(5)-(l1*sin(s(3))+t2*sin(s(6))) ];
Phi = jacobian(phi,s)
Phi_t = TimeDiff(Phi,s,s_t)