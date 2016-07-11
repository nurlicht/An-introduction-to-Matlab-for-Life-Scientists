function ex6_1()
    % 1. Initializing and getting the "Electron Microscopy Database" ID

    Initialize();
    emdID = getEMD_ID();

    function emdID = getEMD_ID()
        %ID is simply being assigned (could come from the user, a file ...)
        emdID = '6495';
        
        disp([ ...
            'Selected Electron Microscopy Database ID is emdID = ' ...
            emdID ...
            ]);
    end    
    function Initialize()
        close all force;
        clear;
        clc;
    end    
end
