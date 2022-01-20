function [N] = ret_N(fi,a, e2)

fi = deg2rad(fi);

N=a/sqrt((1-e2)*(sind(fi)^2));
end