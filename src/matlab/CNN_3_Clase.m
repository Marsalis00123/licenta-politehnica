 %% Creeam un "Datastore" cu imaginile de antrenare
% Acest cod se va antrena cu imagini alb-negru 
% care contin informatia de pe canalul G
% CNN supervizat


categories = {'S1','S2','S3'};
categoriesV = {'S1','S2','S3'};

image_size = [55 55 3];
pixelRange = [-10 10];

rootFoldertrain = 'F:\Facultate\Licenta\Enhanced_S_Color\Enhanced';
rootFoldertrainV = 'F:\Facultate\Licenta\Enhanced_S_Color\Enhanced\Validation';

imds = imageDatastore(fullfile(rootFoldertrain, categories), ...
    'LabelSource', 'foldernames');
imdsV= imageDatastore(fullfile(rootFoldertrainV, categoriesV), ...
    'LabelSource', 'foldernames');

imageAugmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandXTranslation',pixelRange, ...
    'RandYTranslation',pixelRange);
imdsAUG = augmentedImageSource([55 55 1],imds, ...
    'DataAugmentation',imageAugmenter);

%% Layers 
layers = [ ...
    imageInputLayer(image_size)
    convolution2dLayer(11 ,96,'Stride',4)
    reluLayer
    crossChannelNormalizationLayer(5)
    maxPooling2dLayer(3,'Stride',2)
    convolution2dLayer(5, 256,'Padding',1,'Stride',2)
    reluLayer
    crossChannelNormalizationLayer(5)
    convolution2dLayer(3, 384,'Padding',1,'Stride',1)
    reluLayer
    convolution2dLayer(3, 384,'Padding',1,'Stride',1)
    reluLayer
    convolution2dLayer(3, 256,'Padding',1,'Stride',1)
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    dropoutLayer
    fullyConnectedLayer(3)          
    softmaxLayer
    classificationLayer];
% %% Layers
% 
% layers = [...
%     imageInputLayer(image_size)% Aici introducem dimensiunile matricei (imaginii)
%     convolution2dLayer(5,20)
%     batchNormalizationLayer
%     reluLayer
%     maxPooling2dLayer(2,'Stride',2) % Layer-uri basic care ar trebuii sa contina
%     fullyConnectedLayer(3)          % orice CNN
%     softmaxLayer
%     classificationLayer];
%% OPTIONS Supervised

opts = trainingOptions('sgdm', ...
    'MaxEpochs',50, ...
     'Shuffle','every-epoch', ...
    'Plots','training-progress', ...
    'Verbose',true, ...
    'ValidationData',imdsV,...
    'ValidationPatience',Inf);

%% Train

[Tres, info] = trainNetwork(imdsAUG, layers, opts);

