function xnew=CreateNeighbor(x)

    m=randi([1 3]);
    
    switch m
        case 1
            % Do Swap
            xnew=Swap(x);
            
        case 2
            % Do Reversion
            xnew=Reversion(x);
            
        case 3
            % Do Insertion
            xnew=Insertion(x);
    end


function xnew=Swap(x)

    n=numel(x);
    
    i=randsample(n,2);
    i1=i(1);
    i2=i(2);
    
    xnew=x;
    xnew([i1 i2])=x([i2 i1]);
    
end

function xnew=Reversion(x)

    n=numel(x);
    
    i=randsample(n,2);
    i1=min(i(1),i(2));
    i2=max(i(1),i(2));
    
    xnew=x;
    xnew(i1:i2)=x(i2:-1:i1);

end

function xnew=Insertion(x)

    n=numel(x);
    
    i=randsample(n,2);
    i1=i(1);
    i2=i(2);
    
    if i1<i2
        xnew=[x(1:i1-1) x(i1+1:i2) x(i1) x(i2+1:end)];
    else
        xnew=[x(1:i2) x(i1) x(i2+1:i1-1) x(i1+1:end)];
    end

end
end

function ynew=CreateNeighbor(y)

    m=randi([1 3]);
    
    switch m
        case 1
            % Do Swap
            ynew=Swap(y);
            
        case 2
            % Do Reversion
            ynew=Reversion(y);
            
        case 3
            % Do Insertion
            ynew=Insertion(y);
    end

function ynew=Swap(y)

    n=numel(y);
    
    i=randsample(n,2);
    i1=i(1);
    i2=i(2);
    
    ynew=y;
    ynew([i1 i2])=y([i2 i1]);
    
end
function ynew=Reversion(y)

    n=numel(y);
    
    i=randsample(n,2);
    i1=min(i(1),i(2));
    i2=max(i(1),i(2));
    
    ynew=y;
    ynew(i1:i2)=y(i2:-1:i1);

end


function ynew=Insertion(y)

    n=numel(y);
    
    i=randsample(n,2);
    i1=i(1);
    i2=i(2);
    
    if i1<i2
        ynew=[y(1:i1-1) y(i1+1:i2) y(i1) y(i2+1:end)];
    else
        ynew=[y(1:i2) y(i1) y(i2+1:i1-1) y(i1+1:end)];
    end

end
end
