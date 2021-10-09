function Sol=ParseSolution(q,qq,model)

I=model.I;              %Moshtarian
J=model.J;              %Anbare miyani 
h=model.h;              %vasile naghliye sangin
hh=model.hh;            %Vasile naghliye sabok
d0=model.d0;            %fasele anbare miyani az anbare asli 
d1=model.d1;            %fasele har 2 anbare miyani
d2=model.d2;            %fasele 2 moshtari az ham 
d3=model.d3;            %fasele moshtari az anbare miyani 
cap=model.cap;          %Zarfiate har anbar 
ch=model.ch;            %Zarfiate vasile naghliye noe h1
chh=model.chh;          %Zarfiate Vasile naghliye noe h2
r=model.r;              %Taghaza moshtarian 
t1=model.t1;            %hade paine residan be anbare j
t2=model.t2;            %hade bala residan be anbare j
t3=model.t3;            %hade paine residan be moshtari i
t4=model.t4;            %hade bala residan be moshtari i
vh=model.vh;            %sor@te vasile naghliye noe 1
vhh=model.vhh;          %so@te vasile naghliye noe 2 


%TotalCap=model.TotalCap;
%TotalDem=model.TotalDem;

Delpos=find(q>J);     %Jaygahe delimiter ro moshkhas mikone 
From=[0 Delpos]+1;                  
To=[Delpos J+h]-1;
L=cell(h,1);          %baraye har khodro dar sathe aval ye List dorost mishe 
D=zeros(1,h);         %Tole masiri ke har khodro dar sathe daroni peymayesh mikone 
Uch=zeros(1,h);       %zarfiate estefade shode vasile naghliye aval
Uchh=zeros(1,hh);     %zarfiate estefade shode vasile naghliye Dovom
AT1=zeros(1,J);       %zamane residan be har anbare miyani  
AT2=zeros(1,I);       %zamane residan be har moshtari
Counth=0;
Counthh=0;

for h=1:h             %baraye har khodro dar sathe daroni List injori por mishe 
    
    L{h}=q(From(h):To(h));       %Liste noghati ke har vasile naghliye sar mizane 
    
     if ~isempty(L{h})
    Counth=Counth+1;          
          D(h)=d0(L{h}(1));      %Fasele Avalin ozve List ba Anbare Asli
          
          for k=1:numel(L{h})
              AT1(L{h}(k))=D(h)/vh(h);     %zamane residan be har anbare miyani
              AT1max=max(AT1);             %Maximum zamane peymodane tour ha dar sathe 1
            
              if k<numel(L{h})
                D(h)=D(h)+d1(L{h}(k),L{h}(k+1));  %Fasele ye ozv az List ba ozve badi 
              end
                 D(h)=D(h)+d0(L{h}(end));    %Fasele akharin ozve list ba noghte shoro 
          end
         
         Uch(h)=sum(cap(L{h}));        %Mizane Bari ke h bar asase zarfiate anbar mibarad   
     end       
          
end

AT1Sum=sum(AT1);


 
Delpos1=find ((qq)<=I);                         %Moshtarin 
Delpose2=find((qq)>I & (qq)<=I+hh);             %Vasile naghliye sathe bironi
Delpose3=find(I+hh<(qq) & (qq)<=I+J+hh);        % Anbar miyani 

LL=cell(1,hh);                              %Tour Sathe Bironi
D2=zeros(1,hh);                             %Kole masafate peymode shode dar sathe bironi

From=[0 Delpose2]+1;
To=  [Delpose2 I+hh]-1;


for hh=1:hh
        LL{hh}=qq(From(hh): To(hh));       %Masir dar sathe bironi 
           
        if ~isempty(LL{hh}) 
            Counthh=Counthh+1;
               D2(hh)= d3(LL{hh}(1));                        
             
            for k=1:numel(LL{hh}) 
               
                AT2(LL{hh}(k))=AT1max+D2(hh)/vhh(hh);    %bayad be ezafe AT1 beshe ((moshkel dare ))
            if k<numel(LL{hh})
                D2(hh)=D2(hh)+d2(LL{hh}(k),LL{hh}(k+1));
            end
                D2(hh)=D2(hh)+d3(LL{hh}(end));
         
            end
                Uchh(hh)=sum(r(LL{hh}));  %mizan bari ke vasile naghliye noe 2 bar asase taghaza mibare                         
        end
      
end
 AT2Sum=sum(AT2);


TWV1=zeros(1,J);
TWV2=zeros(1,I);
for j=1:J
    
    TWV1(j)=max([0 1-AT1(j)/t1(j) AT1(j)/t2(j)-1]);
end 
for i=1:I
    TWV2(i)=max([0 1-AT2(i)/t3(i) AT2(i)/t4(i)-1]);
    
    
end 
             
meanTWV1=mean(TWV1);
meanTWV2=mean(TWV2);



             CVh=max(Uch./ch-1,0);
             CVhh=max(Uchh./chh-1,0);
             meanCVh=mean(CVh);
             meanCVhh=mean(CVhh);
             A=meanCVh+meanCVhh+meanTWV1+meanTWV2;
             

                  
Sol.Delpos1=Delpos1;
Sol.Delpose2=Delpose2;
Sol.Delpose3=Delpose3;            
Sol.L=L;                    %Tour dar sathe aval 
Sol.LL=LL;                  %Tour dar sathe dovom
Sol.D=D;                    %Fasele peymode shode dar sathe aval 
Sol.D2=D2;                  %Fasele peymode shode dar sathe dovom 
Sol.D1Total=sum(D);         %Kole Masafate Tour aval
Sol.D2Total=sum(D2);        %Kole Masafate Tour Dovom
Sol.Uch=Uch;
Sol.Uchh=Uchh;
Sol.CVh=CVh;
Sol.CVhh=CVhh;
Sol.meanCVh=meanCVh;
Sol.meanCVhh=meanCVhh;
Sol.AT1=AT1;
Sol.AT1max=AT1max;
Sol.AT1Sum=AT1Sum;
Sol.AT2=AT2;
Sol.AT2Sum=AT2Sum;
Sol.TWV1=TWV1;
Sol.TWV2=TWV2;
Sol.meanTWV1=meanTWV1;
Sol.meanTWV2=meanTWV2;
Sol.Counth=Counth;
Sol.Counthh=Counthh;
Sol.A=A;
Sol.IsFeasible=(A==0);
end

