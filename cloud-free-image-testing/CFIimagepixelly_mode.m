dir_R = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Red root folder');
dir_G = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Green root folder');
dir_B = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Blue root folder');
[lmafil,lmapat] = uigetfile('*','Choose a landmask');

lmaname = fullfile(lmapat,lmafil);
lmachan = imread(lmaname);


filecount = 30;
imagesiz_X = 3712;
imagesiz_Y = 3712;

GR = zeros([imagesiz_X imagesiz_Y filecount]);
GG = zeros([imagesiz_X imagesiz_Y filecount]);
GB = zeros([imagesiz_X imagesiz_Y filecount]);

Rdir = dir(dir_R);
Gdir = dir(dir_G);
Bdir = dir(dir_B);
j = 1;
for i = 3:10:343
     CHAN_R = imread(fullfile(dir_R,Rdir(i).name));
     CHAN_G = imread(fullfile(dir_G,Gdir(i).name));
     CHAN_B = imread(fullfile(dir_B,Bdir(i).name));
     GR(:,:,j) = CHAN_R; %(1876:2476,1427:2027);
     GG(:,:,j) = CHAN_G; %(1876:2476,1427:2027);
     GB(:,:,j) = CHAN_B; %(1876:2476,1427:2027);
    j=j+1;
end



figure;
histogram(nonzeros(GR(2126,1443,:)))
figure;
histogram(nonzeros(GG(2126,1443,:)))
figure;
histogram(nonzeros(GB(2126,1443,:)))


GR(GR == 0) = NaN;
GG(GG == 0) = NaN;
GB(GB == 0) = NaN;
% GR = round(GR/5)*5;
% GG = round(GG/5)*5;
% GB = round(GB/5)*5;

threshmean_R = mode(GR,3); %min(GR,[],3,'omitnan');
threshmean_G = mode(GG,3); %min(GG,[],3,'omitnan');
threshmean_B = mode(GB,3); %min(GB,[],3,'omitnan');
figure;
imshow(threshmean_R/255)
imwrite(threshmean_R/255, 'pivelmodetest_R.jpg')
figure;
imshow(threshmean_G/255)
imwrite(threshmean_G/255, 'pivelmodetest_G.jpg')
figure;
imshow(threshmean_B/255)
imwrite(threshmean_B/255, 'pivelmodetest_B.jpg')
res_RGB = RGBcreator(threshmean_R/255,threshmean_G/255,threshmean_B/255);
figure;
imshow(res_RGB)
imwrite(res_RGB, 'pivelmode_RGB30.png')


