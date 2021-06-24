%Position Update
function [ particle ] = PSOPositionUpdate( pop_size, particle)
    parfor i=1:pop_size
        fprintf('Particle %d Old Position: %f → ', i, particle(i).Position)
        auxADD = particle(i).Position+particle(i).Velocity;
        if auxADD == 0
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        elseif auxADD > 150
        particle(i).Position = particle(i).Position + (-1*particle(i).Velocity);
        elseif auxADD <= 10
        particle(i).Position = particle(i).Position + (-1*particle(i).Velocity);
        else
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        end
        fprintf('Particle %d New Position: %f\n', i, particle(i).Position)
    end
end