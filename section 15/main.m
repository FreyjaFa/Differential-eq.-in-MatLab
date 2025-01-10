clc;
clear;
close all;

x0=1;
t=0:0.001:4;

[x,t]=milne_1sto(@func,t,x0);
[x1,t1]=AdamsBashforth2s_1sto(@func,t,x0);

figure;
hold on
plot(t,x)
plot(t1,x1)

figure;
plot(t,abs(x-x1))

