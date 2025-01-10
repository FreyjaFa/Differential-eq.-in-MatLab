clc;
clear;
close all;

syms t y(t) s Y
dy=diff(y,t);

eq=[dy+2*y==0];
% laplace solution
L_eq=laplace(eq,t,s)
L_eq=subs(L_eq,[laplace(y(t), t, s),y(0)],[Y,0.5])
Y=solve(L_eq,Y)

y1=ilaplace(Y)

% dsolve solution
cond=[y(0)==0.5];
y2=dsolve(eq,cond)

% plot
t=0:0.01:2.5;
Y1=eval(vectorize(y1));
Y2=eval(vectorize(y2));

figure;
hold on;
plot(t,Y1,'LineWidth',2)
plot(t,Y2,'ro-')
legend('Laplace','dsolve')
xlabel('t')
ylabel('y')

