%Particle Cost Update
function [ particle ] = PSOParticleCostUpdate( pop_size, particle)
    parfor i=1:pop_size
        %Update Particle Cost
        fprintf('Particle %d Old Cost: %f → ', i, particle(i).Cost)
        particle(i).Cost = fitness(particle(i).Position);
        fprintf('Particle %d New Cost: %f\n', i, particle(i).Cost)
    end
end