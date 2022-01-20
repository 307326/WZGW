function [M] = ret_M(fi,a,e2)
    M = (a*(1-e2))/(sqrt((1-e2*(sind(fi)^2))^3));
end