function ex6_3()
    % 1. Initializing and getting the "Electron Microscopy Database" ID
    % 2. Displaying the hyperlink to "Electron Microscopy Database"
    % 3. Downloading/unzipping the Density Map file and displaying info
    
    Initialize();
    emdID = getEMD_ID();
    dispEMDLink(emdID);
    mapFile = getLocalMapFile(emdID);
    

    function mapFile = getLocalMapFile(emdID)
        ftpServer = 'ftp.ebi.ac.uk';
        ftpAddress = ['/pub/databases/emdb/structures/EMD-' emdID '/map/emd_' emdID '.map.gz'];

        disp(' ');
        disp('Establishing an FTP connection with the EMD server ...');
        ngdc = ftp(ftpServer);
        disp('FTP connection was established.');

        disp('Downloading the zipped density map ...');
        zippedMapFile = mget(ngdc, ftpAddress);
        disp('The zipped density map was downloaded.');
        
        disp('Closing the FTP connection ...');
        close(ngdc);
        disp('The FTP connection was closed.');
        
        %The sought map file is the first element in a 1-element list
        zippedMapFile = zippedMapFile{1};
        
        disp('Unzipping the downloaded file ...');
        mapFile = gunzip(zippedMapFile);
        disp('Unzipping was completed.');

        %The sought map file is the first element in a 1-element list
        mapFile = mapFile{1};
        
        disp('(Unzipped) Map file on local computer is :');
        disp(mapFile);
    end

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
