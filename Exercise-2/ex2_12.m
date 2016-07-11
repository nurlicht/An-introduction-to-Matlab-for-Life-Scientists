% 1. Initializing Matlab
% 2. Displaying relevant information (Matlab code/data for Mass Spec.)
% 10. Offering the user the choice of the Mass-Spec data file
% 11. Offering the user the choice of zeo or invisible baseline
% 12. Visualizing data with Matlab's MSViewer + info on data analysis

close all force;
clear;
clc;

firstPart = 'Mass spectrometry data, programs, and information on ';

URL = 'http://www.mathworks.com/help/bioinfo/examples/preprocessing-raw-mass-spectrometry-data.html';
Text = 'Matlab website';
secondPart = ['<a href="' URL '" target="_link">' Text '</a>'];

fullMessage = [firstPart secondPart];
disp(fullMessage);

msFileList = {'mspec01.csv', 'mspec02.csv', 'mspec03.csv', 'mspec04.csv'};
msTitle = 'MS data file';
chosenIndex = menu(msTitle, msFileList);
msFile = msFileList{chosenIndex};
disp([ ...
    'The file ' msFile ...
    ' (with index ' num2str(chosenIndex) ')' ...
    ' was selected.'...
    ]);

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

title('Please select the baseline.');
[xBaseline, yBaseline] = ginput(1);
disp(['User-specified value of baseline: ' num2str(yBaseline)]);

baselineList = {'Invisible', 'Zero'};
baselineTitle = 'Displaying below-baseline data';
chosenIndex = menu(baselineTitle, baselineList);
if (chosenIndex == 1)
    secondColumn(secondColumn < yBaseline) = NaN;
    disp('Values below baseline are set to NaN (invisible in plots).');
else
    secondColumn(secondColumn < yBaseline) = 0;
    disp('Values below baseline are set to zero.');
end

plot(firstColumn, secondColumn);
title(['User-specified value of baseline: ' num2str(yBaseline)]);
ylim(max(secondColumn) * [-0.05 1]);

% New part (12)
msviewer(firstColumn, secondColumn);

firstPart = 'Data analysis algorithm for MS data can be found on ';
URL = 'http://www.mathworks.com/help/bioinfo/ug/features-and-functions.html#bp4mcvy';
Text = 'Matlab website';
secondPart = ['<a href="' URL '" target="_link">' Text '</a>'];
disp([firstPart secondPart]);
%
