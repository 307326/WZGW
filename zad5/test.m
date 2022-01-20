clear;
e2 = 0.00669438002290;
a = 6378137;
Pfi=52;
Plam=20;
h=100;

N = ret_N(Pfi,a,e2);
[x,y,z] = geo_2_xyz(Pfi,Plam,h,e2,N);

r = sqrt(x^2+y^2);
fi= atan((z/(r*(1-e2))));


eps = deg2rad(0.00005/3600);
while 1
    N = a / sqrt(1-e2*(sin(fi)^2));
    h = (r/cos(fi)) - N;
    
    fi2=atan((z/r)* (1-e2*(N/(N+h)))^-1);

    if( abs((fi2-fi))<eps)
        break
    end
    fi=fi2;
end
lam=atan(y/x);
N=a/sqrt(1-e2*(sin(fi)^2));
h=(r/cos(fi))-N;


xk=(N+h)*cos(fi)*cos(lam);
yk=(N+h)*cos(fi)*sin(lam);
zk=(N*(1-e2)+h)*sin(fi);
