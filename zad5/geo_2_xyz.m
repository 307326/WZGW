function [x,y,z] = geo_2_xyz(fi,lam,h,e2)
a = 6378137;

lam=deg2rad(lam);
fi=deg2rad(fi);

N=a/(sqrt(1-e2*(sin(fi)^2)));

x=(N+h)*cos(fi)*cos(lam);
y=(N+h)*cos(fi)*sin(lam);
z=(N*(1-e2)+h)*sin(fi);
end