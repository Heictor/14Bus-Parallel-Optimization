%Population Initialization
function [ particle ] = PSOPopulationInitialization( pop_size )

%Bounds
lb = 5; %Lower Bound
up = 10.7; %Upper Bound


Global.BestCost = [-1*inf]; %For minimization = inf, for maximization = -1*inf
Global.BestPosition = [0];
for i=1:pop_size
    
    %Initial Position
    fprintf('Particle %d Old Position: %f → ', i, 0)
    particle(i).Position = unifrnd(lb, up, 1, 14);
    while sum(particle(i).Position(:))>150
        particle(i).Position = unifrnd(lb, up, 1, 14);
    end
    fprintf('Particle %d New Position:\n', i)
    fprintf('%g \n',particle(i).Position(:))
    
    particle(i).Velocity(:) = zeros(1, 14);
    
    particle(i).Cost = fitness(particle(i).Position(:));
    
    
    particle(i).BestPosition(:) = particle(i).Position(:);
    particle(i).BestCost = particle(i).Cost(:);
    
%     if particle(i).BestCost < Inf
%        Global.BestCost = particle(i).BestCost;
%     end 
    
end

end