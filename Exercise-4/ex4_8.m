function ex4_8()
    % 1. Displaying the path (URL) of the EB3 video file
    % 2. Loading the EB3 video file
    % 3. Getting the dimensions of the loaded image
    % 4. Showing the first frame
    % 5. Adjusting some parameters of the image
    % 7. Displaying a frame using a slider
    % 8. Further customization of the slider (and its "Callback")
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

    %New part (8)
    uicontrol(...
        'Style', 'slider',...
        'Min',1,'Max',nT,'Value',1,...
        'Position', [400 20 120 20],...
        'Callback', @frameSelect...
        );
    
    %End of program

    
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
    %
end
