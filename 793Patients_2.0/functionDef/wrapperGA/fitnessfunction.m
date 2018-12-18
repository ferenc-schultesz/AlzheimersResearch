function fitnessvalues = fitnessfunction(oldchrom, obs, grp )
%fitnessfunction Computes the fitness of a population
%   Returns the fitness in a vector
% Requires a user-supplied fitness
[rows cols]=size(oldchrom);

fitnessvalues=[];
for i=1: rows
    fitnessvalues(i)=calculateFitness(oldchrom(i,:), obs, grp);
    % This is where the user defined fitness function goes
end

fprintf('Average fitness= %5.2f\n',mean(fitnessvalues));
fprintf('Maximum fitness= %5.2f\n',max(fitnessvalues));
fprintf('Minimum fitness= %5.2f\n',min(fitnessvalues));
fitnessvalues;
% Fitness statistics to be added


end

