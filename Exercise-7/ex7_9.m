function ex7_9()
    % 1. Generating and displaying a time interval
    % 2. Simulating/plotting an exponential (kinetics) model
    % 3. Simulating/plotting a bi-exponential (kinetics) model
    % 4. Normalizing all curves for easy comparison of (effective) rate
    % 5. Fitting a bi-exponential curve to (simulated) data
    % 6. Fitting directly (without GUI)
    % 9. Sliders for noise level / one rate constant + modular programming
    
    Initialize();

    h = figure;
    hold on;
    box on;

    [Time, unitT] = getTime();

    [Amp1, Rate1, Amp2, Rate2, noiseLevel] = getDecayParam();
    
    [I1, I2, IAll] = ...
        getIntensities(Amp1, Rate1, Amp2, Rate2, noiseLevel);

    IRecon = getFit(IAll);
    
    plotCurves(Rate1, Rate2, I1, I2, IAll, IRecon, unitT);
    
    maxNoise = 0.01 * max(IAll);
    DefineNoiseUIControls(h, maxNoise);
    DefineRate1UIControls(h, Rate1);
    
    function DefineRate1UIControls(h, Rate1)
        uicontrol(h,'Style', 'slider',...
            'Min',0,'Max',Rate1 * 10,'Value',Rate1,...
            'units','norm',...
            'Position', [0.62 0.01 0.15 0.03],...
            'Callback',@SetRate1Level);
    end

    function SetRate1Level(hObj, Event)
        sliderValue = get(hObj,'Value');
        
        Rate1 = sliderValue;
        [I1_, I2_, IAll_] = ...
            getIntensities(Amp1, Rate1, Amp2, Rate2, noiseLevel);
        IRecon_ = getFit(IAll_);
        cla;
        plotCurves(Rate1, Rate2, I1_, I2_, IAll_, IRecon_, unitT);
    end

    function DefineNoiseUIControls(h, maxBaseline)
        uicontrol(h,'Style', 'slider',...
            'Min',0,'Max',maxBaseline,'Value',0,...
            'units','norm',...
            'Position', [0.80 0.01 0.15 0.03],...
            'Callback',@SetNoiseLevel);
    end

    function SetNoiseLevel(hObj, Event)
        sliderValue = get(hObj,'Value');
        
        noiseLevel_ = sliderValue;
        [I1_, I2_, IAll_] = ...
            getIntensities(Amp1, Rate1, Amp2, Rate2, noiseLevel_);
        IRecon_ = getFit(IAll_);
        cla;
        plotCurves(Rate1, Rate2, I1_, I2_, IAll_, IRecon_, unitT);
    end
    
    function plotCurves(Rate1, Rate2, I1, I2, IAll, IRecon, unitT)
        plot(Time, I1, 'b--');
        plot(Time, I2, 'r--');
        plot(Time, IAll, 'k');
        plot(Time, IRecon, 'y.');
        xlabel(['Time (' unitT ')']);
        ylabel('Intensity');
        legend('Channel 1', 'Channel 2', 'Both Channels', 'Reconstructed');
        title(['Rates_{Simulated} = ' num2str([Rate1 Rate2])]);
    end

    function IRecon = getFit(IAll)
        aFitType = fittype('a * exp(-b * t) + c * exp(-d * t)','independent','t');
        fitObj = fit(Time', IAll',aFitType);
        disp(fitObj);
        IRecon = feval(fitObj, Time);
    end

    function [I1, I2, IAll] = ...
            getIntensities(Amp1, Rate1, Amp2, Rate2, noiseLevel)
        I1 = Amp1 * exp(- Rate1 * Time);
        I2 = Amp2 * exp(- Rate2 * Time);
        INoise = noiseLevel * randn(size(I1));
        IAll = I1 + I2 + INoise;
    end

    function [Amp1, Rate1, Amp2, Rate2, Baseline] = getDecayParam()
        Amp1 = 1;
        Rate1 = 0.1;
        Rate_1_unit = '1/sec';

        Amp2 = 0.8;
        Rate2 = 0.2;
        Rate_2_unit = '1/sec';

        Baseline = 0.01 * mean([Amp1 Amp2]);
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
