%Global Best Update
function [ Global ] = PSOGlobalBestUpdate( pop_size, particle, Global)
    for i=1:pop_size
        %Update Global Best
        particle(i).Cost;
        if particle(i).Cost>Global.BestCost && sum(particle(i).Position(:))>0
            Global.BestPosition = particle(i).Position(:);
            Global.BestCost = particle(i).Cost(:);
        end
    end
end