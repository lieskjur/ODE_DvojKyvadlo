function L = L(in1)
%L
%    L = L(IN1)

%    This function was generated by the Symbolic Math Toolbox version 8.6.
%    19-Mar-2021 08:57:09

s3 = in1(3,:);
s6 = in1(6,:);
t2 = cos(s3);
t3 = cos(s6);
t4 = sin(s3);
t5 = sin(s6);
t6 = -t2;
t7 = t2./2.0;
t8 = t3./2.0;
t9 = t4./2.0;
t10 = t5./2.0;
t11 = -t7;
t12 = -t8;
L = reshape([1.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0./2.0,0.0,0.0,0.0,t9,t11,t4,t6,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0./2.0,0.0,0.0,t10,t12,1.0,0.0,t9,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,t11,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t4,1.0,0.0,t10,0.0,0.0,0.0,0.0,0.0,0.0,t6,0.0,1.0,t12,0.0,0.0,0.0,0.0],[10,10]);
