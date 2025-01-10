function [x,t]=milne_1sto(f,t,x0)

n=numel(t);
x=zeros(1,n);

x(1,1)=x0;

h1=t(2)-t(1);
x(1,2)=x(1,1)+h1*f(t(1),x(1,1));
h2=t(3)-t(2);
x(1,3)=x(1,2)+h2*(3*f(t(2),x(1,2))/2-f(t(1),x(1,1))/2);

for i=1:n-3
    h=t(i+3)-t(i+2);
    x(1,i+3)=x(1,i)+4*h*(2*f(t(i),x(1,i))-f(t(i+1),x(1,i+1))+2*f(t(i+2),x(1,i+2)))/3; %predictor
    x(1,i+3)=x(1,i+1)+h*(f(t(i+1),x(1,i+1))+4*f(t(i+2),x(1,i+2))+f(t(i+3),x(1,i+3)))/3; %corrector
end