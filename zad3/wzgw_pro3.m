clear;
Fi_a =50.25;
La_a =20.75;

Fi_d =50;
La_d =21.25;

[s,Az,Az2] = vincent(Fi_a, La_a, Fi_d, La_d);
[fi_k,la_k,Ak] = kivioj(Fi_a,La_a,Az,s/2);

pkt_sr_szer_fi = (Fi_a + Fi_d)/2;
pkt_sr_szer_lam = (La_a + La_d)/2;

[odl,Az_ps,Az2_ps] = vincent(fi_k, la_k, pkt_sr_szer_fi, pkt_sr_szer_lam);
Az_ps = Az_ps+180;
Az2_ps = Az2_ps+180;

e2=0.00669438002290;
b = 6356752.3141;
e = sqrt(e2);

lamB = deg2rad(La_d);
lamA = deg2rad(La_a);
sinPhiB = sin(deg2rad(Fi_d));
sinPhiA = sin(deg2rad(Fi_a));

P = b^2 * (lamB - lamA) / 2 * ((sinPhiB / (1 - e2 * sinPhiB^2) + 1 / (2*e) * log((1 + e * sinPhiB) / (1 - e * sinPhiB))) - (sinPhiA / (1 - e2 * sinPhiA^2) + 1 / (2*e) * log((1 + e * sinPhiA) / (1 - e * sinPhiA))));
P = abs(P);