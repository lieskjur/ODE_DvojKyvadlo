function D = TimeDiff(F,vars,vars_t)
	n_p = numel(vars);
	syms p(t) [n_p,1]
	D_p = diff(subs(F,vars,p),t);
	D = subs(D_p,[p;diff(p,t)],[vars;vars_t]);
end