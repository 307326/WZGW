function [mgk] = ret_mgk2(L,L0,B)

L=deg2rad(L);
L0=deg2rad(L0);
B=deg2rad(B);

ep2=0.00673949677548;
t=tan(B);
eta2=ep2*cos(B)^2;

l=L-L0;
mgk= 1 + ((l^2)/2)*(cos(B)^2)*(1 + eta2) + ((l^4)/24)*(cos(B)^4)*(5-4*(t^2));
end