%#ok<*INUSD>
function [ best_fitness ,...
           worst_fitness,...
           mean_fitness,...
           elite , ...
           generation ,...
           last_generation,...
           cost,...
           population,...
           index,...
           costo,...
           generation_fitness,...
           population_cost,...
           population_index,...
           population_size,...
           population_fitness,...
           pop,...
           pop_fitness] = GASettings ( ...
    number_of_variables , ...     % Number of variables in each individual
    fitness_function , ...        % The function fitness
    population_size , ...         % Population size (Quantity of individuals in each generation)
    parent_number , ...           % Number of individuals kept to the next generation (Not affected by mutation)
    mutation_rate , ...           % Mutation rate on population
    maximal_generation , ...      % Max number of generations
    minimal_cost, ...             % Min difference between generations 
    population ...
) 

% format long
% rng default
%% Important Variables  Creation

%INITIAL POPULATION      

    %Setting first population
        population = repelem(population,population_size,1);
        pop = [];
        pop = [pop; population]; %pop is saving all the population through all generations

        % Start a NxM matrix, where N = Population size, and M = Number of
        % variables. The matrix is made by the repetion of the first individuals

    % Best fitness
        %The next line gets the first fitness value using the initial generation
        first_fitness = feval('GAFitness', [population(1,1:14)]);

    %Vector-sized variables to save best, worst and mean fitness
        best_fitness = [];
        best_fitness = [best_fitness; first_fitness]; %Best Fitness Values
        worst_fitness = []; %Worst Fitness Values
        worst_fitness = [worst_fitness; first_fitness];
        mean_fitness = []; %Average Fitness Values ((best+worst)/2)
        mean_fitness = [mean_fitness; first_fitness];
    % Number of childs
        % Number of childs generated at each generation
        child_number = population_size - parent_number; 

    %Elite
        elite = zeros(maximal_generation, number_of_variables);

    generation = 0;
    last_generation = 0;
    cost = 0;
    population_fitness = [];
    for k = 1:1:population_size
        population_fitness = [ population_fitness; feval( fitness_function, [ population(k,1:14) ] ) ];
    end
    index = 0;
    costo = 0;

    pop_fitness = [];
    generation_fitness = [];
    population_cost = [];
    population_index = [];
    pop_total = [];

%%
% rng('shuffle')
% For Loop - From the First untill the Last Generation
for generation = 1:1:maximal_generation
    clear generation_fitness
    for k = 1:1:population_size
        
        %Fitness values of every individual on all generations
        population_fitness = [ population_fitness; feval( fitness_function, [ population(k,1:14) ] ) ]; 
              
        generation_fitness(k,:) = feval( fitness_function, [ population(k,1:number_of_variables) ] );
        [cost, index] = sort(generation_fitness);
        %Matrix que armazena os valores de fitness de cada indivíduo na
        %geração "i" atual
          
    end
    
    [population_cost, population_index] = sort(population_fitness)
        
    %Melhor valor de fitness em cada geração 
    worst_fitness = [worst_fitness; cost(length(cost))];
    best_fitness = [best_fitness; cost(1)];
    mean_fitness =  (best_fitness+worst_fitness)/2;
    
    %Crossover
    for child=1:2:child_number
        
        %Chooses best individuals as Mother and Father (Rank Selection)
        mother = population( ceil((length(population))),: );
        father = population( ceil((length(population)-1)),: );
       
        %Set the division point of the vector from the individuals
        crossover_point = ceil(rand*number_of_variables);%One-Point Crrossover
        mask1 = [ones( 1 , crossover_point), zeros( 1 , number_of_variables - crossover_point)]; %First Half of the indiviual vector
        mask2 = not(mask1); %Last Half of the indiviual vector
        
        % Get 4 separate chromosomes
        mother_1 = mask1 .* mother; % The front part of the mother chromosome
        mother_2 = mask2 .* mother; % The posterior part of the mother chromosome
         
        father_1 = mask1 .* father; % The front part of the mother chromosome
        father_2 = mask2 .* father; % The posterior part of the mother chromosome 
       
        population(parent_number + child, :) = mother_1 + father_2; 
        population(parent_number+child+ 1 , :) = mother_2 + father_1;
    end    
    
    % Chromosome variation starts
    % Variation population
    mutation_population = population( 1 :population_size, :); % elites do not participate in mutation, so start from 2
    
    number_of_elements = (population_size) * number_of_variables; % number of all genes that may be muted
    number_of_mutations = ceil(number_of_elements * mutation_rate); % The number of mutated genes (total number of genes * mutation rate)
    
    % rand(1, number_of_mutations) Generate a matrix of number_of_mutations random numbers (range 0-1) (1*number_of_mutations)
    %After multiplication, each element of the matrix represents the position of the changed gene (the one-dimensional coordinate of the element in the matrix)
    mutation_points = ceil(number_of_elements * rand( 1 , number_of_mutations)); % determine the gene to be mutated
    
    % The selected genes are replaced by a random number to complete the mutation
    mutation_population(mutation_points) = rand( 1 , number_of_mutations);
    
    population( 1 :population_size, :) = mutation_population % population after mutation

    pop = [pop; population];
end