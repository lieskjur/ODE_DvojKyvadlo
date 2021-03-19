function dx = ODE_Baumgarte(L,P,t,x)
	lx = length(x);
	dX = [x((lx/2+1):lx);L(x)\P(x)];
	dx = dX(1:lx);
end