clear;
load ('dataFiles\observations.mat');
load('dataFiles\groups.mat');

OBSERVATIONS = obs;
GROUPS = grp;
t1 = datetime('now');
[obs12, grp12, featureIDs12] = featureSelection(12,obs,grp, 0);
signivector12 = getSigniByGroup( obs12, grp12, 2 );
featurelistwithsigni12 = vertcat(featureIDs12, signivector12);
csvwrite('featurelistwithsigni12a.csv',featurelistwithsigni12');
t3 = t1 - datetime('now');

[obs12, grp12, featureIDs12] = featureSelection(12,obs,grp, 0);
signivector12 = getSigniByGroup( obs12, grp12, 2 );
featurelistwithsigni12 = vertcat(featureIDs12, signivector12);
csvwrite('featurelistwithsigni12b.csv',featurelistwithsigni12');


[obs12, grp12, featureIDs12] = featureSelection(12,obs,grp, 0);
signivector12 = getSigniByGroup( obs12, grp12, 2 );
featurelistwithsigni12 = vertcat(featureIDs12, signivector12);
csvwrite('featurelistwithsigni12c.csv',featurelistwithsigni12');


[obs13, grp13, featureIDs13] = featureSelection(13,obs,grp, 0);

[obs14, grp14, featureIDs14] = featureSelection(14,obs,grp, 5);

[obs23, grp23, featureIDs23] = featureSelection(23,obs,grp, 0);

[obs24, grp24, featureIDs24] = featureSelection(24,obs,grp, 0);

[obs34, grp34, featureIDs34] = featureSelection(34,obs,grp, 0);

[obs1234, grp1234, featureIDs1234] = featureSelection(1234,obs,grp, 0);
