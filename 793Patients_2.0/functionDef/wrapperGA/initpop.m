function pop = initpop(popsize,chromlength )
%initpop initialise a binary population
%   popsize determines the number of specimens in the population
%   chromlength determines the length of each chromosome
rand;
% pop=randint(popsize,chromlength,[0,1]);
% For home this would be
% pop=randint(popsize,chromlength,[0,1]);
pop=randi([0,1],popsize,chromlength);





end

