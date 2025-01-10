clc;
clear;
close all;

t1=0:0.5:10;
t2=0:0.1:10;
t3=0:0.01:10;
x0=1;

[t1,x1]=euler_1sto(@func,t1,x0);
[t2,x2]=euler_1sto(@func,t2,x0);
[t3,x3]=euler_1sto(@func,t3,x0);

figure;
hold on
plot(t1,x1)
plot(t2,x2)
plot(t3,x3)
legend('h=0.5','h=0.1', 'h=0.01')
xlabel('t(s)')
ylabel('x')
