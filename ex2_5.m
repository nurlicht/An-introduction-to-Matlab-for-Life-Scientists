% 1. Initializing Matlab
% 2. Displaying relevant information (Matlab code/data for Mass Spec.)
% 3. Loading the first file (Matlab's MS sample sata)
% 4. Clearing "unnecessary" variables
% 5. Displaying the "structure" msFullInfo and hints for visualization

close all force;
clear;
clc;

firstPart = 'Mass spectrometry data, programs, and information on ';

URL = 'http://www.mathworks.com/help/bioinfo/examples/preprocessing-raw-mass-spectrometry-data.html';
Text = 'Matlab website';
secondPart = ['<a href="' URL '" target="_link">' Text '</a>'];

fullMessage = [firstPart secondPart];
disp(fullMessage);

msFile = 'mspec01.csv';
disp(['Loading the (Mass spectrometery) file ' msFile ' ....']);
msFullInfo = importdata(msFile);
disp(['Loading the (Mass spectrometery) file ' msFile ' was completed.']);

disp('Clearing "unnecessary" variables ...');
clear firstPart;
clear fullMessage;
clear msFile;
clear secondPart;
clear Text;
clear URL;
disp('Clearing "unnecessary" variables was completed.');

disp('Please note the variables in "Workspace"');

% New part(5)
msFullInfo
disp('Please double-click on variables and use the "Plots" tab');
%
