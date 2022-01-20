function [sab,AzAB,AzBA] = vincent(Fi_a,La_a,Fi_b,La_b)

Fi_a = deg2rad(Fi_a);
La_a = deg2rad(La_a);

Fi_b = deg2rad(Fi_b);
La_b = deg2rad(La_b);
a = 6378137;
e2=0.00669437999013;

b = a*sqrt(1-e2);
f = 1-(b/a);
La_del = La_b - La_a;
Ua = atan((1-f)*tan(Fi_a));
Ub = atan((1-f)*tan(Fi_b));

%% petla
i=1;
while 1
    if (i==1)
        L = La_del;    
    end
    sin_sigma = sqrt((cos(Ub)*sin(L))^2 + (cos(Ua)*sin(Ub)-sin(Ua)*cos(Ub)*cos(L))^2 );
    cos_sigma = sin(Ua)*sin(Ub)+cos(Ua)*cos(Ub)*cos(L);
    sigma = atan(sin_sigma/cos_sigma);
    sin_alfa = (cos(Ua)*cos(Ub)*sin(L))/sin_sigma;
    cos2_alfa = 1 - sin_alfa^2;
    cos_2sigma_m = cos_sigma - ((2*sin(Ua)*sin(Ub))/cos2_alfa);
    C = f/16 * cos2_alfa * (4 + f*(4-3*cos2_alfa));
    L_old = L;
    L = La_del+(1-C)*f*sin_alfa*(sigma+C*sin_sigma*(cos_2sigma_m+C*cos_sigma*(-1+2*cos_2sigma_m^2)));
    
    i=i+1;
    if ( abs(L-L_old) < 0.000001/3600)
        break
    end
end

%% dalsza czesc
u2 = ((a^2 - b^2)/b^2)*cos2_alfa;
A = 1+(u2/16384)*(4096+u2*(-768+u2*(320-175*u2)));
B = (u2/1024)*(256+u2*(-128+u2*(74-47*u2)));
sigma_del = B*sin_sigma*(cos_2sigma_m+(1/4*B)*(cos_sigma*(-1+2*(cos_2sigma_m^2))-(1/6*B)*cos_2sigma_m*(-3+4*(sin_sigma^2))*(-3+4*(cos_2sigma_m^2))));

sab=b*A*(sigma-sigma_del);
AzAB = atan2d((cos(Ub)*sin(L)),(cos(Ua)*sin(Ub)-sin(Ua)*cos(Ub)*cos(L)));
AzBA = atan2d((cos(Ua)*sin(L)),(-sin(Ua)*cos(Ub)+cos(Ua)*sin(Ub)*cos(L)))+180;

end