%%Convolution
inputsize=55 ;
filtersize=11 ;
padding=0;
stride=4;
out = (inputsize - filtersize + 2*padding)/stride+1
%% pooling
inputsize=55;
poolsize=3;
padding=0;
stride=2;
out = (inputsize-poolsize+2*padding)/stride+1