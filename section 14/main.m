clc;
clear;
close all;

t=0:0.1:20;
x0=0.5;

[x1,t1]=AdamsBashforth2s_1sto(@func,t,x0);
[x2,t2]=AdamsBashforth3s_1sto(@func,t,x0);
[x3,t3]=AdamsBashforth4s_1sto(@func,t,x0);
[x4,t4]=AdamsBashforth5s_1sto(@func,t,x0);


figure;
hold on;
plot(t1,x1)
plot(t2,x2)
plot(t3,x3)
plot(t4,x4)
legend('2 step','3 step','4 step','5 step')
title('Adams Bashforth method')
xlabel('t(s)')