%% Script that makes Hem crops semi-automatic or automatic

% Creating a imageDatastore with originals
rootFolder = 'F:\Facultate\Licenta\DATA\Original_sessions';

imds_Original = imageDatastore(fullfile(rootFolder, 'S3'), ...
    'LabelSource', 'foldernames');

%% Initialize parameters

[L1,L2] = size(imds_Original.Labels);%Finds the number of images
temp_matrix=zeros(55,55);%initialize marix

CH=0;% image counters
image=1;
Folder_S1='F:\Facultate\Licenta\BIG_DATAG_S\S1';% where to save
Folder_S2='F:\Facultate\Licenta\BIG_DATAG_S\S2';
Folder_S3='F:\F:\Facultate\Licenta\BIG_DATAG_S\S3';
% Folder_NonHem='F:\Facultate\Licenta\HUGE_DATA_S_G\NonHem';
Folder_Temp = 'F:\Facultate\Licenta\BIG_DATAG_S\Temp';
Folder_VS1='F:\Facultate\Licenta\BIG_DATAG_S\Validation\S1';% where to save
Folder_VS2='F:\Facultate\Licenta\BIG_DATAG_S\Validation\S2';
Folder_VS3='F:\Facultate\Licenta\BIG_DATAG_S\Validation\S3';
% Folder_VNonHem='F:\Facultate\Licenta\HUGE_DATA_S_G\Validation\NonHem';

Folder_TS1='F:\Facultate\Licenta\BIG_DATAG_S\Testing\S1';% where to save
Folder_TS2='F:\Facultate\Licenta\BIG_DATAG_S\Testing\S2';
Folder_TS3='F:\Facultate\Licenta\BIG_DATAG_S\Testing\S3';
% Folder_TNonHem='F:\Facultate\Licenta\HUGE_DATA_S_G\Testing\NonHem';

% LimitH = 100;% Limit of crops pe image
% LimitNH = 300;
stepH=10;% How many pixels jump
% stepNH=4;
L=0;
C=0;
H=0;
W=0;
% rectangles(1).img=1;
% rectangles(1).dreptunghi=[0,0,0,0];
% nr=0;


%% Structure making

for image=1:L1
    
     temp=imread(imds_Original.Files{image});
      
     [J,drept]=imcrop(temp);
     rectangles(image).img=image;
     rectangles(image).dreptunghi=round(drept);
    
end 


















