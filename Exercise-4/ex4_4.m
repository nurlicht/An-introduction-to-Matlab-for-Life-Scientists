% 1. Displaying the path (URL) of the EB3 video file
% 2. Loading the EB3 video file
% 3. Getting the dimensions of the loaded image
% 4. Showing the first frame
close all force;
clear;
clc;

path = 'http://www.zmbh.uni-heidelberg.de/Central_Services/Imaging_Facility/Matlab/Data/Images/Microtubule_1.gif';
message = ['The path of the EB3 video file is ' path];
disp(message);

disp('Loading the EB3 video file. Please wait ... ');
Images = imread(path);
disp('Loading the EB3 video file completed.');
disp('Please check the new variable in "Workspace".');

dimensionXYZT = size(Images);
nX = dimensionXYZT(1);
nY = dimensionXYZT(2);
nZ = dimensionXYZT(3);
nT = dimensionXYZT(4);

nXText = num2str(nX);
nYText = num2str(nY);
nZText = num2str(nZ);
nTText = num2str(nT);

message = [nTText ' images of size ' nXText ' x ' nYText];
disp(message);

%New part (4)
frameIndex = 1;
frame1 = Images(:,:,:,frameIndex);
pause();
disp('Please check the dimensions of "frame1" and then press a key ...');
frame1 = squeeze(frame1);
disp('Please check the dimensions of "frame1".');
imagesc(frame1);
%
