%Velocity Update
function [ particle ] = PSOVelocityUpdate( pop_size, particle, Global)

%Inertia
w = 0.1;



%Accelation Factor
c1 = 2.1;
c2 = 2;

for i=1:pop_size
    
    particle(i).Velocity = (w * particle(i).Velocity) + (c1 * rand(1) .* (particle(i).BestPosition - particle(i).Position )) + (c2 * rand(1) .* (Global.BestPosition-particle(i).Position));
    
    
end




end