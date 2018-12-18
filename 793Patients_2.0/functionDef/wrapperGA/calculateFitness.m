function [ fitness ] = calculateFitness( chrom, obs, grp )
%CALCULATEFITNESS Summary of this function goes here
%   Detailed explanation goes here

global bestChrom;
global bestFitness;

% c - not used feature indices from chromosome
c =[];
for i = 1 : size(chrom,2)
    if ( chrom(1,i) == 0)
        c(end+1) = i;
    end
end

% the less feature was used (bigger c) the better the fitnes function is
fitness = numel(c);
features = obs;
features(: , c) = [];


holdoutCVP = cvpartition(grp,'holdout' );

dataTrain = features(holdoutCVP.training,:);
dataTest = features(holdoutCVP.test,:);

% get test and training labels
grpTrain = grp(holdoutCVP.training);
grpTest = grp(holdoutCVP.test);
%disp(size(dataTrain,2));
Mdl = fitcecoc (double(dataTrain), grpTrain, 'Learner','linear' , 'Verbose' , 0 );
result = predict(Mdl, double(dataTest));
%disp('Linear learner:');

matrix = confusionmat(grpTest,result);

truePos = trace(matrix); %matrix(1,1) + matrix(2,2);

if (truePos / size(grpTest,1) < 1)
    fitness = 0;
end

if (fitness > bestFitness)
    bestChrom = chrom;
    bestFitness = fitness;
end

end

