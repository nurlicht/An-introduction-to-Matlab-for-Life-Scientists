% 1. Initializing Matlab
% 2. Displaying relevant information (Matlab code/data for Mass Spec.)

close all force;
clear;
clc;

% New part(2)
firstPart = 'Mass spectrometry data, programs, and information on ';

URL = 'http://www.mathworks.com/help/bioinfo/examples/preprocessing-raw-mass-spectrometry-data.html';
Text = 'Matlab website';
secondPart = ['<a href="' URL '" target="_link">' Text '</a>'];

compleMessage = [firstPart secondPart];
disp(compleMessage);
%
