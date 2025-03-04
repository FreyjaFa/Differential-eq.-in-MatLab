function [x,t]=AdamsBashforth4s_1sto(f,t,x0)
n=numel(t);
x=zeros(1,n);
x(1,1)=x0;

h1=t(2)-t(1);
x(1,2)=x(1,1)+h1*f(t(1),x(1,1));
h2=t(3)-t(2);
x(1,3)=x(1,2)+h2*(3*f(t(2),x(1,2))/2-f(t(1),x(1,1))/2);
h3=t(4)-t(3);
x(1,4)=x(1,3)+h3*(23*f(t(3),x(3))/12-4*f(t(2),x(2))/3+5*f(t(1),x(1))/12);
for i=1:n-4
    h=t(i+4)-t(i+3);
    x(1,i+4)=x(1,i+3)+h*(55*f(t(i+3),x(i+3))/24-59*f(t(i+2),x(i+2))/24+37*f(t(i+1),x(i+1))/24-3*f(t(i),x(i))/8);
end