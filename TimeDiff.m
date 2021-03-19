function D = TimeDiff(F,vars,vars_t)
	sz = numel(vars);
	syms sb(t) [sz,1]
	D_p = diff(subs(F,vars,sb),t);
	D = subs(D_p,[sb;diff(sb,t)],[vars;vars_t]);
end