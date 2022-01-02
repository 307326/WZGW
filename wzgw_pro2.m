clear;

rek = 4.5986;%w godzinach  %4 h 35 min 55 s
dek = 16.5091;%w stopniach  %16° 30′
jd = julday(2000,4,28,0);

%Turku
phi1 = 60.45175; %N
lam1 = 22.26705; %E
%Stanley
phi2 = -51.6833; %S
lam2 = -57.8500; %W
%Libreville
phi3 = 0.3833; %N
lam3 = 9.4500; %E


for h = 1:24

    t1 = katgodz(2000,28,4,h,lam1,rek);
    t2 = katgodz(2000,28,4,h,lam2,rek);
    t3 = katgodz(2000,28,4,h,lam3,rek);
    
    Z1 = acosd(sind(phi1)*sind(dek)+cosd(phi1)*cosd(dek)*cosd(t1));
    zen1(h)= Z1;
    wys1(h)= 90 - Z1;
    A1 = atand((-cosd(dek)*sind(t1))/(cosd(phi1)*sind(dek)-sind(phi1)*cosd(dek)*cosd(t1)))
    
    A1 = ret_azymut(A1,phi1,dek,t1);
    az1(h) = A1;

    Z2 = acosd(sind(phi2)*sind(dek)+cosd(phi2)*cosd(dek)*cosd(t2));
    zen2(h)= Z2;
    wys2(h)=90 - Z2;
    A2 = atand((-cosd(dek)*sind(t2))/(cosd(phi2)*sind(dek)-sind(phi2)*cosd(dek)*cosd(t2)));

    A2 = ret_azymut(A2,phi2,dek,t2);
    az2(h) = A2;

    Z3 = acosd(sind(phi3)*sind(dek)+cosd(phi3)*cosd(dek)*cosd(t3));
    zen3(h)= Z3;
    wys3(h)=90 - Z3;
    A3 = atand((-cosd(dek)*sind(t3))/(cosd(phi3)*sind(dek)-sind(phi3)*cosd(dek)*cosd(t3)));

    A3 = ret_azymut(A3,phi3,dek,t3);
    az3(h) = A3;
    
    %z1 = acosd(coz_z1);
    %A1 = atand(tgA1);
    
    r=1;
    
    x1(h) = r*sind(Z1)*cosd(A1);
    y1(h) = r*sind(Z1)*sind(A1);
    z1(h) = r*cosd(Z1);

    x2(h) = r*sind(Z2)*cosd(A2);
    y2(h) = r*sind(Z2)*sind(A2);
    z2(h) = r*cosd(Z2);

    x3(h) = r*sind(Z3)*cosd(A3);
    y3(h) = r*sind(Z3)*sind(A3);
    z3(h) = r*cosd(Z3);

end

for j = 1:24
    i(j)=j;
end
figure;plot3(x3,y3,z3,'o');
grid;
figure;
plot3(x2,y2,z2,'o');
grid;
figure;plot3(x1,y1,z1,'o');
grid;
xlabel('x');
ylabel('y');
zlabel('z');

figure;plot(wys1,'o');
figure;plot(wys2,'o');
figure;plot(wys3,'o');

%skyplot(az1,wys1)
