% 1. Generating and displaying a time interval
% 2. Simulating/plotting an exponential (kinetics) model
% 3. Simulating/plotting a bi-exponential (kinetics) model
% 4. Normalizing all curves for easy comparison of (effective) rate
% 5. Fitting a bi-exponential curve to (simulated) data

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

Amplitude_1 = 1;
Rate_1 = 0.1;
Rate_1_unit = '1/sec';

Intensity_1 = Amplitude_1 * exp(- Rate_1 * Time);
plot(Time, Intensity_1, 'b--');
xlabel(['Time (' unitT ')']);
ylabel('Intensity');

Amplitude_2 = 0.8;
Rate_2 = 0.2;
Rate_2_unit = '1/sec';

Intensity_2 = Amplitude_2 * exp(- Rate_2 * Time);
hold on;
plot(Time, Intensity_2, 'r--');

Intensity_All = Intensity_1 + Intensity_2;
hold on;
plot(Time, Intensity_All, 'k');

legend('Channel 1', 'Channel 2', 'Both Channels');

Intensity_1_norm = Intensity_1 / max(Intensity_1);
Intensity_2_norm = Intensity_2 / max(Intensity_2);
Intensity_All_norm = Intensity_All / max(Intensity_All);

figure;
hold on;
plot(Time, Intensity_1_norm, 'b--');
plot(Time, Intensity_2_norm, 'r--');
plot(Time, Intensity_All_norm, 'k');
xlabel(['Time (' unitT ')']);
ylabel('{\bfNormalized} Intensity');
legend('Channel 1', 'Channel 2', 'Both Channels');
box on;

% New part(5)
% Options for the 'cftool' commnad:
% X data: Time
% Y data: Intensity_All
% Model: Custom Equation --> a*exp(-b*x)+c*exp(-d*x)
cftool;
