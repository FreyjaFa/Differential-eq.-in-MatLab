clc;
clear;
close all;

syms t y1(t) y2(t) s Y1 Y2
dy1=diff(y1,t);
dy2=diff(y2,t);

eq=[dy1==y2;
    dy2==-y2+sin(t)];

L_eq=laplace(eq,t,s);

L_eq=subs(L_eq,[laplace(y1(t), t, s), laplace(y2(t), t, s), y1(0), y2(0)],...
               [                  Y1,                   Y2,     1,     2]);

Y=solve(L_eq,[Y1 Y2]);

y1=ilaplace(Y.Y1)
y2=ilaplace(Y.Y2)

%% 
syms ti yi(ti) s Yi
dyi=diff(yi,ti);
d2yi=diff(yi,ti,2);

eqi=[d2yi+dyi==sin(ti)];

L_eqi=laplace(eqi,ti,s);

L_eqi=subs(L_eqi,[laplace(yi(ti), ti, s), yi(0), subs(diff(yi(ti), ti), ti, 0)],...
                 [                    Yi,     1,                             2]);

Yi=solve(L_eqi,Yi);

yi=ilaplace(Yi)



