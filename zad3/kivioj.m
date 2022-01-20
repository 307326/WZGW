function [fi_k,la_k,Ak] = kivioj(Pfi,Plam,Ap,s)

Pfi = deg2rad(Pfi);
Plam = deg2rad(Plam);
Ap = deg2rad(Ap);

%n = s/1000;
%ds = s/n;

n = 19;
ds = s/(n);

a=6378137;
e2=0.00669438002290;
%fi=Pfi;
%la=Plam;

for i=1:n
    
    M = (a*(1-e2))/(sqrt((1-e2*(sin(Pfi)^2))^3));
    N = (a)/(sqrt(1-e2*sin(Pfi)^2));
    
    del_fi = (ds * cos(Ap))/M;
    dA= ((sin(Ap)*tan(Pfi))/N)*ds;
    sr_fi = Pfi + (1/2)*del_fi;
    sr_A = Ap + (1/2)*dA;

    Msr = (a*(1-e2))/(sqrt((1-e2*(sin(sr_fi)^2))^3));
    Nsr = (a)/(sqrt(1-e2*sin(sr_fi)^2));

    del_fi = (ds * cos(sr_A))/Msr;
    del_lam = (ds * sin(sr_A))/(Nsr*cos(sr_fi));
    dA=((sin(sr_A)*tan(sr_fi))/Nsr)*ds;
    
    Pfi = Pfi+del_fi;
    Plam = Plam+del_lam;
    Ap = Ap+dA;
end
fi_k = rad2deg(Pfi);
la_k = rad2deg(Plam);
Ak = rad2deg(Ap);
end