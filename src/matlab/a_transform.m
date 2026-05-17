%% Script that extracts a space from rgb training data


% Creating a imageDatastore with the files to change
rootFolder = 'F:\Facultate\Licenta\BIG_DATA';

imds = imageDatastore(fullfile(rootFolder, 'Hem'), ...
    'LabelSource', 'foldernames');
[L1,L2] = size(imds.Labels);%Finds the number of images
%% Extracting a space
CH=0;
temp_a=zeros(55,55,3);
for image=1:L1
    
        temp=imread(imds.Files{image});
        tempLab = rgb2lab(temp);
        temp_a=tempLab(:,:,2);
        
                CH=CH+1;
                filenameH=['H' num2str(CH) '.jpg'];
                fullFileName = fullfile('F:\Facultate\Licenta\BIG_DATA\aHem', filenameH);
                imwrite(temp_a, fullFileName);
              
end
