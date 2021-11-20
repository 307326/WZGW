function [n,e,u] = xyz_2_neu(LAM, FI, x1, y1, z1, x2, y2,z2)
%LAM = deg2rad(LAM);
%FI = deg2rad(FI);

del_X = x1-x2;
del_Y = y1-y2;
del_Z = z1-z2;


macierz1 = [-sind(FI)*cosd(LAM), -sind(LAM), cosd(FI)*cosd(LAM);
            -sind(FI)*sind(LAM), cosd(LAM), cosd(FI)*sind(LAM);
            cosd(FI), 0, sind(FI)]';
macierz2 = [del_X;
            del_Y;
            del_Z];
macierz3 = macierz1 * macierz2;
%macierz3 = dot(macierz1, macierz2);


n=macierz3(1);
e=macierz3(2);
u=macierz3(3);
end