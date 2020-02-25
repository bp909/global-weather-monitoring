dir_R = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Red root folder');
dir_G = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Green root folder');
dir_B = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Blue root folder');
[lmafil,lmapat] = uigetfile('*','Choose a landmask');

lmaname = fullfile(lmapat,lmafil);
lmachan = imread(lmaname);
lmachan = lmachan(1876:2476,1427:2027);
thresh_RL = 153;
thresh_RS = 50;
thresh_GL = 116;
thresh_GS = 50;
thresh_BL = 123;
thresh_BS = 44;

filecount = size(dir([dir_R '/*.jpg']),1);
imagesiz_X = 601;
imagesiz_Y = 601;

GR = zeros([imagesiz_X imagesiz_Y filecount]);
GG = zeros([imagesiz_X imagesiz_Y filecount]);
GB = zeros([imagesiz_X imagesiz_Y filecount]);


for i = 1:filecount
    CHAN_R = imread(fullfile(dir_R,sprintf('CHAN_R%u.jpg',i)));
    CHAN_G = imread(fullfile(dir_G,sprintf('CHAN_G%u.jpg',i)));
    CHAN_B = imread(fullfile(dir_B,sprintf('CHAN_B%u.jpg',i)));
    CHAN_R = CHAN_R(1876:2476,1427:2027);
    CHAN_G = CHAN_G(1876:2476,1427:2027);
    CHAN_B = CHAN_B(1876:2476,1427:2027);
    GR(:,:,i) = CloudSepLMANaN(CHAN_R,lmachan,thresh_RL,thresh_RS);
    GG(:,:,i) = CloudSepLMANaN(CHAN_G,lmachan,thresh_GL,thresh_GS);
    GB(:,:,i) = CloudSepLMANaN(CHAN_B,lmachan,thresh_BL,thresh_BS);
end



% figure;
% histogram(nonzeros(GR(2126,1443,:)))
% figure;
% histogram(nonzeros(GG(2126,1443,:)))
% figure;
% histogram(nonzeros(GB(2126,1443,:)))

threshmean_R = zeros([imagesiz_X imagesiz_Y]);
threshmean_G = zeros([imagesiz_X imagesiz_Y]);
threshmean_B = zeros([imagesiz_X imagesiz_Y]);

for j = 1:imagesiz_X
    for k = 1:imagesiz_Y
        threshmean_R(j,k) = mean(nonzeros(GR(j,k,:)));
        threshmean_G(j,k) = mean(nonzeros(GG(j,k,:)));
        threshmean_B(j,k) = mean(nonzeros(GB(j,k,:)));
    end
end

figure;
imshow(threshmean_R/255)
figure;
imshow(threshmean_G/255)
figure;
imshow(threshmean_B/255)


