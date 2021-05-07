function dy = ODE_nezavisle(B,B_t,M,p,Funcs,t,y)
	q = y(1:2); dq = y(3:4); s0 = y(5:end);

	s = Funcs.Q2S(q,s0);

	PHI = Funcs.Phi(s);
	PHIB = [PHI;B];
	Rho = inv(PHIB);
	R = Rho(:,end-1:end);

	ds = R*dq;

	PHI_t = Funcs.Phi_t([s;ds]);
	PHIB_t = [PHI_t;B_t];
	Rho_t = Rho*PHIB_t*Rho;
	R_t = Rho_t(:,end-1:end);

	% Leva a prava strana EoM
	P = R'*M*R;
	L = R'*p - R'*M*R_t*dq;

	dy = [ dq; P\L; ds ]; % dq;ddq;ds
end