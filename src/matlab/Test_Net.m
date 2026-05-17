%% Clasificarea imaginilor de testare

% load('Trained_Net.mat');

rootFolder = 'F:\Facultate\Licenta\BIG_DATAG_T';

categoriesTest = {'NonHem','Hem'};

imds_test = imageDatastore(fullfile(rootFolder, categoriesTest), ...
    'LabelSource', 'foldernames');

labels = predict(net,imds_test);

% % accq = (sum(labels == imds_test.Labels)/numel(imds_test.Labels))*100;
% % 
% % sprintf('CNN Test Accuracy is %.2f%%',accq)
