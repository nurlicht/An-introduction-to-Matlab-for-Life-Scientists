function ex4_9()
    % 1. Displaying the path (URL) of the EB3 video file
    % 2. Loading the EB3 video file
    % 3. Getting the dimensions of the loaded image
    % 4. Showing the first frame
    % 5. Adjusting some parameters of the image
    % 7. Displaying a frame using a slider
    % 8. Further customization of the slider (and its "Callback")
    % 9. Adding a second UI Control for display of axes
    close all force;
    clear;
    clc;
    
    path = 'http://www.zmbh.uni-heidelberg.de/Central_Services/Imaging_Facility/Matlab/Data/Images/Microtubule_1.gif';
    message = ['The path of the EB3 video file is ' path];
    disp(message);
    
    disp('Loading the EB3 video file. Please wait ... ');
    Images = imread(path);
    disp('Loading the EB3 video file completed.');
    disp('Please check the new variable in "Workspace".');

    dimensionXYZT = size(Images);
    nX = dimensionXYZT(1);
    nY = dimensionXYZT(2);
    nZ = dimensionXYZT(3);
    nT = dimensionXYZT(4);
    
    nXText = num2str(nX);
    nYText = num2str(nY);
    nZText = num2str(nZ);
    nTText = num2str(nT);
    
    message = [nTText ' images of size ' nXText ' x ' nYText];
    disp(message);

    uicontrol(...
        'Style', 'slider',...
        'Min',1,'Max',nT,'Value',1,...
        'Position', [400 20 120 20],...
        'Callback', @frameSelect...
        );
    
    %New part (9)
    displayAxes = 0;
    
    uicontrol(...
        'Style', 'pushbutton', ...
        'String', 'Toggle Axes', ...
        'Position', [300 20 80 20],...
        'Callback', @setAxesVisibility ...
        );
    %End of program

    %The following function will be used only in response to the pushbutton
    function setAxesVisibility(source, callbackdata)
        if (displayAxes == 0)
            displayAxes = 1;
            axis on;
        else
            displayAxes = 0;
            axis off;
        end
        
        drawnow;
    end
    %

    
    %The following function will be used only in response to the slider
    function frameSelect(source, callbackdata)
        %Getting the slider value (fixed code)
        sliderValue = get(source, 'Value');
        %
        
        %Using the slider value (application-dependent)
        frameIndex = round(sliderValue);
        frame = squeeze(Images(:,:,:,frameIndex));
        imagesc(frame);
        axis equal;
        axis off
        colormap(gray);
        drawnow;
    end
end
