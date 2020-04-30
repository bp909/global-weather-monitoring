dir_R = uigetdir('E:\Resources\GWM\all_of_it','Choose your Red root folder');
dir_G = uigetdir('E:\Resources\GWM\all_of_it','Choose your Green root folder');
dir_B = uigetdir('E:\Resources\GWM\all_of_it','Choose your Blue root folder');
lim_UP = 600;
lim_LO = 3050;
lim_RI = 3400;
lim_LE = 1230;
[lmafil,lmapat] = uigetfile('*','Choose a landmask');
lmaname = fullfile(lmapat,lmafil);
chan_L = imread(lmaname);
chan_L = chan_L(lim_UP:lim_LO,lim_LE:lim_RI);

[lodfil,lodpat] = uigetfile('*','Choose a list of dates');
lodname = fullfile(lodpat,lodfil);
dates = readmatrix(lodname);
filecount = 14;
days = length(dates);

imagesiz_Y = (lim_LO-lim_UP)+1;
imagesiz_X = (lim_RI-lim_LE)+1;
chan_R = zeros([imagesiz_Y imagesiz_X filecount]);
chan_G = zeros([imagesiz_Y imagesiz_X filecount]);
chan_B = zeros([imagesiz_Y imagesiz_X filecount]);
modecount = floor(days./filecount);

colcfi_R = zeros([imagesiz_Y imagesiz_X modecount]);
colcfi_G = zeros([imagesiz_Y imagesiz_X modecount]);
colcfi_B = zeros([imagesiz_Y imagesiz_X modecount]);

colste_R = zeros([imagesiz_Y imagesiz_X modecount]);
colste_G = zeros([imagesiz_Y imagesiz_X modecount]);
colste_B = zeros([imagesiz_Y imagesiz_X modecount]);

l = 0;
for i=1:filecount:days
    k=0;
    for j = i:(i+(filecount-1))
        k=k+1;
        name = ['*SEVI*',num2str(dates(j)),'*.jpg'];
        name_R = dir(fullfile(dir_R, name));
        name_G = dir(fullfile(dir_G, name));
        name_B = dir(fullfile(dir_B, name));
        single_R = imread(fullfile(dir_R,name_R.name));
        single_G = imread(fullfile(dir_G,name_G.name));
        single_B = imread(fullfile(dir_B,name_B.name));
        chan_R(:,:,k) = single_R(lim_UP:lim_LO,lim_LE:lim_RI);
        chan_G(:,:,k) = single_G(lim_UP:lim_LO,lim_LE:lim_RI);
        chan_B(:,:,k) = single_B(lim_UP:lim_LO,lim_LE:lim_RI);
    end
    [CFI_R, CFI_G, CFI_B, STD_R, STD_G, STD_B] = CFImaker(chan_R, chan_G, chan_B);
    l = l+1
    colcfi_R(:,:,l) = uint8(CFI_R);
    colcfi_G(:,:,l) = uint8(CFI_G);
    colcfi_B(:,:,l) = uint8(CFI_B);
    colste_R(:,:,l) = STD_R./sqrt(filecount);
    colste_G(:,:,l) = STD_G./sqrt(filecount);
    colste_B(:,:,l) = STD_B./sqrt(filecount);
end

colcfi_R = uint8(colcfi_R);
colcfi_G = uint8(colcfi_G);
colcfi_B = uint8(colcfi_B);

str = ['colcfi_R' ,lodfil(6:11) ,' = colcfi_R;'];
eval(str);
str = ['colcfi_G' ,lodfil(6:11) ,' = colcfi_G;'];
eval(str);
str = ['colcfi_B' ,lodfil(6:11) ,' = colcfi_B;'];
eval(str);
str = ['colste_R' ,lodfil(6:11) ,' = colste_R;'];
eval(str);
str = ['colste_G' ,lodfil(6:11) ,' = colste_G;'];
eval(str);
str = ['colste_B' ,lodfil(6:11) ,' = colste_B;'];
eval(str);

percentcovtrack = zeros(1, modecount);
NDVIimgs = zeros([imagesiz_Y imagesiz_X modecount]);

for m = 1:modecount
    [percentcovtrack(m), NDVIimgs(:,:,m)] = NDVIcalc(colcfi_R(:,:,m),colcfi_G(:,:,m),chan_L);
end

str = ['NDVIimgs' ,lodfil(6:11) ,' = NDVIimgs;'];
eval(str);
str = ['coverage' ,lodfil(6:11) ,' = percentcovtrack;'];
eval(str);
