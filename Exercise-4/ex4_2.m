% 1. Displaying the path (URL) of the EB3 video file
% 2. Loading the EB3 video file
close all force;
clear;
clc;

path = 'http://www.zmbh.uni-heidelberg.de/Central_Services/Imaging_Facility/Matlab/Data/Images/Microtubule_1.gif';
message = ['The path of the EB3 video file is ' path];
disp(message);

%New part (2)
disp('Loading the EB3 video file. Please wait ... ');
Images = imread(path);
disp('Loading the EB3 video file completed.');
disp('Please check the new variable in "Workspace".');
%
