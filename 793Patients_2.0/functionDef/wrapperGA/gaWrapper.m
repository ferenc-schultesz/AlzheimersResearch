function [ obs, featureIDs ] = gaWrapper( obs, grp, featureIDs )
%GAWRAPPER Summary of this function goes here
%   Detailed explanation goes here


% Script to run a genetic algorithm
%n=input('Enter population size ');
%iterations=input('Enter the number of iterations ');
%chromlength=input('Enter the length of the chromosome ');



popSize = 10;
iterations = 4;
chromlength = size(obs,2);

global bestChrom;
global bestFitness;
bestChrom = [];
bestFitness = 1;

result = [];

fitnessvalues = [];
[oldchrom]=initpop(popSize,chromlength);

for i=1:iterations
    fitnessvalues=fitnessfunction(oldchrom, obs, grp);
    if (nnz(fitnessvalues) == 0)
        disp('Increase the significance level for filter feature selection! Feature selection Aborted!');
        return;
    end
    
    result(i,1) = mean(fitnessvalues);
    result(i,2) = max(fitnessvalues);
    result(i,3) = min(fitnessvalues);
    % number of used features
    usedFeatures = size(obs,2) - result(i,2);
    result(i,4) = usedFeatures;
    
    % Uncomment for debugging GA
%      disp(strcat('Generation',{' '}, num2str(i),',', {' '},'AveFit:',{' '},num2str(result(i,1)),' Max:',{' '},num2str(result(i,2)),...
%          ' NumOfFeatOfBest: ',{' '}, num2str(result(i,4))));
  
    
    newchrom=roulette(fitnessvalues,oldchrom);
    newchrom1=crossover(newchrom);
    mutationrate=0.01;
    newchrom2=mutate(newchrom1,mutationrate);
    oldchrom=newchrom2;
end

% c - the not used features indices 
c = [];
for i = 1 : size(bestChrom,2)
    if ( bestChrom(1,i) == 0)
        c(end+1) = i;
    end
end

% feature IDs are the used feature IDs for best chromosome
featureIDs(:,c) = [];
% obs (returned) are the features for observation - not used features
obs(: , c) = [];

end

