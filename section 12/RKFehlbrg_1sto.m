function [T,x,h]=RKFehlbrg_1sto(f,t,x0,tol)

x(1,1)=x0;
T(1,1)=t(1);
T(1,2)=t(2);
h(1,1)=T(1,2)-T(1,1);

beta=0.95;
i=2;
while T(1,i-1)<t(end)
    k1=f(T(1,i-1)               ,x(1,i-1)                                                            );
    k2=f(T(1,i-1)+h(1,i-1)/4    ,x(1,i-1)+h(1,i-1)*k1/4                                              );
    k3=f(T(1,i-1)+3*h(1,i-1)/8  ,x(1,i-1)+h(1,i-1)*(3*k1/32+9*k2/32)                                 );
    k4=f(T(1,i-1)+12*h(1,i-1)/13,x(1,i-1)+h(1,i-1)*(1932*k1/2197-7200*k2/2197+7296*k3/2197)          );
    k5=f(T(1,i-1)+h(1,i-1)      ,x(1,i-1)+h(1,i-1)*(439*k1/216-8*k2+3680*k3/513-845*k4/4104)         );
    k6=f(T(1,i-1)+h(1,i-1)/2    ,x(1,i-1)+h(1,i-1)*(-8*k1/27+2*k2-3544*k3/2565+1859*k4/4104-11*k5/40));

    x(1,i)=x(1,i-1)+h(1,i-1)*(25*k1/216+1408*k3/2565+2197*k4/4104-k5/5);
    xstar=x(1,i-1)+h(1,i-1)*(2825*k1/27648+18575*k3/48384+13525*k4/55296+277*k5/14336+k6/4);
    
    error=abs(x(1,i)-xstar);
    if error>tol
        hnew=beta*h(1,i-1)*(tol/error)^0.2;
    else
        T(1,i)=T(1,i-1)+h(1,i-1);
        hnew=beta*h(1,i-1)*(tol/error)^0.25;
        i=i+1;
    end
    h(1,i-1)=hnew;
end
end