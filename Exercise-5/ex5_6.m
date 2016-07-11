% 1. Generate a series of five numbers
% 6. Use the "sort" commands of Matlab

clc;
clear;
close all force;
a = [9 -3 7 0 -2];
disp(['Original series: a = ' num2str(a)]);

% New part (8)
b = sort(a);
disp(['Sorted series (with Matlab SORT function): a_new = ' num2str(b)]);
%
