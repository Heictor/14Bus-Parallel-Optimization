% clc; 
% close all;
% clear all;
%5 populações diferentes
% format long
%tStart = cputime;
%rng default

[best_fitness ,...
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
    14 ,... %Número de Variáveis
    'GAFitness' ,... %Função Fitness
    30,... %Tamanho da população
    5,... %Número de pais que permanecerão na próxima geração
    0.1 ,... %Taxa de Mutação
    100,... %Máximo de Gerações
    1.0e-4,... %Custo minímo de evolução
    sqrt(A') ...
);

% %% Gráfico para os valores e Fitness ao longo das gerações
% figure(1)
% hold on
% gera = 1:1:length(population_fitness);
% scatter(gera, population_fitness)
% grid on
% hold off
% 
%% Gráfico dos melhores fitness
figure(2)
hold on
gera = 1:1:length(best_fitness);
%title('Maiores Valores')
sz = 25;
scatter(gera, best_fitness,sz,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5)
title('Melhores Fitness')
grid on
hold off
%% Gráfico para os valores e Fitness ao longo das gerações
figure(3)
hold on
gera = 1:1:length(population_fitness);
sz = 15;
c = linspace(1,length(population_fitness),length(gera));
scatter(gera, population_fitness,sz,c,'filled')
title('Fitness dos indivíduos / Gerações')
xlabel('Indivíduos')
ylabel('Fitness')
grid on
hold off
% 
% 
%% Gráfico para os melhores, piores e médios valortes Fitness ao longo das gerações
figure(4)
hold on
gera = 1:1:length(best_fitness);
subplot(3,1,1)
title('Maiores Valores')
sz = 40;
scatter(gera, best_fitness,sz,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5)
%scatter(gera, best_fitness)
grid on
title('Melhores Valores')

subplot(3,1,2)
title('Piores Valores')
sz = 40;
scatter(gera, worst_fitness,sz,'MarkerEdgeColor',[0.6350 0.0780 0.1840],...
              'MarkerFaceColor',[1 0.0780 0.1840],...
              'LineWidth',1.5)
%scatter(gera, worst_fitness)
grid on
title('Piores Valores')

subplot(3,1,3)
title('Valores Médios')
sz = 40;
scatter(gera, mean_fitness,sz,'MarkerEdgeColor',[0.9290 0.6940 0.1250],...
              'MarkerFaceColor',[1 1 0.1250],...
              'LineWidth',1.5)
%scatter(gera, mean_fitness)
grid on
title('Valores Médios')
%legend('Maiores','Menores','Médios')

hold off

%% Gráfico de variância dos parâmetros da população final
figure(5)
hold on
gera = 1:1:14;
sz = 15;
%c = linspace(1,length(population_fitness),length(gera));
%scatter(gera, population_fitness,sz,c,'filled')
prim = var(pop(31:60,:));
ult = var(population);
vals = [prim;ult];
bar(gera, vals)
%scatter(gera, best_fitness)
%title('Fitness dos indivíduos no AG')
legend('Primeira Geração', 'Última Geração')
xlabel('Indivíduos')
ylabel('Variância ')
grid on
hold off

%% Gráfico de Variabilidade dos parametros população
figure(6)
hold on
gera = 1:1:14;
sz = 15;
c = linspace(1,length(pop),length(gera));
maximos = [ max(population(:,1)), max(population(:,2)), max(population(:,3)), max(population(:,4)), max(population(:,5)), max(population(:,6)), max(population(:,7)), max(population(:,8)), max(population(:,9)), max(population(:,10)), max(population(:,11)), max(population(:,12)), max(population(:,13)), max(population(:,14)) ];
minimos = [ min(population(:,1)), min(population(:,2)), min(population(:,3)), min(population(:,4)), min(population(:,5)), min(population(:,6)), min(population(:,7)), min(population(:,8)), min(population(:,9)), min(population(:,10)), min(population(:,11)), min(population(:,12)), min(population(:,13)), min(population(:,14)) ];
plot(gera, maximos, gera, minimos)
%scatter(gera,pop,sz,c,'filled')
%scatter(gera, best_fitness)
%title('Fitness dos indivíduos no AG')
legend('Maiores Valores', 'Menores Valores')
xlabel('Indivíduos')
ylabel('Max e Min')
grid on
hold off


%tEnd = cputime - tStart


