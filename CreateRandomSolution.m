function [q,qq]=CreateRandomSolution(model)
    
    J=model.J;
    h=model.h;
    I=model.I;
    hh=model.hh;
    q=randperm(J+h-1);
    qq=randperm(I+hh-1);
    qqq=zeros(1,J);
    for i=1:J
        qqq(i)=randi(2)-1;
    end
end