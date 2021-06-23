%Personal Best Update
function [ particle ] = PSOPersonalBestUpdate( pop_size, particle)
    for i=1:pop_size
        %Update Personal Best
        if particle(i).Cost<particle(i).BestCost
            particle(i).BestPosition = particle(i).Position;
            particle(i).BestCost = particle(i).Cost;
        end
    end
end