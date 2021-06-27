%Velocity Update
function [ particle ] = PSOVelocityUpdate( pop_size, particle, Global)

%Inertia
w = 0.1;



%Accelation Factor
c1 = 0.3;
c2 = 0.2;

parfor i=1:pop_size
    
    fprintf('Particle %d Old Velocity: %f → ', i, particle(i).Velocity(:))
    particle(i).Velocity(:) = (w * particle(i).Velocity(:)) + (c1 * rand(1) .* (particle(i).BestPosition(:) - particle(i).Position(:) )) + (c2 * rand(1) .* (Global.BestPosition(:)-particle(i).Position(:)));
    if particle(i).Velocity(:) >= 2
        particle(i).Velocity(:) = 2;
    elseif particle(i).Velocity(:) <= -2
        particle(i).Velocity(:) = -2;
    else
        particle(i).Velocity(:) = particle(i).Velocity(:);
    end
    fprintf('Particle %d New Velocity:\n', i) 
    fprintf('%g \n',particle(i).Velocity(:))
end




end