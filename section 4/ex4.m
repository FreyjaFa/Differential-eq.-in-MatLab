clc;
clear;
close all;

syms t y(t) g(t) s Y
dy=diff(y,t);
d2y=diff(y,t,2);

g(t)=5*(heaviside(t-2)-heaviside(t-10));

eq=[2*d2y+dy+2*y==g(t)];

L_eq=laplace(eq,t,s);

L_eq=subs(L_eq,[laplace(y(t), t, s), y(0), subs(diff(y(t), t), t, 0)],...
               [                  Y,    0,                         0]);
Y=solve(L_eq,Y);

y=ilaplace(Y);

pretty(y);

t=0:0.01:20;
ysol=eval(vectorize(y));
G=eval(vectorize(g));

figure;
hold on;
plot(t,ysol)
plot(t,G)
legend('y(t)','g(t)')
xlabel('t(s)')