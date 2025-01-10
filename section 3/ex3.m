clc;
clear;
close all;

syms t y(t)
dy=diff(y,t);
d2y=diff(y,t,2);

eq=[2*d2y+3*dy^3-abs(y)*cos(100*t)==2];

Y=dsolve(eq);

pretty(Y)