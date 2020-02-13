dir_R = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Red root folder');
dir_G = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Green root folder');
dir_B = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Blue root folder');
[lmafil,lmapat] = uigetfile('*','Choose a landmask');

lmaname = fullfile(lmapat,lmafil);
lmachan = imread(lmaname);

thresh_RL = 153;
thresh_RS = 50;
thresh_GL = 116;
thresh_GS = 50;
thresh_BL = 123;
thresh_BS = 44;

filecount = size(dir([dir_R '/*.jpg']),1);

GR = zeros([3712 3712 filecount]);
GG = zeros([3712 3712 filecount]);
GB = zeros([3712 3712 filecount]);


for i = 1:filecount
    CHAN_R = imread(fullfile(dir_R,sprintf('CHAN_R%u.jpg',i)));
    CHAN_G = imread(fullfile(dir_G,sprintf('CHAN_G%u.jpg',i)));
    CHAN_B = imread(fullfile(dir_B,sprintf('CHAN_B%u.jpg',i)));
    GR(:,:,i) = CloudSepLMANaN(CHAN_R,lmachan,thresh_RL,thresh_RS);
    GG(:,:,i) = CloudSepLMANaN(CHAN_G,lmachan,thresh_GL,thresh_GS);
    GB(:,:,i) = CloudSepLMANaN(CHAN_B,lmachan,thresh_BL,thresh_BS);
end

res_R = nanmean(GR,3);
res_G = nanmean(GG,3);
res_B = nanmean(GB,3);
figure;
imshow(res_R)
figure;
imshow(res_G)
figure;
imshow(res_B)





