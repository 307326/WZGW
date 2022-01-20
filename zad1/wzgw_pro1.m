clear;

a = 6378137;
e2=0.00669437999013;

%% wsp samolotu
macierzDane=load('dane_2.txt');
phi=macierzDane(:,1);
lambda=macierzDane(:,2);
h=macierzDane(:,3);

%% wsp lotniska
%phiB=52.1658;
%lambdaB=20.9672;
%hB=110; % sprawdzic czy nie 0  
phiB=phi(249);
lambdaB=lambda(249);
hB=h(249);

%% liczenie N
N = ret_N(phi,a,e2); 
Nl = ret_N(phiB,a,e2);

%% liczenie xyz samolotu
[x,y,z]=geo_2_xyz(phi,lambda,h,e2,N);
%[x,y,z]=geo_2_xyz2(phi,lambda,h,e2);
%% wsplrzedne lotniska xyz

[xl,yl,zl]=geo_2_xyz(phiB,lambdaB,hB,e2,Nl);
%[x,y,z]=geo_2_xyz2(phi,lambda,h,e2);
%% inicjowanie tablicy neu
n=zeros(249,1);
e=zeros(249,1);
u=zeros(249,1);
%% liczenie neu
%[n,e,u] = xyz_2_neu(lambdaB,phiB,x(1),y(1),z(1),x(1),y(1),z(1));
%[n,e,u] = xyz_2_neu(1,2,3,4,5,6,7,8);
for i = 1:249
    [n(i),e(i),u(i)] = xyz_2_neu(lambdaB,phiB,x(i),y(i),z(i),xl,yl,zl);
end

%% odwrocenie neu
n_o=zeros(249,1);
e_o=zeros(249,1);
u_o=zeros(249,1);
for i = 1:249
    n_o(i) = n(249-i+1);
    e_o(i) = e(249-i+1);
    u_o(i) = u(249-i+1);
end

%% obliczenie A,s,cos z
for i = 1:249
    s(i) = sqrt( n(i)^2 + e(i)^2 + u(i)^2);
    cos_z(i) = u(i)/s(i);
    z(i) = acosd(cos_z(i));
    tan_A(i) = e(i)/n(i);
    A(i) = atand(tan_A(i));
end

%% rysowanie trasy

geoscatter(phi, lambda, 5, 'ro')
%figure; geoplot(phi, lambda)
figure; plot3(n,e,u)
title('Układ neu');
grid on
figure; plot(s,u)
title('zaleznosc wysokosci od odleglosci');
xlabel('n');
ylabel('e');
zlabel('u');