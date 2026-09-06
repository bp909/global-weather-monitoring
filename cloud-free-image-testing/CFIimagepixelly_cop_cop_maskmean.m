dir_R = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Red root folder');
dir_G = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Green root folder');
dir_B = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Blue root folder');
[lmafil,lmapat] = uigetfile('*','Choose a landmask');

lmaname = fullfile(lmapat,lmafil);
lmachan = imread(lmaname);
%lmachan = lmachan(1876:2476,1427:2027);
thresh_RL = 153;
thresh_RS = 50;
thresh_GL = 116;
thresh_GS = 50;
thresh_BL = 123;
thresh_BS = 44;

filecount = 70; % size(dir([dir_R '/*.jpg']),1);
imagesiz_X = 3712;
imagesiz_Y = 3712;

GR = zeros([imagesiz_X imagesiz_Y filecount]);
GG = zeros([imagesiz_X imagesiz_Y filecount]);
GB = zeros([imagesiz_X imagesiz_Y filecount]);

Rdir = dir(dir_R);
Gdir = dir(dir_G);
Bdir = dir(dir_B);

j = 1;

for i = 3:7:367
     CHAN_R = imread(fullfile(dir_R,Rdir(i).name));
     CHAN_G = imread(fullfile(dir_G,Gdir(i).name));
     CHAN_B = imread(fullfile(dir_B,Bdir(i).name));
%     CHAN_R = CHAN_R(1876:2476,1427:2027);
%     CHAN_G = CHAN_G(1876:2476,1427:2027);
%     CHAN_B = CHAN_B(1876:2476,1427:2027);
%     GR(:,:,i-179) = CloudSepLMANaN(CHAN_R,lmachan,thresh_RL,thresh_RS);
%     GG(:,:,i-179) = CloudSepLMANaN(CHAN_G,lmachan,thresh_GL,thresh_GS);
%     GB(:,:,i-179) = CloudSepLMANaN(CHAN_B,lmachan,thresh_BL,thresh_BS);
     GR(:,:,j) = CHAN_R; %(1876:2476,1427:2027);
     GG(:,:,j) = CHAN_G; %(1876:2476,1427:2027);
     GB(:,:,j) = CHAN_B; %(1876:2476,1427:2027);
     j = j+1;
end



figure;
histogram(nonzeros(GR(2126,1443,:)))
figure;
histogram(nonzeros(GG(2126,1443,:)))
figure;
histogram(nonzeros(GB(2126,1443,:)))

% threshmean_R = zeros([imagesiz_X imagesiz_Y]);
% threshmean_G = zeros([imagesiz_X imagesiz_Y]);
% threshmean_B = zeros([imagesiz_X imagesiz_Y]);


GR(GR == 0) = NaN;
GG(GG == 0) = NaN;
GB(GB == 0) = NaN;
threshmean_R = nanmean(GR,3); %min(GR,[],3,'omitnan');
threshmean_G = nanmean(GG,3); %min(GG,[],3,'omitnan');
threshmean_B = nanmean(GB,3); %min(GB,[],3,'omitnan');
figure;
imshow(threshmean_R)
figure;
imshow(threshmean_G)
figure;
imshow(threshmean_B)

res_RGB = RGBcreator(threshmean_R/255,threshmean_G/255,threshmean_B/255);
figure;
imshow(res_RGB)
imwrite(res_RGB, 'pivelminim_RGB30.png')


