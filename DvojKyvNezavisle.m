DvojKyvadlo
[B,B_t,Funcs] = PripravaNezavisle(s,s_t,phi,Phi,Phi_t);

% Pocatecní podmínky
s0 = [0.5*cos(pi/6);0.5*sin(pi/6);pi/6;0.5+cos(pi/6);sin(pi/6);0];
q0 = B*s0;
dq0 = zeros(2,1);
Y0 = [q0;dq0;s0];

% Simulace
ODE_fun = @(t,y) ODE_nezavisle(B,M,p,Funcs,t,y);
[T,Y] = ode23(ODE_fun,[0,3],Y0);

% Prubeh derivaci a fyzikalnich souradnic
for i = 1:length(T)
	[dY(i,:),S(i,:)] = ODE_fun(T(i),Y(i,:)');
end

% Prubeh s dosazenim kroku Baumgarta
Baum = load('Baum');
for i = 1:length(Baum.T)
	y = [B*Baum.Y(i,1:n_s)';B*Baum.Y(i,n_s+1:2*n_s)';Baum.Y(i,1:n_s)'];
	t = Baum.T(i);
	[bdY(i,:),bS(i,:)] = ODE_fun(t,y);
end

% Vizualizace
figure; plot(T,Y)
figure; hold on;
plot(S(:,1),S(:,2))
plot(bS(:,1),bS(:,2))
figure; hold on;
plot(S(:,4),S(:,5))
plot(bS(:,4),bS(:,5))


