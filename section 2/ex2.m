clc;
clear;
close all;

syms t y(t)
dydt=diff(y,t);

eq=[dydt+2*t*y^2==0];
cond=[y(0)==0.5];

Y=dsolve(eq,cond);

figure;
fplot(Y,[-5 5])

figure;
ezplot(Y,[-5 5])

t1=-5:0.01:5;
for i=1:numel(t1)
    y1(i)=double(subs(Y,t,t1(i)));
end

figure;
plot(t1,y1)