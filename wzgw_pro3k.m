%% przykladowe dasne
clear;

s = 10000;
n = 10;
ds = s/n;
a=6378137;
e2=0.00669438002290; %sprawdzic
Pfi = 40;
Plam = 40;
Ap=50; 
fi=Pfi;
la=Plam;

%% algorytm petla 
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
%% algorytm dalsza czesc
fi_k = Pfi+fi;
la_k = Plam+la;
Ak = Ap; %sprawdzic 
