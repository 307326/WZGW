function [t] = katgodz(y,d,m,h,lambda,alfa)
jd = julday(y,m,d,0); %dni
g = GMST(jd); %stopnie
UT1 = h*1.002737909350795; %godziny
%obliczenie czasu gwiazdowego(w stopniach)
S = UT1*15 + lambda + g;
%obliczenie kąta godzinnego(w stopniach)
t = S - alfa*15;
end