function [x,t]=AdamsBashforth2s_1sto(f,t,x0)
n=numel(t);
x=zeros(1,n);
x(1,1)=x0;

h1=t(2)-t(1);
x(1,2)=x(1,1)+h1*f(t(1),x(1,1));

for i=1:n-2
    h=t(i+2)-t(i+1);
    x(1,i+2)=x(1,i+1)+h*(3*f(t(i+1),x(1,i+1))/2-f(t(i),x(1,i))/2);
end