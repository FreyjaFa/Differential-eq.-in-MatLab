function [t,y]=euler_1sto(f,t,y0)

n=numel(t);
y=zeros(1,n);
y(1,1)=y0;

for i=2:n
    h=t(i)-t(i-1);
    y(1,i)=y(1,i-1)+h*f(t(i-1),y(1,i-1));
end

end