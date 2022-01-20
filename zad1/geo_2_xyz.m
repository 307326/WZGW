function [x,y,z] = geo_2_xyz(fi,lam,h,e2,N)
%lam=deg2rad(lam);
%fi=deg2rad(fi);
x=(N+h).*cosd(fi).*cosd(lam);
y=(N+h).*cosd(fi).*sind(lam);
z=(N.*(1-e2)+h).*sind(fi);
end