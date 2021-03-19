function dx = ODE_Baumgarte(t,x)
	addpath('Baumgarte')
	dX = [x(7:12);L(x)\P(x)];
	dx = dX(1:12);
end