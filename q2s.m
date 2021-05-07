function s = q2s(phi_qp,p_pos,q_pos,q,s0)
	options = optimset('Display','off','TolX',5e-16);
	p = fsolve(@(p) phi_qp(q,p),s0(p_pos),options);
	s(p_pos,1) = p;
	s(q_pos,1) = q;
end