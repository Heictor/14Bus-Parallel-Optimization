% close all;
% clear all;
clc;

%rng default;


pop_size = 2; %Population Size
cycles = 2; %Quantity of cicles (iterations)


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
Global.BestCost = -1*inf;
Global.BestPosition = [0];

fprintf('==========================================================\n')
fprintf('INITIAL POPULATION \n')
%Initializing the population
[particle] = PSOPopulationInitialization(pop_size);



[particle] = PSOVelocityUpdate( pop_size, particle, Global );

for i=1:1:cycles

    
       fprintf('==========================================================\n')
       fprintf('Cycle %d:\n', i)
       
       fprintf('==========================================================\n')
       fprintf('Position Update %d:\n', i)
       [particle] = PSOPositionUpdate( pop_size, particle);
       
       fprintf('==========================================================\n')
       fprintf('Velocity Update %d:\n', i)
       [particle] = PSOVelocityUpdate( pop_size, particle, Global );
       
       
       fprintf('==========================================================\n')
       fprintf('Fitness Update %d:\n', i)
       [particle] = PSOParticleCostUpdate( pop_size, particle, Global );
       
       fprintf('==========================================================\n')
       fprintf('PBest Update %d:\n', i)
       [particle] = PSOPersonalBestUpdate( pop_size, particle );
       
       fprintf('==========================================================\n')
       fprintf('Old Global Best Position: \n')
       fprintf('%g \n',Global.BestPosition(:))
       fprintf('New Global Best Cost: \n ')
       fprintf('%g \n',Global.BestCost(:))
       [Global] = PSOGlobalBestUpdate( pop_size, particle, Global );
       fprintf('New Global Best Position: \n')
       fprintf('%g \n',Global.BestPosition(:))
       fprintf('New Global Best Cost: \n ')
       fprintf('%g \n',Global.BestCost(:))
       
       %fprintf('New Personal Best: %f\n', particle(:).Cost)

        
end


% figure(1)
% hold on
% x = -800:.1:800;
% y = 2239+23.02.*x+0.009.*x.^2;
% plot(x,y)
% scatter( [ particle(:).Position ] , [particle(:).Cost] )
% scatter(Global.BestPosition, Global.BestCost,500,'k','o')
% axis([-10 160 0 6175])
% grid on
% hold off

