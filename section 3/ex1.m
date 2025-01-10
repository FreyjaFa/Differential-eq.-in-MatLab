clc;
clear;
close all;

syms t u(t)
du=diff(u,t);
d2u=diff(u,t,2);

eq=[d2u+100*u==2.5*sin(10*t)];
cond=[u(0)==0;du(0)==0];

U=dsolve(eq,cond);
U2=diff(U);

%%

syms t u1(t) u2(t)
du1=diff(u1,t);
du2=diff(u2,t);

eq1=[du1==u2;
     du2==-100*u1+2.5*sin(10*t)];
cond1=[u1(0)==0;
       u2(0)==0];

U1=dsolve(eq1,cond1);

pretty(U)
pretty(U1.u1)

pretty(U2)
pretty(U1.u2)