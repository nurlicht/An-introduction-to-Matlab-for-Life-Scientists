% 1. Generate a series of five numbers
% 2. Scan all the numbers and display the minimum
% 3. Scan all the numbers and display the index of the mminimum
% 4. Swap the first number and the minimum

clc;
clear;
close all force;
a = [9 -3 7 0 -2];
disp(['Original series: a = ' num2str(a)]);
N = length(a);

minValue = a(1);
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

% New part (4)
original_a_1 = a(1);
a(1) = minValue;
a(minIndex) = original_a_1;
disp(['The new series (first element and minimum swapped): a = '  num2str(a)]);
%
