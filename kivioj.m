function [fi_k,la_k,Ak] = kivioj(Pfi,Plam,Ap,s)
n = s/1000;
ds = s/n;
a=6378137;
e2=0.00669438002290;
fi=Pfi;
la=Plam;

for i=1:n
    M = (a*(1-e2))/(sqrt((1-e2*sind(Pfi)^2)^3));
    N = (a)/(sqrt(1-e2*sind(Pfi)));
    
    del_fi = (ds * cosd(Ap))/M;
    dA= ((sind(Ap)*tand(Pfi))/N)*ds;
    
    sr_fi = Pfi + (1/2)*del_fi;
    sr_A = Ap + (1/2)*dA;

    Msr = (a*(1-e2))/(sqrt((1-e2*sind(sr_fi)^2)^3));
    Nsr = (a)/(sqrt(1-e2*sind(sr_fi)));

    del_fi = (ds * cosd(sr_A))/Msr;
    del_lam = (ds * sind(sr_A))/(Nsr*cosd(sr_fi));
    dA=((sind(sr_A)*tand(sr_fi))/Nsr)*ds;
    
    fi = fi+del_fi;
    la = la+del_lam;
    Ap=Ap+dA;
end
fi_k = fi;
la_k = la;
Ak = Ap; %sprawdzic 
end