%% Clasificarea imaginilor de testare


rootFolder = 'F:\Facultate\Licenta\Enhanced_S_Color\Enhanced\Testing';
categoriesTest = {'S1','S2','S3'};
imds_test = imageDatastore(fullfile(rootFolder, categoriesTest), ...
    'LabelSource', 'foldernames');

labels = classify(Tres,imds_test);

accq = (sum(labels == imds_test.Labels)/numel(imds_test.Labels))*100;

sprintf('CNN Test Accuracy is %.2f%%',accq)
%%
rootFolder = 'F:\Facultate\Licenta\BIG_DATA_Color\Testing';
categoriesTest = {'Hem','NonHem'};
imds_test = imageDatastore(fullfile(rootFolder, categoriesTest), ...
    'LabelSource', 'foldernames');

labels = classify(net,imds_test);

accq = (sum(labels == imds_test.Labels)/numel(imds_test.Labels))*100;

sprintf('CNN Test Accuracy is %.2f%%',accq)




