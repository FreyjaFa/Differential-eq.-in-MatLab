clc;
clear;
close all;

syms t y(t)
dydt=diff(y,t);

eq=[dydt-abs(y)*exp(t)==2];
cond=[y(0)==2];

Y=dsolve(eq,cond);

Y
pretty(Y)
ezplot(Y,[-10,10])