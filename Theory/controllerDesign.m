%%
clear;
clc;
close all;
%%
s = tf('s');
%% Load Cart and Environmental Variables
cartInit;
g = 9.81;
%% Plant Transfer Function G(s)
G = 1 / (((cart.Iw + ((cart.M + cart.mp) * cart.R^2/4)) * (cart.Icc_p + cart.mp * cart.L^2) / (cart.mp * cart.L * cart.R) + (cart.mp * cart.R * cart.L / 4)) * s^2 - (cart.Iw + (cart.M + cart.mp) * cart.R^2/4) * g / cart.R);
t = 0 : 0.001 : 0.1;
figure(1);
step(G, t);
grid on;