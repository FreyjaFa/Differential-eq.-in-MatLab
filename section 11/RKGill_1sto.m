function [t,x]=RKGill_1sto(f,t,x0)

n=numel(t);
x=zeros(1,n);
x(1,1)=x0;
a=(sqrt(2)-1)/2;
b=(2-sqrt(2))/2;
c=-sqrt(2)/2;
d=1+sqrt(2)/2;

for i=2:n
    h=t(i)-t(i-1);
    k1=f(t(i-1)     , x(1,i-1)              );
    k2=f(t(i-1)+h/2 , x(1,i-1)+h*k1/2       );
    k3=f(t(i-1)+h/2 , x(1,i-1)+h*(a*k1+b*k2));
    k4=f(t(i-1)+h   , x(1,i-1)+h*(c*k2+d*k3));
    x(1,i)=x(1,i-1)+h*(k1+2*k2+2*k3+k4)/6;
end
end