function [t,x]=RK4_1sto(f,t,x0)

n=numel(t);
x=zeros(1,n);
x(1,1)=x0;

for i=2:n
    h=t(i)-t(i-1);
    k1=f(t(i-1)     ,x(1,i-1)       );
    k2=f(t(i-1)+h/2 ,x(1,i-1)+h*k1/2);
    k3=f(t(i-1)+h/2 ,x(1,i-1)+h*k2/2);
    k4=f(t(i-1)+h   ,x(1,i-1)+h*k3  );

    x(i)=x(i-1)+h*(k1+2*k2+2*k3+k4)/6;
end
end