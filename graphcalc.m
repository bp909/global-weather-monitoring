dir_R = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Red root folder');
dir_G = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Green root folder');
dir_B = uigetdir('C:\Users\brain\MATLAB\Projects\weather-watcher\resources\Photos','Choose your Blue root folder');

[lmafil,lmapat] = uigetfile('*','Choose a landmask');
lmaname = fullfile(lmapat,lmafil);
chan_L = imread(lmaname);

[lodfil,lodpat] = uigetfile('*','Choose a list of dates');
lodname = fullfile(lodpat,lodfil);
dates = table2array(readtable(lodname));
filecount = 14;
imagesiz_X = (2250-700)-1;
imagesiz_Y = (2800-1750)-1;
chan_R = zeros([imagesiz_X imagesiz_Y filecount]);
chan_G = zeros([imagesiz_X imagesiz_Y filecount]);
chan_B = zeros([imagesiz_X imagesiz_Y filecount]);
modecount = 364./filecount;

colcfi_R = zeros([imagesiz_X imagesiz_Y modecount]);
colcfi_G = zeros([imagesiz_X imagesiz_Y modecount]);
colcfi_B = zeros([imagesiz_X imagesiz_Y modecount]);

for i=1:filecount:364
    k=0;
    for j = i:(i+(filecount-1))
        k=k+1;
        date = dates(j);
        name = ['*',num2str(dates(j)),'.jpg'];
        single_R = imread(fullfile(dir_R, name));
        single_G = imread(fullfile(dir_G, name));
        single_B = imread(fullfile(dir_B, name));
        chan_R(:,:,k) = single_R(700:2250,1750:2800);
        chan_G(:,:,k) = single_G(700:2250,1750:2800);
        chan_B(:,:,k) = single_B(700:2250,1750:2800);
        [CFI_R, CFI_G, CFI_B] = CFImaker(chan_R, chan_G, chan_B);
    end
    colcfi_R(:,:,i) = CFI_R;
    colcfi_G(:,:,i) = CFI_G;
    colcfi_B(:,:,i) = CFI_B;
end
percentagecover = NDVIcalc(colcfi_R,colcfi_G,chan_L);

