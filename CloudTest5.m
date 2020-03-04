%% Imager version 5.0 (Splitting each colour channel + New algorithm)
clc
clear variables
%% Image importation into 3D block array
% IMPORTANT: Remember to add images to MATLAB pathway BEFORE running this program for the first time!
% Note: This section is specifically programmed with particular file names intended,
%       modification is neccessary to read any other file names.

kmax=14; %Number of images per colour (MANUALLY SET)
M=0;     %Image number counter (Dummy)
disp('Searching for images...')
disp(' ')

for i=string({'VIS006','VIS008','IR_016'})
    for k=1:kmax
        % Create an image filename, and read it into imageData.
        FileName=strcat('HMSG2_',i,'_0908',num2str(k,'%02d'),'_1200.jpg');
        if exist(FileName, 'file')
            M=M+1;
            imageData(1:size(imread(FileName),1),1:size(imread(FileName),2),M)=imread(FileName);
            fprintf('File %s found.\n',FileName);
        else
            fprintf('File %s not found.\n',FileName);
        end
    end
end

%% Cloud removal and display
close all
disp(' ')
disp('Processing...')
imSize=size(imageData,1);  %Image side length
figure('Name','Recovered Images','NumberTitle','off','Units','normalized','Position',[0.1 0.2 0.8 0.6])

for h=1:3                        %Repeat program for each colour
    newGround=NaN(imSize);       %Initial new ground recreation for each colour
    for N=(h-1)*kmax+1:kmax*h    %Defining range of imageData that corresponds to each colour
        %% Full Image
        for i=1:imSize
            for j=1:imSize
                %% Resolving ground
                if N==(h-1)*kmax+1                                       %Copy all data across for the first picture
                    newGround(i,j)=imageData(i,j,N);
                elseif N>(h-1)*kmax+1 && imageData(i,j,N)<newGround(i,j) %Replace any pixels which are darker than the old ones
                    newGround(i,j)=imageData(i,j,N);
                end
            end
        end
    end
    %% Displaying
    subplot(1,3,h)
    imshow(newGround,gray)
    if h==1
        title("\fontsize{12}Green")
        Green=newGround; %Storage for later use if needed
    elseif h==2
        title("\fontsize{12}Blue")
        Blue=newGround;
    elseif h==3
        title("\fontsize{12}Red")
        Red=newGround;
    end
    axis off
    axis square
    hold on
end
res_RGB = RGBcreator(Red,Green,Blue);
imshow(res_RGB)
clc
disp('Complete')
disp(' ')
disp(['Number of clouded images used = ',num2str(N)])