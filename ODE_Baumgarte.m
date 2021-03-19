function [dx,lambda] = ODE_Baumgarte(L,P,t,x)
	lx = length(x);
	W = [x(lx/2+1:lx);L(x)\P(x)];
	dx = W(1:lx);
	lambda = -W(lx+1:end);
end