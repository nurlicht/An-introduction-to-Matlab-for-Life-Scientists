% 1. Displaying the path (URL) of the EB3 video file
% 2. Loading the EB3 video file
% 3. Getting the dimensions of the loaded image
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

%New part (3)
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
%
