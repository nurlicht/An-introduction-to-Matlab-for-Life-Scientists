function ex6_7()
    % 1. Initializing and getting the "Electron Microscopy Database" ID
    % 2. Displaying the hyperlink to "Electron Microscopy Database"
    % 3. Downloading/unzipping the Density Map file and displaying info
    % 4. Displaying information regarding the format of the density map
    % 5. Loading the density map data
    % 6. Creating a figure and a slider
    % 7. Plotting projection (of the entire data) + isosurface (contour) 
    
    Initialize();
    emdID = getEMD_ID();
    dispEMDLink(emdID);
    mapFile = getLocalMapFile(emdID);
    dispInfoOnMRCFileFormat();
    map3D = Load_MRC(mapFile);
    h = figure();
    Define_UIControls(h);
    
    function Plot_Object(IsoSurfLevel)
        proj = squeeze(sum(map3D,3));
        contourf(proj);
        axis equal;

        isoSurface = isosurface(map3D,IsoSurfLevel);
        patch(isoSurface,'EdgeColor','none','FaceColor',[1, 0, 0]);
        title(['Isosurface (Isovalue = ' num2str(IsoSurfLevel) ')']);
        axis equal;
        axis tight;
        axis off;
        camlight left;
        camlight;
        lighting gouraud;
        camva(8);
        view(-40, 15);
    end    

    function U = Define_UIControls(h)
        U = uicontrol(h,'Style', 'slider',...
            'Min',0,'Max',1,'Value',0.5,...
            'units','norm',...
            'Position', [0.05 0.1 0.03 0.2],...
            'Callback',@SetIsoSurfLevel);
    end

    function SetIsoSurfLevel(hObj,Event)
        %Fixed code
        sliderValue = get(hObj,'Value');
        
        %Application-dependent
        IsoSurfLevel = sliderValue;
        Plot_Object(IsoSurfLevel);
        title(num2str(IsoSurfLevel));
    end

    function map3D = Load_MRC(mapFile)
        disp(' ');

        disp(['Opening the map file ... (' mapFile ')']);
        fid = fopen(mapFile);

        disp('Reading Nx, Ny, and Nz from the map file ... ');
        NC = fread(fid,1,'uint');
        NR = fread(fid,1,'uint');
        NS = fread(fid,1,'uint');
        
        disp('Closing the map file ... ');
        fclose(fid);

        
        
        disp(['Opening the map file ... (' mapFile ')']);
        fid = fopen(mapFile);

        disp('Reading the entire file ... ');
        fileText = fread(fid,inf,'single');

        disp('Closing the map file ... ');
        fclose(fid);
        
        

        % Calculating the number of elements of the map data I(x,y,z)
        nDensity = NC * NR * NS;
      
        % Calculating the 1st/last indices of map data I(x,y,z)
        nFileText = length(fileText);
        startPoint = nFileText - nDensity + 1;
        endPoint = nFileText;
        
        disp('Taking the last (Nx*Ny*Nz) numbers as density map ... ');
        map1D = fileText(startPoint:endPoint, 1);

        % Taking the last (Nx * Ny * Nz) numbers as the density map data
        disp('Re-arranging the loaded map as a 3D array I(x,y,z) ... ');
        map3D = reshape(map1D, NC, NR, NS);
        disp('The 3D map data was created.');
    end
    
    function dispInfoOnMRCFileFormat()
        URL = 'http://www.ccp4.ac.uk/html/maplib.html#description';
        Text = 'CCP4';
        disp(' ');
        disp([ ...
                'File format of density maps (MRC and ' ...
                getHyperlinkText(URL, Text) ...
                ')' ...
            ]);
        disp('The first three (header) numbers are Nx, Ny, Nz.');
    end

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
