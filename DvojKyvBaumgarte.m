DvojKyvadlo

% Soustava rovnic
L = [M,Phi';Phi,zeros(4,4)];
alpha=10; beta=10;
P = [p;-Phi_t*s_t-2*alpha*Phi*s_t-beta^2*phi];

% Vytvoreni funkci
L = matlabFunction(L,'vars',{[s;s_t]});
P = matlabFunction(P,'vars',{[s;s_t]});

% Simulace
Y0 = [0.5*cos(pi/6);0.5*sin(pi/6);pi/6;0.5+cos(pi/6);sin(pi/6);0;0;0;0;0;0;0];
options = odeset('MaxStep',1e-6);
ODE_fun = @(t,y) ODE_Baumgarte(L,P,t,y);
[T,Y] = ode23(ODE_fun,[0,3],Y0,options);

% Prubeh derivaci a multiplikatoru
for i = 1:length(T)
	[dY(i,:),lambda(i,:)] = ODE_fun(T(i),Y(i,:)');
end

% Vizualizace
figure; plot(T,Y)
figure; plot(Y(:,1),Y(:,2))
figure; plot(Y(:,4),Y(:,5))

% Ulozeni vysledku
%{
Baum.T = T
Baum.Y = Y
save('Baum','-struct','Baum')
%}
