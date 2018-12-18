function newchrom = roulette(fitnessvalues,oldchrom )
%roulette uses roulette wheel selection to return a new population
[rows cols]=size(oldchrom);
newchrom=zeros(rows,cols);
sigmafitness=sum(fitnessvalues);
low=1;
cumfitness=[];
cumfitness(1)=fitnessvalues(1);
for i=2:rows
    cumfitness(i)=cumfitness(i-1)+fitnessvalues(i);
end
for i=1:rows
    wheelval=fix(rand*(sigmafitness-low)+low);
    % selects a random number between low and sigmafitness
    for j=1:rows
        if cumfitness(j)>wheelval
            newchrom(i,:)=oldchrom(j,:);
            break;
        end
    end
end


end

