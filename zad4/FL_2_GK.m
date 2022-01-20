function [x,y] = FL_2_GK(fi,L,L0)
    fi=deg2rad(fi);
    L=deg2rad(L);

    L0=deg2rad(L0);

    a = 6378137;
    e2 = 0.00669438002290;
    e2p = 0.00673949677548;
    
    l=L-L0;
    A0 = 1 - e2/4 - (3*(e2^2))/64 - (5*(e2^3))/256;
    A2 = 3/8 * (e2 + (e2^2)/4 + (15*(e2^3))/128);
    A4 = (15/256)*((e2^2)+ (3*(e2^3))/4);
    A6 = (35*(e2^3))/3072;
    
    N = a/sqrt(1-e2*sin(fi)^2);
    t = tan(fi);
    eta2 = e2p*cos(fi)^2;
    
    
    sigma = a*(A0*fi - A2*sin(2*fi) + A4*sin(4*fi)-A6*sin(6*fi));
    
    x = sigma + ((l^2)/2) * N * sin(fi) * cos(fi) * ( 1+((l^2)/12)*(cos(fi)^2) * (5-(t^2)+9*eta2+4*(eta2^2)) + ((l^4)/360)*(cos(fi)^4)*(61-58*(t^2)+(t^4)+270*eta2-330*eta2*(t^2)));
    y = l*N*cos(fi)*(1+((l^2)/6)*(cos(fi)^2)*(1-(t^2)+eta2)+((l^4)/120)*(cos(fi)^4)*(5-18*(t^2)+(t^4)+14*eta2-58*eta2*(t^2)));

end