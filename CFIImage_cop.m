dir_R = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Red root folder');
dir_G = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Green root folder');
dir_B = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Blue root folder');
[lmafil,lmapat] = uigetfile('*','Choose a landmask');

lmaname = fullfile(lmapat,lmafil);
lmachan = imread(lmaname);
%lmachan = lmachan(1400:2000,1400:2000);
thresh_RL = 153;
thresh_RS = 50;
thresh_GL = 116;
thresh_GS = 50;
thresh_BL = 123;
thresh_BS = 44;

filecount = 30 %size(dir([dir_R '/*.jpg']),1);

imagesiz_X = 3712;
imagesiz_Y = 3712;

GR = zeros([imagesiz_X imagesiz_Y filecount]);
GG = zeros([imagesiz_X imagesiz_Y filecount]);
GB = zeros([imagesiz_X imagesiz_Y filecount]);

Rdir = dir(dir_R);
Gdir = dir(dir_G);
Bdir = dir(dir_B);



for i = 3:filecount
    CHAN_R = imread(fullfile(dir_R,Rdir(i).name));
    CHAN_G = imread(fullfile(dir_G,Gdir(i).name));
    CHAN_B = imread(fullfile(dir_B,Bdir(i).name));
    %CHAN_R = CHAN_R(1400:2000,1400:2000);
    %CHAN_G = CHAN_G(1400:2000,1400:2000);
    %CHAN_B = CHAN_B(1400:2000,1400:2000);
    GR(:,:,i) = CloudSepLMANaN(CHAN_R,lmachan,thresh_RL,thresh_RS);
    GG(:,:,i) = CloudSepLMANaN(CHAN_G,lmachan,thresh_GL,thresh_GS);
    GB(:,:,i) = CloudSepLMANaN(CHAN_B,lmachan,thresh_BL,thresh_BS);
end
%figure;
%imshow(GR(:,:,2),[0,255])
res_R = nanmean(GR,3);
res_G = nanmean(GG,3);
res_B = nanmean(GB,3);
figure;
imshow(res_R./255)
imwrite(res_R./255, 'avgim_R.png')
figure;
imshow(res_G./255)
imwrite(res_G./255, 'avgim_G.png')
figure;
imshow(res_B./255)
imwrite(res_B./255, 'avgim_B.png')
res_RGB = RGBcreator(res_R/255,res_G/255,res_B/255);
figure;
imshow(res_RGB)
imwrite(res_RGB, 'avgim_RGB.png')




