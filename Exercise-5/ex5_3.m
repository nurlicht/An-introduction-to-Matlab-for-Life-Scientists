% 1. Generate a series of five numbers
% 3. Scan all the numbers and display also the index of the mminimum

clc;
clear;
close all force;
a = [9 -3 7 0 -2];
disp(['Original series: a = ' num2str(a)]);
N = length(a);

minValue = a(1);
% New part (3)
minIndex = 1;
for i = 2:N
    if (a(i) < minValue)
        minValue = a(i);
        minIndex = i;
    end
end
disp([...
    'Minimum of the original series is a(' ...
    num2str(minIndex) ...
    ') = ' ...
    num2str(minValue) ...
    ]);
%
