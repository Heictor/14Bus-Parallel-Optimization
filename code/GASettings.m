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
    number_of_variables , ...     % O número de parâmetros para resolver o problema
    fitness_function , ...        % Nome da função Fitness
    population_size , ...         % Tamanho daa população (número de indivíduos em cada geração)
    parent_number , ...           % Número de inivíduos mantidos em cada geração (exceto pelas mutações)
    mutation_rate , ...           % Probabilidade de mutação
    maximal_generation , ...      % maximum evolution algebra
    minimal_cost, ...             % Minímo valor de mudança (the smaller the function value, the higher the fitness)
    population ...
) 

% format long
% rng default
%% Criação das Variáveis Iniciais

cumulative_probabilities = cumsum((parent_number:- 1 : 1 ) / sum(parent_number:- 1 : 1 ));

%POPULAÇÃO INICIAL

    %Para população começando de forma aleatória
        % Cria uma matriz NxM, sendo N = O tamanho da população, e M = Quantidade
        % de variáveis. A matriz vai ser composta de valores aleatórios
        % entre -100 e 100
        %population = -100 + (100+100)*rand([population_size, number_of_variables]);
        pop = population; %pop irá salvar todas as populações geradas ao longo da execução


    %Para população de ínicio definido
        population = repelem(population,population_size,number_of_variables);
        %pop = population;
        % Cria uma matriz NxM, sendo N = O tamanho da população, e M = Quantidade
        % de variáveis. A matriz vai ser composta da repetição dos valores
        % iniciais, ou seja, valores dos pais.

    % Melhores fitness
        % first_fitness = feval('my_fitness',[-5.777057566444397e+06 -2.316175794493771e+07]);
        %A Linha abaixo define o primeiro valor de fitness com base na
        %primeira geração
        first_fitness = feval('GAFitness',...
            [population(1,1)...
             population(1,2)...
             population(1,3)...
             population(1,4)...
             population(1,5)...
             population(1,6)...
             population(1,7)...
             population(1,8)...
             population(1,9)...
             population(1,10)...
             population(1,11)...
             population(1,12)...
             population(1,13)...
             population(1,14)...
             ]);

    %Criação de um vetor vazio que vai salvar os valores de fitness
        best_fitness = [];
        best_fitness = [best_fitness; first_fitness]; %Melhores Valores de Fitness
        worst_fitness = []; %Piores Valores de Fitness
        worst_fitness = [worst_fitness; first_fitness];
        mean_fitness = []; %Valores Médios de Fitness ((best+worst)/2)
        mean_fitness = [mean_fitness; first_fitness];
    % Número de Crianças
        % Número de crianças que serão geradas em cada geração
        child_number = population_size - parent_number; 

    %Elite
        elite = zeros(maximal_generation, number_of_variables);

    generation = 0;
    last_generation = 0;
    cost = 0;
    population_fitness = [];
    index = 0;
    costo = 0;
    pop = [];
    pop_fitness = [];
    generation_fitness = [];
    population_cost = [];
    population_index = [];
    pop_total = [];

%%
%rng('shuffle')
% Loop For da primeira geração até a última
for i = 1:1:maximal_generation
    %O próximo Loop For irá chegar cada indivíduo dentro a geração "i"
    %atual e salvar os valores de fitness deles
    for k = 1:1:population_size
        %population_fitness irá salvar os valores de fitness de cada indivíduo
        %dentro da geração atual. Portanto este variável vai armazenar os
        %valores de fitness de toda a população de todas as gerações ao
        %longo da execução
        population_fitness = [population_fitness; feval(fitness_function, [population(k,1)...
                                                                           population(k,2)...
                                                                           population(k,3)...
                                                                           population(k,4)...
                                                                           population(k,5)...
                                                                           population(k,6)...
                                                                           population(k,7)...
                                                                           population(k,8)...
                                                                           population(k,9)...
                                                                           population(k,10)...
                                                                           population(k,11)...
                                                                           population(k,12)...
                                                                           population(k,13)...
                                                                           population(k,14)...
                                                                           ])]; 
        
        pop = [pop; [population(1,1) population(1,2)]]; %Todos os individuos de todas as gerações
        
        % FAZER UMA MATRIZ COM VALORES MÉDIOS E PIORES VALORES DE FITNESS
        
        %Matrix que armazena os valores de fitness de cada indivíduo na
        %geração "i" atual
        generation_fitness(k,:) = feval(fitness_function, [population(k,1)...
                                                                           population(1,2)...
                                                                           population(1,3)...
                                                                           population(1,4)...
                                                                           population(1,5)...
                                                                           population(1,6)...
                                                                           population(1,7)...
                                                                           population(1,8)...
                                                                           population(1,9)...
                                                                           population(1,10)...
                                                                           population(1,11)...
                                                                           population(1,12)...
                                                                           population(1,13)...
                                                                           population(1,14)...
                                                                           
                                                                           ]);
        [cost, index] = sort(generation_fitness);
        cost(length(cost));
        index(length(index));
        population(index(length(index)),:);
        
          
    end
    
    [population_cost, population_index] = sort(population_fitness);
    
    
    %Melhor valor de fitness em cada geração 
    best_fitness = [best_fitness; cost(length(cost))];
    worst_fitness = [worst_fitness; cost(1)];
    mean_fitness =  (best_fitness+worst_fitness)/2;
    
    %Cruzamento das Indivíduos
    for child=1:2:child_number
        %PEGAR MÃE E PAI DOS MELHORES VALORES OU MÉDIOS
        %i+100
        mother = population(50,:);
        %mother = population( ceil((length(population))),: );
        father = population(50+1,:);
        %father = population( ceil((length(population)-1)),: );
       
        %mother = find(cumulative_probabilities > rand, 1 ) % choose a better mother
        %father = find(cumulative_probabilities > rand, 1 ) % choose a better father

        crossover_point = ceil(rand*number_of_variables);
        
        mask1 = [ones( 1 , crossover_point), zeros( 1 , number_of_variables - crossover_point)];
        mask2 = not(mask1) ;
        
        % Get 4 separate chromosomes
        % Attention is.*
        %mother_1 = mask1 .* population(mother, :); % The front part of the mother chromosome
        %mother_2 = mask2 .* population(mother, :); % The posterior part of the mother chromosome
        
        %father_1 = mask1 .* population(father, :); % The first part of the father's chromosome
        %father_2 = mask2 .* population(father, :); % The latter part of the father's chromosome
        %Minha implementação
        %mask1 = [1 0];
        %mask2 = [0 1]; 
        mother_1 = mask1 .* mother; % The front part of the mother chromosome
        mother_2 = mask2 .* mother; % The posterior part of the mother chromosome
         
        father_1 = mask1 .* father; % The front part of the mother chromosome
        father_2 = mask2 .* father; % The posterior part of the mother chromosome 
       
        population(parent_number + child, :) = mother_1 + father_2; % a child
        population(parent_number+child+ 1 , :) = mother_2 + father_1;
    end    
    
    % Chromosome variation starts
    % Variation population
    mutation_population = population( 1 :population_size, :); % elites do not participate in mutation, so start from 2
    
    number_of_elements = (population_size -  1 ) * number_of_variables; % number of all genes that may be muted
    number_of_mutations = ceil(number_of_elements * mutation_rate); % The number of mutated genes (total number of genes * mutation rate)
    
    % rand(1, number_of_mutations) Generate a matrix of number_of_mutations random numbers (range 0-1) (1*number_of_mutations)
    %After multiplication, each element of the matrix represents the position of the changed gene (the one-dimensional coordinate of the element in the matrix)
    mutation_points = ceil(number_of_elements * rand( 1 , number_of_mutations)); % determine the gene to be mutated
    
    % The selected genes are replaced by a random number to complete the mutation
    mutation_population(mutation_points) = rand( 1 , number_of_mutations);
    
    population( 1 :population_size, :) = mutation_population; % population after mutation
    pop_fitness = [pop_fitness ; feval(fitness_function, [pop(i:i*14,1) pop(i:i*14,2)])];
    %pop = [pop; population];
%   % Variation population
%   mutation_population = population( 1 :population_size, :); % elites do not participate in mutation, so start from 2
%    
%   number_of_elements = (population_size ) * number_of_variables; % number of all genes
%   number_of_mutations = ceil(number_of_elements * mutation_rate); % The number of mutated genes (total number of genes * mutation rate)
%   
%   % rand(1, number_of_mutations) Generate a matrix of number_of_mutations random numbers (range 0-1) (1*number_of_mutations)
%   %After multiplication, each element of the matrix represents the position of the changed gene (the one-dimensional coordinate of the element in the matrix)
%   mutation_points = ceil(number_of_elements * rand( 1 , number_of_mutations)); % determine the gene to be mutated
%     
%   % The selected genes are replaced by a random number to complete the mutation
%   mutation_population(mutation_points) = rand( 1 , number_of_mutations); % Perform mutation operations on selected genes
%   population( 1 :population_size, :) = mutation_population
    %Atualização da População
    
    %population = 0.5 + (1+1)*rand([population_size, number_of_variables]);
    %population = population+(0.01+(0.01+0.01)*rand)
 
end

    %pop_total(p) = best_fitness;
%disp("A tabela abaixo exibe informações sobre as variáveis utilizadas");
%whos;
% generation_fitness = population_fitness(i-3:i,1);
% [cost, index] = sort(generation_fitness);

