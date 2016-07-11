% 1. Initializing Matlab
% 2. Displaying relevant information (Matlab code/data for Mass Spec.)
% 3. Loading the first file (Matlab's MS sample sata)

close all force;
clear;
clc;

firstPart = 'Mass spectrometry data, programs, and information on ';

URL = 'http://www.mathworks.com/help/bioinfo/examples/preprocessing-raw-mass-spectrometry-data.html';
Text = 'Matlab website';
secondPart = ['<a href="' URL '" target="_link">' Text '</a>'];

compleMessage = [firstPart secondPart];
disp(compleMessage);

% New part(3)
msFile = 'mspec01.csv';
disp(['Loading the (Mass spectrometery) file ' msFile ' ....']);
msFullInfo = importdata(msFile);
disp(['Loading the (Mass spectrometery) file ' msFile ' was completed.']);
disp('Please note the variables in "Workspace"');
%
