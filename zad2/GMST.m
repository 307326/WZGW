function g = GMST(JD);
T = (JD - 2451545)/36525;

g = 280.46061837 + 360.98564736629*(JD - 2451545.0) + 0.000387933*T.^2 - T.^3/38710000;
g = mod(g, 360);
end