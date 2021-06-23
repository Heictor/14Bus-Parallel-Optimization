close all;
clear all;
clc;

%rng default;


pop_size = 3; %Population Size
cycles = 1; %Quantity of cicles (iterations)


%Inertia
w = 1;

%Accelation Factors
c1 = 1.5;
c2 = 2.0;

%Setting Initial Variable (Struct with parameters)
Initial.Pos = []; %Position
Initial.Cost = []; %Cost
Initial.Vel = []; %Velocity
Initial.BPos = []; %Best Position
Initial.BestCost = []; %Best Cost

%Setting Global Variable (Struct with parameters)
Global.BestCost = inf;
Global.BestPosition = [0];

%Initializing the population
[particle] = PSOPopulationInitialization(pop_size);

%particle = repmat(Initial,pop_size,1)


[particle] = PSOVelocityUpdate( pop_size, particle, Global );
for i=1:cycles

    for j=1:pop_size
       fprintf('==========================================================\n')
       fprintf('Particle %d:\n', j)
       
       fprintf('Old Position: %f → ', particle(j).Position)
       [particle] = PSOPositionUpdate( pop_size, particle );
       fprintf('New Position: %f\n', particle(j).Position)
       
       fprintf('Old Velocity: %f → ', particle(j).Velocity)
       [particle] = PSOVelocityUpdate( pop_size, particle, Global );
       fprintf('New Velocity: %f\n', particle(j).Velocity)
       
       fprintf('Old Cost: %f → ', particle(j).Cost)
       [particle] = PSOParticleCostUpdate( pop_size, particle );
       fprintf('New Cost: %f\n', particle(j).Cost)

       [particle] = PSOPersonalBestUpdate( pop_size, particle );
       fprintf('New Personal Best: %f\n', particle(j).BestCost)
       [particle] = PSOGlobalBestUpdate( pop_size, particle, Global );
       fprintf('New Global Best: %f\n', Global.BestCost)
       
       fprintf('New Personal Best: %f\n', particle(j).Cost)

    end
end




