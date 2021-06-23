%Particle Cost Update
function [ particle ] = PSOParticleCostUpdate( pop_size, particle)
    for i=1:pop_size
        %Update Particle Cost
        particle(i).Cost = fitness(particle(i).Position);
    end
end