function [t,x]=heun_1sto(f,t,x0)

n=numel(t);
x=zeros(1,n);
x(1,1)=x0;

for i=2:n
    h=t(i)-t(i-1);
    k1=f(t(i-1),x(1,i-1));
    k2=f(t(i),x(1,i-1)+h*k1);
    x(1,i)=x(1,i-1)+h*(k1+k2)/2;
end

end