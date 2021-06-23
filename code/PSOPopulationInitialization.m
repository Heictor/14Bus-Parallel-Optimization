%Population Initialization
function [ particle ] = PSOPopulationInitialization( pop_size )

%Bounds
lb = 10; %Lower Bound
up = 150; %Upper Bound


Global.BestCost = [-1*inf]; %For minimization = inf, for maximization = -1*inf
Global.BestPosition = [0];
for i=1:pop_size
    
    %Initial Position
    particle(i).Position = unifrnd(lb, up, 1);
    particle(i).Position
    particle(i).Velocity = zeros(1);
    particle(i).Cost = fitness(particle(i).Position);
    
    
    particle(i).BestPosition = particle(i).Position;
    particle(i).BestCost = particle(i).Cost;
    
    if particle(i).BestCost < Inf
       Global.BestCost = particle(i).BestCost;
    end 
    
end

end