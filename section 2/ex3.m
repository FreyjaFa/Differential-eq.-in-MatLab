clc;
clear;
close all;

syms t y(t) k
dydt=diff(y,t);

eq=[dydt+k*t*y^2==0];
cond=[y(0)==0.5];

Y=dsolve(eq,cond);

Y1=subs(Y,k,0.1);
Y2=subs(Y,k,1);
Y3=subs(Y,k,5);
Y4=subs(Y,k,20);

figure;
hold on
fplot(Y1,[-5,5])
fplot(Y2,[-5,5])
fplot(Y3,[-5,5])
fplot(Y4,[-5,5])

legend('k=0.1','k=1','k=5','k=20')