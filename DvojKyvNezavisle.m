DvojKyvadlo

% Vazbové "matlab" funkce
Funcs.phi = matlabFunction(phi,'vars',{s});
Funcs.Phi = matlabFunction(Phi,'vars',{s});
Funcs.Phi_t = matlabFunction(Phi_t,'vars',{[s;s_t]});

% Nezavisle souradnice
n_q = n_s-length(phi);
syms q [n_q,1]
pos_q = [3,6];
pos_p = 1:n_s; pos_p(pos_q) = [] ;

% Vyberova matice
B = zeros(n_q,n_s);
for i = 1:n_q
	B(i,pos_q(i)) = 1;
end
B_t = zeros(n_q,n_s);

% Numerické určení fyzikálních souřadnic z nezávislých souřadnic
Funcs.Q2S = @(q,s0) q2s(matlabFunction(phi,'vars',{s(pos_q),s(pos_p)}),pos_p,pos_q,q,s0);

% Pocatecní podmínky
s0 = [0.5*cos(pi/6);0.5*sin(pi/6);pi/6;0.5+cos(pi/6);sin(pi/6);0];
q0 = B*s0;
dq0 = zeros(2,1);

% Simulace
ODE_fun = @(t,y) ODE_nezavisle(B,B_t,M,p,Funcs,t,y);
[T,Y] = ode23(ODE_fun,[0,3],[q0;dq0;s0]);

% Prubeh derivaci
for i = 1:length(T)
	dY(i,:) = ODE_fun(T(i),Y(i,:)');
end

% Vizualizace
figure; plot(T,Y)
figure; plot(Y(:,5),Y(:,6))
figure; plot(Y(:,8),Y(:,9))