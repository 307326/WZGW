clear;

P_fi(1)=50.25;
P_lam(1)=20.75;

P_fi(2)=50.00;
P_lam(2)=20.75;

P_fi(3)=50.25;
P_lam(3)=21.25;

P_fi(4)=50.00;
P_lam(4)=21.25;

%P_fi(5)=50.125270448626;
%P_lam(5)=21.000651087970;

P_fi(6)=50+7/60+30.97/3600;
P_lam(6)=21+2.34/3600;

P_fi(5)=50.1250;
P_lam(5)=21.00;

%%

for i = 1:6
    L0=19;
    [xgk(i),ygk(i)] = FL_2_GK(P_fi(i),P_lam(i),L0);
    [x92p(i),y92p(i)] = GK_2_92(xgk(i),ygk(i));
    
    %[mgk(i)] = ret_mgk(ygk(i),P_fi(i));
    [mgk(i)] = ret_mgk2(P_lam(i),L0,P_fi(i));

    zgk(i) = mgk(i) - 1;
    pgk(i) = mgk(i)^2;
    Zpgk(i) = pgk(i) -1;

    m92(i)=0.9993*mgk(i);
    z92(i)=m92(i)-1;
    
    p92(i) = (0.9993^2)*(mgk(i)^2);
    Zp92(i)=p92(i)-1;
    
    L0=21;
    [xgk2(i),ygk2(i)] = FL_2_GK(P_fi(i),P_lam(i),L0);

    [x2000p(i),y2000p(i)] = GK_2_2000(xgk2(i),ygk2(i),7);

    %[mgk_p2(i)] = ret_mgk(ygk(i),P_fi(i));
    [mgk_p2(i)] = ret_mgk2(P_lam(i),L0,P_fi(i));
    
    m2000(i)=0.999923*mgk_p2(i);
    z2000(i) = m2000(i) - 1;
    p2000(i) = (0.999923^2)*(mgk_p2(i)^2);
    Zp2000(i)=p2000(i)-1;
end

Pgk = pole(xgk(1),ygk(1),xgk(2),ygk(2),xgk(3),ygk(3),xgk(4),ygk(4));
P92 = pole(x92p(1),y92p(1),x92p(2),y92p(2),x92p(3),y92p(3),x92p(4),y92p(4));
P2000 = pole(x2000p(1),y2000p(1),x2000p(2),y2000p(2),x2000p(3),y2000p(3),x2000p(4),y2000p(4));


