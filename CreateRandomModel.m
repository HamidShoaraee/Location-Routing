function model=CreateRandomModel(I,J,h,hh)     %I moshtari J anbar miyani h vasile naghliye sangin hh vasile naghliye sabok 

xd=10;
yd=10;
xmin=0;
xmax=600;
ymin=0;
ymax=400;
xsmin=200;
xsmax=400;
ysmin=200;
ysmax=400;

x=randi([xmin xmax],1,I);          %mokhtasate moshtarian
y=randi([ymin ymax],1,I);          %mokhtasate moshtarian

alpha_x=0.4;
xm=(xsmin+xsmax)/2;                      
dx=xsmax-xsmin;
x0min=round(xm-alpha_x*dx);       %hade mokhtasate ehtemali anbare miyani
x0max=round(xm+alpha_x*dx);                       

alpha_y=0.3;
ym=(ysmin+ysmax)/2;                      
dy=ysmax-ysmin;
y0min=round(ym-alpha_y*dy);     %hade mokhtasate ehtemali anbare miyani
y0max=round(ym+alpha_y*dy);

x0=randi([x0min x0max],1,J);    %mokhtasate anbare miyani 
y0=randi([y0min y0max],1,J);

d2=zeros(I,I);                  %fasele har 2 moshtari
d1=zeros(J,J);                  %fasele har 2 anbare miyani
d0=zeros(1,J);                  %fasele anbare miyani az anbare asli
d3=zeros(I,J);                  %fasele anbare miyani az moshtari


for i1=1:I
    for i2=i1+1:I
    d2(i1,i2)=sqrt((x(i1)-x(i2))^2+(y(i1)-y(i2))^2);  %fasele har 2 moshtari        
    d2(i2,i1)=d2(i1,i2);    
    end
end

for k1=1:J
    for k2=k1+1:J
    d1(k1,k2)=sqrt((x0(k1)-x0(k2))^2+(y0(k1)-y0(k2))^2);  %fasele har 2 anbare miyani           
    d1(k2,k1)=d1(k1,k2);  
    end
end 

for t1=1:J
    
   d0(t1)=sqrt((x0(t1)-xd)^2+(y0(t1)-yd)^2);  %fasele anbar miyani anbare asli                       
end

for i=1:J
   for k=1:I
       
   d3(i,k)=sqrt((x0(i)-x(k))^2+(y0(i)-y(k))^2);   %fasele anbare miyani az moshtarin     
  % d3(i,k)=d3(k,i) ;   
   end  
end


rmin=150;                                %Min Taghaza Moshtarin
rmax=400;                                %Max Taghaza Moshtarian
r=randi([rmin rmax],1,I);                
TotalDem=sum(r); 

capmin=200;                             
capmax=900; 
cap=randi([capmin capmax],1,J);         %Zarfiate anbare miyani 
Totalcap=sum(cap);


cmean=TotalDem/h;                           
cmin=round(1.5*cmean);
cmax=round(3.5*cmean);              %Zarfiate Vasile Naghliye h1 (sangin) 
ch=randi([cmin cmax],1,h);


                       
cminhh=4900;
cmaxhh=5000;                         %Zarfiate Vasile Naghliye h2 (Sabok) 
chh=randi([cminhh cmaxhh],1,hh);

        

for h=1:h
     for hh=1:hh
 
       m=randi([1 3]);        
switch m
    case 1 
        vh=randi([5 10],1,h);
        vhh=randi([12 15],1,hh);
        
    case 2
       vh=randi([10 14],1,h);
       vhh=randi([15 26],1,hh);
    
    case 3
        vh=randi([14 20],1,h);
       vhh=randi([26 47],1,hh); 
end 
     end 
end 



H1=sqrt((xsmax-xd)^2+(ysmax-yd)^2);   %tolani tarin fasele dar sathe 1
T1=H1/mean(vh);                      %tolani tarin zaman dar sathe 1
MaxTourTime1=J/h*T1;                  %tolani tarin zaman tour dar sathe 1
t1min=round(0*MaxTourTime1);
t1max=round(0.4*MaxTourTime1);
t2min=round(2.5*MaxTourTime1);
t2max=round(3*MaxTourTime1);
t1=randi([t1min t1max],1,J);
t2=randi([t2min t2max],1,J);

        H2=sqrt((xmax-xsmin)^2+(ymax-ysmin)^2);
        T2=H2/mean(vhh);
        MaxTourTime2=I/hh*T2;
        t3min=round(0.5*MaxTourTime2); 
        t3max=round(1.9*MaxTourTime2);
        t4min=round(4.8*MaxTourTime2);
        t4max=round(6.2*MaxTourTime2);
        t3=randi([t3min t3max],1,I);
        t4=randi([t4min t4max],1,I);



    model.I=I;
    model.J=J;
    model.h=h;
    model.hh=hh;
    model.xmin=xmin;
    model.xmax=xmax;
    model.ymin=ymin;
    model.ymax=ymax;
    model.xsmin=xsmin;
    model.xsmax=xsmax;
    model.ysmin=ysmin;
    model.ysmax=ysmax;
    model.x=x;
    model.y=y;
    model.x0=x0;
    model.y0=y0;
    model.xd=xd;
    model.yd=yd;
    model.d0=d0;
    model.d1=d1;
    model.d2=d2;
    model.d3=d3;
    model.cap=cap;
    model.ch=ch;
    model.chh=chh;
    model.r=r;
    model.ch=ch;
    model.chh=chh;
    model.vh=vh;
    model.vhh=vhh;
    model.t1=t1;
    model.t2=t2;
    model.t3=t3;
    model.t4=t4;
    model.TotalDem=TotalDem;
    model.Totalcap=Totalcap;
    
end

