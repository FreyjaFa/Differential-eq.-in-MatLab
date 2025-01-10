function b=ABcoeff(step)

A=zeros(step);
C=zeros(step,1);

for i=1:step
    for j=1:step
        if i==1 && j==1
            A(i,j)=1;
        else
            A(i,j)=(j-1)^(i-1);
        end
    end
    C(i,1)=(-1)^(i-1)*1/i;
end

b=A\C;