clc;
clear;
close all;

syms T X(T)
dX=diff(X,T);

eq=[dX==3-2*X+exp(-T)];
cond=[X(0)==1];

X=dsolve(eq,cond);

t=0:0.01:10;
n=numel(t);
x1=zeros(1,n);
for i=1:n
    x1(i)=double(subs(X,T,t(i)));
end

x0=1;
[t2,x2]=euler_1sto(@func,t,x0);
[t3,x3]=heun_1sto(@func,t,x0);
[t4,x4]=eulerbackward_1sto(@func,t,x0);
[t5,x5]=midpoint_1sto(@func,t,x0);
[t6,x6]=ralston_1sto(@func,t,x0);


figure;
hold on
plot(t,x1,'k','LineWidth',2)
plot(t2,x2,'LineWidth',2)
plot(t3,x3,'LineWidth',2)
plot(t4,x4,'LineWidth',2)
plot(t5,x5,'LineWidth',2)
plot(t6,x6,'LineWidth',2)
legend('analytical','euler','heun','euler backward','midpoint','ralston')



absE_euler=abs(x1-x2);
absE_heun=abs(x1-x3);
absE_eulerbackward=abs(x1-x4);
absE_midpoint=abs(x1-x5);
absE_ralston=abs(x1-x6);

figure;
hold on
plot(t,absE_euler)
plot(t,absE_heun)
plot(t,absE_eulerbackward)
plot(t,absE_midpoint)
plot(t,absE_ralston)
legend('euler','heun','euler backward','midpoint','ralston')

%% time
m=30;
t_euler=zeros(1,m);
t_heun=zeros(1,m);
t_eulerbackward=zeros(1,m);
t_midpoint=zeros(1,m);
t_ralston=zeros(1,m);

for i=1:m
tic;    
[t2,x2]=euler_1sto(@func,t,x0);
t_euler(i)=toc;
tic;
[t3,x3]=heun_1sto(@func,t,x0);
t_heun(i)=toc;
tic;
[t4,x4]=eulerbackward_1sto(@func,t,x0);
t_eulerbackward(i)=toc;
tic;
[t5,x5]=midpoint_1sto(@func,t,x0);
t_midpoint(i)=toc;
tic;
[t6,x6]=ralston_1sto(@func,t,x0);
t_ralston(i)=toc;
end

figure;
hold on
plot(t_euler)
plot(t_heun)
plot(t_eulerbackward)
plot(t_midpoint)
plot(t_ralston)
legend('euler','heun','euler backward','midpoint','ralston')

figure;
hold on
plot(t,absE_heun)
plot(t,absE_ralston)
legend('heun','ralston')

figure;
hold on
plot(t_heun)
plot(t_ralston)
legend('heun','ralston')
