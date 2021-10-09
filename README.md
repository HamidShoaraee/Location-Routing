# Location-Routing
Where is the location of the depot? 
 
This project is part of my Thesis in M.Sc of Industrial Engineering. This project ended up with my thesis and I want to share some information here. I am thinking about the extension of this project and solving this problem with real-world data with help of Machine Learning solutions. 

**Location-Routing Problem (LRP)**
LRP is the complicated version of the Vehicle Routing Problem (VRP) and Travel Salesman Problem (TSP). In LRP the agent(salesman) wants to simultaneously select a location among potential sites and establishing delivery routes. In this project, we want to find the best sub-depot, like a satellite, by minimizing the total cost of the system. The model also considers the time of travel, as the speed of the vehicle influences the amount of CO2 emission and fuel economy. Finally, the model selects the best sub-depots as satellites that connect the main depot to customers in two separate echelons. The model is consists of two vital decisions as strategical planning decisions and operational planning decisions. Strategical planning decisions are determining the number and location of sub-depots as a satellite
and operational decisions planning is routing heterogeneous fleet in two echelons to make deliveries to customers.
for solving this problem we cast a *mathematical formulation* based on Integer Linear Programming as you can find this formulation on the **ILP.PDF** file. 

For solving this ILP model we solve with help CPLEX optimizer and General Algebraic Modeling System (GMAS). You can find the Solver.~gm. 






