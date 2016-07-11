function ex6_2()
    % 1. Initializing and getting the "Electron Microscopy Database" ID
    % 2. Displaying the hyperlink to "Electron Microscopy Database"
    
    Initialize();
    emdID = getEMD_ID();
    dispEMDLink(emdID);

    function dispEMDLink(emdID)
        URL = ['http://www.ebi.ac.uk/pdbe/entry/emdb/EMD-' emdID];
        Text = 'apo human XPC complex';
        EMDLink = ['Density Map of ' getHyperlinkText(URL, Text)];
        disp(EMDLink);
    end

    function hyperlinkText = getHyperlinkText(URL, Text)
        hyperlinkText = [...
            '<a href="' ...
                URL ...
                '" target="_blank">' ...
                Text ...
            '</a>' ...
        ];
    end

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
