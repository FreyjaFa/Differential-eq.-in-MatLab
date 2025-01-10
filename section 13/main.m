clc;
clear;
close all;

syms T X(T)
dXdT=diff(X,T);

eq=[dXdT+2*T*X^2==0];
cond=[X(0)==0.5];

Xanalytical=dsolve(eq,cond);

t=0:0.01:10;
x0=0.5;
[Xnumerical,t]=AdamsBashforth2s_1sto(@func,t,x0);


figure;
hold on
fplot(Xanalytical,[0,10])
plot(t,Xnumerical,'r--','LineWidth',2)
legend('Analytical','Numerical')
xlabel('t(s)')
ylabel('x')