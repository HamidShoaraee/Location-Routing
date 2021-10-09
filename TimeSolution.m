function T=TimeSolution(q,qq,model)

d0=model.d0;     %fasele anbare miyani az anbare asli
d1=model.d1;     %fasele har 2 anbare miyani
d2=model.d2;     %fasele 2 moshtari az ham
d3=model.d3;     %fasele moshtari az anbare miyani

 
 for h=1:h
     for hh=1:hh
 
         m=randi([1 3]);        
switch m
    case 1 
        vh=randi([5 10],1,h);
        vhh=randi([12 15],1,hh);
    case 2
        
    case 3
        vh=randi([10 35],1,h);
        vhh=randi([16 47],1,hh);
end  
     end 
 end 
end 