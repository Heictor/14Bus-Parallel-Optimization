%Position Update
function [ particle ] = PSOPositionUpdate( pop_size, particle)
    for i=1:pop_size
        particle(i).Position = particle(i).Position + particle(i).Velocity;
    end
end