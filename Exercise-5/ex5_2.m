% 1. Generate a series of five numbers
% 2. Scan all the numbers and display the minimum

clc;
clear;
close all force;
a = [9 -3 7 0 -2];
disp(['Original series: a = ' num2str(a)]);

% New part (2)
N = length(a);
minValue = a(1);
for i = 2:N
    if (a(i) < minValue)
        minValue = a(i);
    end
end
disp(['Minimum of the original series: a_min = ' num2str(minValue)]);
%
