clear;
Pfi=50 + 15/60;
Plam=20 + 45/60;

PfiA=50.25;
PlamA=20.75;

PfiB=50.00;
PlamB=20.75;

PfiC=50.25;
PlamC=21.25;

PfiD=50.00;
PlamD=21.25;

PfiS=50.1250;
PlamS=21.00;

PfiSr=50+7/60+30.97/3600;
PlamSr=21+2.34/3600;



h=100;
e2 = 0.00669438002290;
a = 6378137;

%%
[xA,yA,zA] = geo_2_xyz(PfiA,PlamA,h,e2);

[xtA,ytA,ztA] = transform(xA,yA,zA);

[fiA, lamA, hA] = Hirvonen(xtA,ytA,ztA);

%%
[xB,yB,zB] = geo_2_xyz(PfiB,PlamB,h,e2);

[xtB,ytB,ztB] = transform(xB,yB,zB);

[fiB, lamB, hB] = Hirvonen(xtB,ytB,ztB);

%%
[xC,yC,zC] = geo_2_xyz(PfiC,PlamC,h,e2);

[xtC,ytC,ztC] = transform(xC,yC,zC);

[fiC, lamC, hC] = Hirvonen(xtC,ytC,ztC);

%%
[xD,yD,zD] = geo_2_xyz(PfiD,PlamD,h,e2);

[xtD,ytD,ztD] = transform(xD,yD,zD);

[fiD, lamD, hD] = Hirvonen(xtD,ytD,ztD);

%%
[xS,yS,zS] = geo_2_xyz(PfiS,PlamS,h,e2);

[xtS,ytS,ztS] = transform(xS,yS,zS);

[fiS, lamS, hS] = Hirvonen(xtS,ytS,ztS);

%%
[xSr,ySr,zSr] = geo_2_xyz(PfiSr,PlamSr,h,e2);

[xtSr,ytSr,ztSr] = transform(xSr,ySr,zSr);

[fiSr, lamSr, hSr] = Hirvonen(xtSr,ytSr,ztSr);