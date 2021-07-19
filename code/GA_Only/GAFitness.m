function  y = GAFitness (indv)
%indv = sqrt(indv(:));

F1 = (2239+23.02.*indv(1:14)+0.009.*indv(1:14).^2);

y = sum(F1);

end
