% 1. Generate a series of five numbers
% 7. Finds the sorted array with descneding order; saves all variables

clc;
clear;
close all force;
a = [9 -3 7 0 -2];
disp(['Original series: a = ' num2str(a)]);
N = length(a);

% New part (7)
disp(' ');
for j = 1:(N - 1)
    for i = (j + 1):N
        if (a(i) > a(j))
            tempValue = a(i);
            a(i) = a(j);
            a(j) = tempValue;
        end
        disp([...
            'j = ' num2str(j) ...
            ', i = ' num2str(i) ...
            ', a = ' num2str(a) ...
            ]);
    end
end
disp(' ');
disp(['The sorted series: a_sorted = '  num2str(a)]);
save All;
%
