function [B,B_t,Funcs] = PripravaNezavisle(s,s_t,phi,Phi,Phi_t)
	% Vazbové "matlab" funkce
	Funcs.Phi = matlabFunction(Phi,'vars',{s});
	Funcs.Phi_t = matlabFunction(Phi_t,'vars',{[s;s_t]});

	% Nezavisle souradnice
	n_s = length(s);
	n_q = n_s-length(phi);
	pos_q = [3,6];
	pos_p = 1:n_s; pos_p(pos_q) = [] ;

	% Vyberova matice
	B = zeros(n_q,n_s);
	for i = 1:n_q
		B(i,pos_q(i)) = 1;
	end
	B_t = zeros(n_q,n_s);

	% Numerické určení fyzikálních souřadnic z nezávislých souřadnic
	phi_qp = matlabFunction(phi,'vars',{s(pos_q),s(pos_p)});
	Funcs.Nezavisle2Fyzikalni = @(q,s0) q2s(phi_qp,pos_p,pos_q,q,s0);

	function s = q2s(phi_qp,p_pos,q_pos,q,s0)
		options = optimset('Display','off','TolX',5e-16);
		p = fsolve(@(p) phi_qp(q,p),s0(p_pos),options);
		s(p_pos,1) = p;
		s(q_pos,1) = q;
	end
end