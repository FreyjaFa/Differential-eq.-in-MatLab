clc;
clear;
close all;

syms t y(t) s Y
dy=diff(y,t);
d2y=diff(y,t,2);

eq=[2*d2y+3*dy^3-abs(y)*cos(t)==2];

L_eq=laplace(eq,t,s);

L_eq=subs(L_eq,[laplace(y(t), t, s), y(0), subs(diff(y(t), t), t, 0)],...
               [                  Y,    0,                         0]);

Y=solve(L_eq,Y)

y=ilaplace(Y)