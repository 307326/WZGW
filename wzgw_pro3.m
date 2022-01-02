clear;
Fi_a =50.25;
La_a =20.75;

Fi_b =50;
La_b =21.25;

[s,Az,Az2] = vincent(Fi_a, La_a, Fi_b, La_b);
[fi_k,la_k,Ak] = kivioj(Fi_a,La_a,Az,s);