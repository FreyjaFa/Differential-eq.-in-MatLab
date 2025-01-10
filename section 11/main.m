clc;
clear;
close all;

t=0:0.01:10;
x0=1;

[t,x]=RKGill_1sto(@func,t,x0);

figure;
plot(t,x)