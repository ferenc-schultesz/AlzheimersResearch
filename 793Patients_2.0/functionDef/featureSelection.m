function [ obs, grp,featureIDs ] = featureSelection( groups, obs, grp, signi )
%FEATURESELECTION Summary of this function goes here
%   Detailed explanation goes here

obs1 = obs(grp2idx(grp)==1,:);
obs2 = obs(grp2idx(grp)==2,:);
obs3 = obs(grp2idx(grp)==3,:);
obs4 = obs(grp2idx(grp)==4,:);

grp1 = grp(grp2idx(grp) == 1, :);
grp2 = grp(grp2idx(grp) == 2, :);
grp3 = grp(grp2idx(grp) == 3, :);
grp4 = grp(grp2idx(grp) == 4, :);



if (groups == 12)
    obs = vertcat(obs1,obs2);
    grp = vertcat(grp1,grp2);
    if (signi == 0)
        signi = 2.4;
    end
  
    [obs, featureIDs] = filterFeaturesBySigni(obs,grp, signi);
    
    disp(strcat('Group',{' '}, num2str(groups),{' '}, 'Applying Signi filter...'));
    disp(strcat('Number of features after filter: ',{' '}, num2str(size(obs,2))));
    disp('Starting genetic algorithm for warapper...');
    
    test = featureIDs;
    [obs, featureIDs] = gaWrapper(obs,grp, test);
    disp(strcat('Number of features after wrapper: ', num2str(size(featureIDs,2))));
    disp('.');
end

if (groups == 13)
    obs = vertcat(obs1,obs3);
    grp = vertcat(grp1,grp3);
    
    if (signi == 0)
        signi = 2.4;
    end
    
    %selectedFeatures = getSNPsBySigni(obs , grp, 4.8, 2);
    [obs, featureIDs] = filterFeaturesBySigni(obs,grp, signi);
    
    disp(strcat('Group',{' '}, num2str(groups),{' '}, 'Applying Signi filter...'));
    disp(strcat('Number of features after filter: ',{' '}, num2str(size(obs,2))));
    disp('Starting genetic algorithm for warapper...');
    
    test = featureIDs;
    [obs, featureIDs] = gaWrapper(obs,grp, test);
    disp(strcat('Number of features after wrapper: ', num2str(size(featureIDs,2))));
    disp('.');
end

if (groups == 14)
    obs = vertcat(obs1,obs4);
    grp = vertcat(grp1,grp4);
    
    if (signi == 0)
        signi = 4.8;
    end
    
    [obs, featureIDs] = filterFeaturesBySigni(obs,grp, signi);
    
    disp(strcat('Group',{' '}, num2str(groups),{' '}, 'Applying Signi filter...'));
    disp(strcat('Number of features after filter: ',{' '}, num2str(size(obs,2))));
    disp('Starting genetic algorithm for warapper...');
    
    test = featureIDs;
    [obs, featureIDs] = gaWrapper(obs,grp, test);
    disp(strcat('Number of features after wrapper: ', num2str(size(featureIDs,2))));
    disp('.');
end

if (groups == 23)
    obs = vertcat(obs2,obs3);
    grp = vertcat(grp2,grp3);
    
    if (signi == 0)
        signi = 2.3;
    end
    
    [obs, featureIDs] = filterFeaturesBySigni(obs,grp, signi);
    
    disp(strcat('Group',{' '}, num2str(groups),{' '}, 'Applying Signi filter...'));
    disp(strcat('Number of features after filter: ',{' '}, num2str(size(obs,2))));
    disp('Starting genetic algorithm for warapper...');
    
    test = featureIDs;
    [obs, featureIDs] = gaWrapper(obs,grp, test);
    disp(strcat('Number of features after wrapper: ', num2str(size(featureIDs,2))));
    disp('.');
end

if (groups == 24)
    obs = vertcat(obs2,obs4);
    grp = vertcat(grp2,grp4);
    
    if (signi == 0)
        signi = 2.4;
    end
    
    [obs, featureIDs] = filterFeaturesBySigni(obs,grp, signi);
    
    disp(strcat('Group',{' '}, num2str(groups),{' '}, 'Applying Signi filter...'));
    disp(strcat('Number of features after filter: ',{' '}, num2str(size(obs,2))));
    disp('Starting genetic algorithm for warapper...');
    
    test = featureIDs;
    [obs, featureIDs] = gaWrapper(obs,grp, test);
    disp(strcat('Number of features after wrapper: ', num2str(size(featureIDs,2))));
    disp('.');
end

if (groups == 34)
    obs = vertcat(obs3,obs4);
    grp = vertcat(grp3,grp4);
    
    if (signi == 0)
        signi = 2.4;
    end
    
    [obs, featureIDs] = filterFeaturesBySigni(obs,grp, signi);
    
    disp(strcat('Group',{' '}, num2str(groups),{' '}, 'Applying Signi filter...'));
    disp(strcat('Number of features after filter: ',{' '}, num2str(size(obs,2))));
    disp('Starting genetic algorithm for warapper...');
    
    test = featureIDs;
    [obs, featureIDs] = gaWrapper(obs,grp, test);
    disp(strcat('Number of features after wrapper: ', num2str(size(featureIDs,2))));
    disp('.');
end

if (groups == 123)
end

if (groups == 124)
end

if (groups == 234)
end

if (groups == 1234)
    
    if (signi == 0)
        signi = 1.2;
    end
    
    [obs, featureIDs] = filterFeaturesBySigniMultiClasses(obs,grp, signi, 4);
    
    disp(strcat('Group',{' '}, num2str(groups),{' '}, 'Applying Signi filter...'));
    disp(strcat('Number of features after filter: ',{' '}, num2str(size(obs,2))));
    disp('Starting genetic algorithm for warapper...');
    
    test = featureIDs;
    [obs, featureIDs] = gaWrapper(obs,grp, test);
    disp(strcat('Number of features after wrapper: ', num2str(size(featureIDs,2))));
    disp('.');
end

end

