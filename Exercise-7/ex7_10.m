function ex7_10()
    % 1. Generating and displaying a time interval
    % 2. Simulating/plotting an exponential (kinetics) model
    % 3. Simulating/plotting a bi-exponential (kinetics) model
    % 4. Normalizing all curves for easy comparison of (effective) rate
    % 5. Fitting a bi-exponential curve to (simulated) data
    % 6. Fitting directly (without GUI)
    % 10. Sliders for feedback level (controlloing 2nd order dynamics)
    
    Initialize();

    h = figure;
    hold on;
    box on;

    [Time, unitT] = getTime();
    
    kFeedback = 5;
    I0 = getDynamics(kFeedback);
    plotDynamics(I0);

    DefineFeedbackUIControls(h, kFeedback);
    
    function DefineFeedbackUIControls(h, k0)
        uicontrol(h,'Style', 'slider',...
            'Min',0,'Max',k0,'Value',k0,...
            'units','norm',...
            'Position', [0.62 0.01 0.15 0.03],...
            'Callback',@SetFeedbackLevel);
    end

    function SetFeedbackLevel(hObj, Event)
        sliderValue = get(hObj,'Value');
        
        kFeedback = sliderValue;
        I = getDynamics(kFeedback);
        cla;
        plotDynamics(I);
    end

    function I = getDynamics(k)
        Delta = k ^ 2 - 1;
        if (Delta > 0)
            Delta_ = sqrt(Delta);
            S = [- k + Delta_, - k - Delta_];
            A = [S(2) / (S(2) - S(1)), S(1) / (S(1) - S(2))];
            I = A(1) * exp(S(1) * Time) + A(2) * exp(S(2) * Time);
        elseif (Delta == 0)
            I = exp(- k * Time) .* (1 - Time);
        elseif (Delta < 0)
            Alpha = - k;
            Beta = sqrt(- Delta);
            I = exp(Alpha * Time) .* ((Alpha / Beta) * sin(Beta * Time) + cos(Beta * Time));
        end
    end

    function plotDynamics(I)
        I = I / max(abs(I));
        plot(Time, I, 'b--');
        xlabel(['Time (' unitT ')']);
        ylabel('Intensity');
        title(['Feedback parameter = ' num2str(kFeedback)]);
        ylim([-1 1]);
    end

    function [Time, unitT] = getTime()
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
    end

    function Initialize()
        close all force;
        clear;
        clc;
    end
end
