%generacja liczb pseudo losowych i irysowanie histogramu 

clear all; close all; clc
%%  Generacja liczb pseudolosowych

N = 1000;
x = randn(N, 1);

%% Histogram

histogram(x,50);
title('Histogram liczb pseudolosowych');
grid on;

x2 = rand(N,1);

x3 = x .^2;

figure; histogram(x3,50)

title('Histogram liczb pseudolosowych');
grid on;

