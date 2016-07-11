% 1. Generating and displaying a time interval

close all force;
clear;
clc;

minT = 0;
maxT = 10;
nT = 200;
unitT = 'sec';

dT = (maxT - minT) / (nT - 1);
Time = minT:dT:maxT;

disp(['First time point is ' num2str(minT) unitT]);
disp(['Last time point is ' num2str(maxT) unitT]);
disp(['Number of time points is ' num2str(nT)]);
disp(['Sampling time is ' num2str(dT) unitT]);
disp(['All time points (in unit of ' unitT ') are ' num2str(Time)]);
disp(['All time points (in unit of ' unitT ') are as below:']);
disp(num2str(Time'));
