%fitness
function [score] = fitness(indv)
%indv = indv/10;
F1 = (2239+23.02.*indv(1:14)+0.009.*indv(1:14).^2);

score = sum(F1);


% score = indv^2-10*indv;

end