clc;
clear;
close all;

syms t y1(t) y2(t)
dy1=diff(y1,t);
dy2=diff(y2,t);

eq=[dy1==y2;
    dy2==-y1-0.125*y2];
cond=[y1(0)==1;
      y2(0)==0];

Y=dsolve(eq,cond);

pretty(Y.y1)
pretty(Y.y2)