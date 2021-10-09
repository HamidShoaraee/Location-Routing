clc;
clear;
close all;
tic;
global NFE;
NFE=0;

%% Problem Definition

model=SelectModel();                % Select Model of the Problem

CostFunction=@(q,qq)Mycost(q,qq,model);    % Cost Function


%% SA Parameters

MaxIt=800;      % Maximum Number of outer Iterations (Loope khareji)

MaxIt2=100;      % Maximum Number of Inner Iterations (Loope dakheli)

T0=80;          % Initial Temperature

alpha=0.9;     % Temperature Damping Rate      (Farayande kahesh dama arom anjam she)


%% Initialization

% Create Initial Solution
   
    [x.Position, y.Position]= CreateRandomSolution(model);
    [z.Cost, z.Sol]=CostFunction(x.Position, y.Position);
    
% Update Best Solution Ever Found 
        BestSol=z;

% Array to Hold Best Cost Values
BestCost=zeros(MaxIt,1);

% Array to Hold NFEs
nfe=zeros(MaxIt,1);

% Set Initial Temperature
T=T0;


%% SA Main Loop

for it=1:MaxIt
    for it2=1:MaxIt2
        
        % Create Neighbor
             xnew.Position= CreateNeighbor(x.Position);
            ynew.Position= CreateNeighbor(y.Position);
           [znew.Cost, znew.Sol]=CostFunction(xnew.Position, ynew.Position);
          
        
        if znew.Cost<=z.Cost
            % xnew is better, so it is accepted
            z=znew;
            
        else
            % xnew is not better, so it is accepted conditionally
            delta=znew.Cost-z.Cost;
            p=exp(-delta/T);
            
            if rand<=p
                z=znew;
            end
            
        end
         
        
        
        % Update Best Solution
        if z.Cost<=BestSol.Cost
            BestSol=z;
        end
        
    end
    
    % Store Best Cost
    BestCost(it)=BestSol.Cost;
     
    %Display Iteration Information
 if BestSol.Sol.IsFeasible
      FLAG=' *';
    else
        FLAG='';
 end
    display(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it)) FLAG]);
 
    % Reduce Temperature
    T=alpha*T;
    
  end 
%% Results

figure;
plot(nfe,BestCost,'LineWidth',2);
xlabel('NFE');
ylabel('Best Cost');

zaman=toc;
zeco=BestSol.Sol.D1Total+BestSol.Sol.D2Total+BestSol.Sol.Counth*2000+BestSol.Sol.Counthh*200;
Zenviro=BestSol.Cost-zeco;