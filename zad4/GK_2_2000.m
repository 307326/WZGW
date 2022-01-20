function [x,y] = GK_2_2000(xgk,ygk,nr_stref)
m02000=0.999923;

x=m02000*xgk;
y=m02000*ygk+nr_stref*1000000+500000;
end