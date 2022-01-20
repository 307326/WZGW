function [mgk] = ret_mgk(y,fi)
    a=6378137;
    e2=0.00673949677548;
    
    N = ret_N(fi,a,e2);
    M = ret_M(fi,a,e2);
    Q = sqrt(M*N);
    
    mgk = 1 + (y^2)/(2*(Q^2)) + (y^2)/(24*(Q^4));
end