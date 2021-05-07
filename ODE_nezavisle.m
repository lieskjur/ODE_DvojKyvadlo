function [dy,s] = ODE_nezavisle(B,M,p,Funcs,t,y)
	n_q = size(B,1);
	q = y(1:n_q); dq = y(n_q+1:2*n_q); s0 = y(2*n_q+1:end);

	s = Funcs.Nezavisle2Fyzikalni(q,s0);

	PHIB = [Funcs.Phi(s);B];
	Rho = inv(PHIB);
	R = Rho(:,end-(n_q-1):end);

	ds = R*dq;

	PHIB_t = [Funcs.Phi_t([s;ds]);zeros(size(B))];
	Rho_t = Rho*PHIB_t*Rho;
	R_t = Rho_t(:,end-(n_q-1):end);

	% Leva a prava strana EoM
	P = R'*M*R;
	L = R'*p - R'*M*R_t*dq;

	dy = [ dq; P\L; ds ]; % dq;ddq;ds
end