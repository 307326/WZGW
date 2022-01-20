function [x,y] = GK_2_92(xgk,ygk)
    m092=0.9993;
    x0=-5300000.0;
    y0=500000.0;
    x= m092 * xgk+x0;
    y= m092 * ygk+y0;
end