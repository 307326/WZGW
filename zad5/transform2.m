function [xw,yw,zw] = transform2(xp,yp,zp)

x0=-33.4297;
y0=146.5746;
z0=76.2865;

%m=1+8407728*(10^-6);
mu = 0.8407728 * (10^-6);
m = 1 + mu;

alfa=deg2rad(-0.35867/3600);
beta=deg2rad(-0.05283/3600);
gamma=deg2rad(0.84354/3600);

macierz1 = [m, gamma, -beta;
            -gamma, m, alfa;
            beta, -alfa, m];
macierz2 = [xp;
            yp;
            zp];
macierz3 = [x0;
            y0;
            z0;];

macierzwyniku = macierz1*macierz2 + macierz3;

xw=macierzwyniku(1);
yw=macierzwyniku(2);
zw=macierzwyniku(3);
end