%Particle Cost Update
function [ particle ] = PSOParticleCostUpdate( pop_size, particle, Global)
    for i=1:pop_size
        %Update Particle Cost
        fprintf('Particle %d Old Cost: %f → ', i, particle(i).Cost(:))
        
        particle(i).Cost(:) = fitness(particle(i).Position(:));
%         while particle(i).Cost(:)>5.8945e+03
%             [particle] = PSOPositionUpdate( pop_size, particle);
%             [particle] = PSOVelocityUpdate( pop_size, particle, Global );
%             particle(i).Cost(:) = fitness(particle(i).Position(:));
%         end
        fprintf('Particle %d New Cost: %f\n', i)
        fprintf('%g \n',particle(i).Cost(:))
    end
end