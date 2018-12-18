function [ filteredFeatures, selectedFeatures ] = filterFeaturesBySigni( obs , grp, signifValue )
%FILTERFEATURES Summary of this function goes here
%   Detailed explanation goes here
featrank = IndFeat(obs,grp);
selectedFeatures = find(featrank > signifValue);
filteredFeatures = zeros(size(obs,1),size(selectedFeatures,2));

for i = 1:size(filteredFeatures, 2)
    for n = 1 : size(obs,1)
        filteredFeatures(n,i) = obs(n,selectedFeatures(1,i));
    end
    
end
%selectedFeatures = selectedFeatures';
end

