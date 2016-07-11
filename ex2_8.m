% 1. Initializing Matlab
% 2. Displaying relevant information (Matlab code/data for Mass Spec.)
% 3. Loading the first file (Matlab's MS sample sata)
% 4. Clearing "unnecessary" variables
% 5. Displaying the "structure" msFullInfo and hints for visualization
% 6. Reading and displaying the names of "x" and "y" (column headers)
% 7. Reading and plotting the "x" and "y" series
% 8. Interactive selection of baseline and subtracting it

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

xLabel = msFullInfo.colheaders{1};
yLabel = msFullInfo.colheaders{2};
disp(['The name of the first quantity ("x") is ' xLabel]);
disp(['The name of the second quantity ("y") is ' yLabel]);

firstColumn = msFullInfo.data(:,1);
secondColumn = msFullInfo.data(:,2);
plot(firstColumn, secondColumn);
xlabel(xLabel);
ylabel(yLabel);
title('Sample mass-spectrometry data');

% New part(8)
title('Please select the baseline.');
[xBaseline, yBaseline] = ginput(1);
disp(['User-specified value of baseline: ' num2str(yBaseline)]);
secondColumn(secondColumn < yBaseline) = 0;
plot(firstColumn, secondColumn);
title(['User-specified value of baseline: ' num2str(yBaseline)]);
ylim(max(secondColumn) * [-0.05 1]);
%
