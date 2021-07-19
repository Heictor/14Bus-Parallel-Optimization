%Personal Best Update
function [ particle ] = PSOPersonalBestUpdate( pop_size, particle)
    parfor i=1:pop_size
        %Update Personal Best
        fprintf('Particle %d Old Best : \n Position:\n', i)
        fprintf('%g \n',particle(i).Position(:))
        fprintf('Cost:\n')
        fprintf('%g \n', particle(i).BestCost(:))
        if particle(i).Cost(:)<particle(i).BestCost(:)
            particle(i).BestPosition(:) = particle(i).Position(:);
            particle(i).BestCost(:) = particle(i).Cost(:);
        end
        fprintf('Particle %d New Best : \n Position:\n', i)
        fprintf('%g \n',particle(i).Position(:))
        fprintf('Cost:\n')
        fprintf('%g \n', particle(i).BestCost(:))
    end
end