clc;
clear;
close all;

t=0:0.1:10;
x0=1;
tol=1e-4;

[T,x,h]=RKFehlbrg_1sto(@func,t,x0,tol);

figure;
hold on
plot(T,x)
plot(T,h)
legend('x','step')