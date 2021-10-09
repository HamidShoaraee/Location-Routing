function [z,Sol]=Mycost(q,qq,model)

 global NFE;
    NFE=NFE+1;

CostCo2h=7.04;
CostCo2hh=4.15;
CostVehicleh=2000;
CostVehiclehh=200;

Sol=ParseSolution(q,qq,model);
zeco=Sol.D1Total+Sol.D2Total+CostVehicleh*Sol.Counth+CostVehiclehh*Sol.Counthh;
zenvo=CostCo2h*Sol.AT1Sum++CostCo2hh*Sol.AT2Sum;
z3=zeco+zenvo;
beta=10;
z=z3*(1+beta*Sol.A);


end 