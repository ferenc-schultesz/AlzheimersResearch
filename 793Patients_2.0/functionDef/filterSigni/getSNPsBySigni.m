function [ selectedFeatures ] = getSNPsBySigni( obs , grp, signifValue, groups )
%GETSNPSBYSIGNI Summary of this function goes here
%   Detailed explanation goes here


if (groups == 2)
    featrank = IndFeat(obs,grp);
    selectedFeatures = find(featrank > signifValue);
    %selectedFeatures = selectedFeatures';
end

if (groups == 3)
       %separate the three groups so we can get the most significante features
    %of each pair of groups
    obs1 = obs(grp2idx(grp)== 1,:);
    obs2 = obs(grp2idx(grp)== 2,:);
    obs3 = obs(grp2idx(grp)== 3,:);
    
    grp1 = grp(grp2idx(grp) == 1, :);
    grp2 = grp(grp2idx(grp) == 2, :);
    grp3 = grp(grp2idx(grp) == 3, :);
    
    % get the most significant features from group 1-2
    obs12 = vertcat(obs1,obs2);
    grp12 = vertcat(grp1,grp2);
    featrank12 = IndFeat(obs12,grp12);
    
    % get the most significant features from group 1-3
    obs13 = vertcat(obs1,obs3);
    grp13 = vertcat(grp1,grp3);
    featrank13 = IndFeat(obs13,grp13);

    % get the most significant features from group 2-3
    obs23 = vertcat(obs2,obs3);
    grp23 = vertcat(grp2,grp3);
    featrank23 = IndFeat(obs23,grp23);
    
    % sum the significance level of the three pairs
    combinedFeatRank123 = featrank12 + featrank13 + featrank23;
    % normalise the values by taking the average of the values
    combinedFeatRank123 = combinedFeatRank123 / 3;
    
    selectedFeatures = find(combinedFeatRank123 > signifValue);
end

if (groups == 4)
    %separate the four groups so we can get the most significante features
    %of each pair of groups
    obs1 = obs(grp2idx(grp)== 1,:);
    obs2 = obs(grp2idx(grp)== 2,:);
    obs3 = obs(grp2idx(grp)== 3,:);
    obs4 = obs(grp2idx(grp)== 4,:);
    
    grp1 = grp(grp2idx(grp) == 1, :);
    grp2 = grp(grp2idx(grp) == 2, :);
    grp3 = grp(grp2idx(grp) == 3, :);
    grp4 = grp(grp2idx(grp) == 4, :);
    
    % get the most significant features from group 1-2
    obs12 = vertcat(obs1,obs2);
    grp12 = vertcat(grp1,grp2);
    featrank12 = IndFeat(obs12,grp12);
    
    % get the most significant features from group 1-3
    obs13 = vertcat(obs1,obs3);
    grp13 = vertcat(grp1,grp3);
    featrank13 = IndFeat(obs13,grp13);

    % get the most significant features from group 2-3
    obs23 = vertcat(obs2,obs3);
    grp23 = vertcat(grp2,grp3);
    featrank23 = IndFeat(obs23,grp23);
    
    
    % get the most significant features from group 1-4
    obs14 = vertcat(obs1,obs4);
    grp14 = vertcat(grp1,grp4);
    featrank14 = IndFeat(obs14,grp14);
    
    % get the most significant features from group 2-4
    obs24 = vertcat(obs2,obs4);
    grp24 = vertcat(grp2,grp4);
    featrank24 = IndFeat(obs24,grp24);

    % get the most significant features from group 3-4
    obs34 = vertcat(obs3,obs4);
    grp34 = vertcat(grp3,grp4);
    featrank34 = IndFeat(obs34,grp34);
    
    
    % sum the significance level of the three pairs
    combinedFeatRank1234 = featrank12 + featrank13 + featrank23 ...
        + featrank14 + featrank24 + featrank34;
    % normalise the values by taking the average of the values
    combinedFeatRank1234 = combinedFeatRank1234 / 6;
    
    % fin features with higher significance values than the parameter
    selectedFeatures = find(combinedFeatRank1234 > signifValue);
end

end

