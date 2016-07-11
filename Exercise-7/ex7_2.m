% 1. Generating and displaying a time interval
% 2. Simulating/plotting an exponential (kinetics) model

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

% New part(2)
Amplitude_1 = 1;
Rate_1 = 0.1;
Rate_1_unit = '1/sec';

Intensity_1 = Amplitude_1 * exp(- Rate_1 * Time);
plot(Time, Intensity_1, 'b');
xlabel(['Time (' unitT ')']);
ylabel('Intensity');
%
