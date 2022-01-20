function [N] = ret_N(fi,a, e2)
    N=a/sqrt((1-e2)*sind(fi)^2);
end