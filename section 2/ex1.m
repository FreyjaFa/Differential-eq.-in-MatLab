clc;
clear;
close all;

syms t y(t)
dydt=diff(y,t);

eq=[dydt+2*t*y^2==0];

Y=dsolve(eq);