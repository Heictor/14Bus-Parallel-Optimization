%fitness
function [score] = fitness(indv)

score = (2239+23.02*indv+0.009*indv^2);
%score = indv^2-10*indv;

end