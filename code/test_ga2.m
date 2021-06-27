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
    14,... %Tamanho da população
    14,... %Número de pais que permanecerão na próxima geração
    0.1 ,... %Taxa de Mutação
    100,... %Máximo de Gerações
    1.0e-6,... %Custo minímo de evolução
    A' ...
);

% %% Gráfico para os valores e Fitness ao longo das gerações
% figure(1)
% hold on
% gera = 1:1:length(population_fitness);
% scatter(gera, population_fitness)
% grid on
% hold off
% 
%% Gráfico para os valores e Fitness ao longo das gerações
% figure(2)
% hold on
% gera = 1:1:length(population_fitness);
% sz = 15;
% c = linspace(1,length(population_fitness),length(gera));
% scatter(gera, population_fitness,sz,c,'filled')
% %scatter(gera, best_fitness)
% title('Fitness dos indivíduos no AG')
% legend('Indivíduos')
% xlabel('Indivíduos')
% ylabel('Fitness')
% grid on
% hold off
% 
% 
% %% Gráfico para os melhores, piores e médios valortes Fitness ao longo das gerações
% figure(3)
% hold on
% gera = 1:1:length(best_fitness);
% subplot(3,1,1)
% title('Maiores Valores')
% sz = 40;
% scatter(gera, best_fitness,sz,'MarkerEdgeColor',[0 .5 .5],...
%               'MarkerFaceColor',[0 .7 .7],...
%               'LineWidth',1.5)
% %scatter(gera, best_fitness)
% grid on
% title('Melhores Valores')
% 
% subplot(3,1,2)
% title('Piores Valores')
% sz = 40;
% scatter(gera, worst_fitness,sz,'MarkerEdgeColor',[0.6350 0.0780 0.1840],...
%               'MarkerFaceColor',[1 0.0780 0.1840],...
%               'LineWidth',1.5)
% %scatter(gera, worst_fitness)
% grid on
% title('Piores Valores')
% 
% subplot(3,1,3)
% title('Valores Médios')
% sz = 40;
% scatter(gera, mean_fitness,sz,'MarkerEdgeColor',[0.9290 0.6940 0.1250],...
%               'MarkerFaceColor',[1 1 0.1250],...
%               'LineWidth',1.5)
% %scatter(gera, mean_fitness)
% grid on
% title('Valores Médios')
% %legend('Maiores','Menores','Médios')
% 
% hold off
%% 
% figure(4)
% hold on
% x = -100:.1:100;
% y = -100:.1:100;
% [x,y] = meshgrid(x,y);
% %
% f = (0.5 - (((sin (sqrt (x.^2+y.^2) )).^2) - 0.5)./(1 + 0.001.*(x.^2+y.^2)).^2);
% % 
% surf(x,y,f,'EdgeColor','none');
% colormap(hsv);
% colorbar;
% shading interp;
% alpha 0.8;
% % gene
% scatter3(pop(1:100,1),pop(1:100,2),population_fitness(1:100),60,'*','k');
% % 
% legend('Espaço de Busca','Indivíduos')
% title('Geração Inicial')
% grid on
% hold off

%% 
% figure(5)
% hold on
% x = -100:.1:100;
% y = -100:.1:100;
% [x,y] = meshgrid(x,y);
% %
% f = (0.5 - (((sin (sqrt (x.^2+y.^2) )).^2) - 0.5)./(1 + 0.001.*(x.^2+y.^2)).^2);
% % 
% surf(x,y,f,'EdgeColor','none');
% colormap(hsv);
% colorbar;
% shading interp;
% alpha 0.1;
% % gene
% scatter3(pop(length(pop)-population_size-1:length(pop),1),pop(length(pop)-population_size-1:length(pop),2),population_fitness(length(population_fitness)-population_size-1:length(population_fitness)),60,'*','k');
% % 
% legend('Espaço de Busca','Indivíduos')
% title('Geração Finsl')
% grid on
% hold off
%% Gráfico da Primeira Geração e Última
% figure(5)
% hold on
% x = -100:.1:100;
% y = -100:.1:100;
% [x,y] = meshgrid(x,y);
% %
% f = (0.5 - (((sin (sqrt (x.^2+y.^2) )).^2) - 0.5)./(1 + 0.001.*(x.^2+y.^2)).^2);
% % 
% surf(x,y,f,'EdgeColor','none');
% colormap(winter);
% colorbar;
% shading interp;
% alpha 0.1;
% % gene
% scatter3(pop(1:100,1),pop(1:100,2),pop_fitness(1:100),'d','r');
% scatter3(pop(4901:5000,1),pop(4901:5000,2),best_fitness(401:500,1),'d','b');
% % 
% legend('Função F6','Primeira Geração','Última Geração')
% title('Primeira Geração')

% grid on
% hold off

%%
% %population_fitness = sort(population_fitness);
% %% Gráfico da Geração (1-100)
% figure(6)
% hold on
% x = -100:.1:100;
% y = -100:.1:100;
% [x,y] = meshgrid(x,y);
% %
% f = (0.5 - (((sin (sqrt (x.^2+y.^2) )).^2) - 0.5)./(1 + 0.001.*(x.^2+y.^2)).^2);
% % 
% surf(x,y,f,'EdgeColor','none');
% colormap(winter);
% colorbar;
% shading interp;
% alpha 0.1;
% % gene
% %scatter3(pop(1:100,1),pop(1:100,2),pop_fitness(1:100),'d','r');
% scatter3(pop(1:1000,1),pop(1:1000,2),population_fitness(1:1000,1),'d','b');
% % 
% legend('Função F6','Geração (1-100)')
% title('Geração (1-100)')
% 
% grid on
% hold off
% 
% %% Gráfico da Geração (101-200)
% figure(7)
% hold on
% x = -100:.1:100;
% y = -100:.1:100;
% [x,y] = meshgrid(x,y);
% %
% f = (0.5 - (((sin (sqrt (x.^2+y.^2) )).^2) - 0.5)./(1 + 0.001.*(x.^2+y.^2)).^2);
% % 
% surf(x,y,f,'EdgeColor','none');
% colormap(winter);
% colorbar;
% shading interp;
% alpha 0.1;
% % gene
% %scatter3(pop(1:100,1),pop(1:100,2),pop_fitness(1:100),'d','r');
% scatter3(pop(1001:2000,1),pop(1001:2000,2),population_fitness(1001:2000,1),'d','b');
% % 
% legend('Função F6','Geração (101-200)')
% title('Geração (101-200)')
% 
% grid on
% hold off
% 
% %% Gráfico da Geração (201-300)
% figure(8)
% hold on
% x = -100:.1:100;
% y = -100:.1:100;
% [x,y] = meshgrid(x,y);
% %
% f = (0.5 - (((sin (sqrt (x.^2+y.^2) )).^2) - 0.5)./(1 + 0.001.*(x.^2+y.^2)).^2);
% % 
% surf(x,y,f,'EdgeColor','none');
% colormap(winter);
% colorbar;
% shading interp;
% alpha 0.1;
% % gene
% %scatter3(pop(1:100,1),pop(1:100,2),pop_fitness(1:100),'d','r');
% scatter3(pop(2001:3000,1),pop(2001:3000,2),population_fitness(2001:3000,1),'d','b');
% % 
% legend('Função F6','Geração (201-300)')
% title('Geração (201-300)')
% 
% grid on
% hold off
% 
% %% Gráfico da Geração (301-400)
% figure(9)
% hold on
% x = -100:.1:100;
% y = -100:.1:100;
% [x,y] = meshgrid(x,y);
% %
% f = (0.5 - (((sin (sqrt (x.^2+y.^2) )).^2) - 0.5)./(1 + 0.001.*(x.^2+y.^2)).^2);
% % 
% surf(x,y,f,'EdgeColor','none');
% colormap(winter);
% colorbar;
% shading interp;
% alpha 0.1;
% % gene
% %scatter3(pop(1:100,1),pop(1:100,2),pop_fitness(1:100),'d','r');
% scatter3(pop(3001:4000,1),pop(3001:4000,2),population_fitness(3001:4000,1),'d','b');
% % 
% legend('Função F6','Geração (301-400)')
% title('Geração (301-400)')
% 
% grid on
% hold off
% 
% %% Gráfico da Geração (401-500)
% figure(10)
% hold on
% x = -100:.1:100;
% y = -100:.1:100;
% [x,y] = meshgrid(x,y);
% %
% f = (0.5 - (((sin (sqrt (x.^2+y.^2) )).^2) - 0.5)./(1 + 0.001.*(x.^2+y.^2)).^2);
% % 
% surf(x,y,f,'EdgeColor','none');
% colormap(winter);
% colorbar;
% shading interp;
% alpha 0.1;
% % gene
% %scatter3(pop(1:100,1),pop(1:100,2),pop_fitness(1:100),'d','r');
% scatter3(pop(4001:5000,1),pop(4001:5000,2),population_fitness(4001:5000,1),'d','b');
% % 
% legend('Função F6','Geração (401-500)')
% title('Geração (401-500)')
% 
% grid on
% hold off

%tEnd = cputime - tStart


