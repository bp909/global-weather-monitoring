% This script creates a NDVI image
[redfil,redpat] = uigetfile('*','Choose a Redclearpic');
[grefil,grepat] = uigetfile('*','Choose a Greclearpic');
[lmafil,lmapat] = uigetfile('*','Choose a landmask');


redname = fullfile(redpat,redfil);
redchan = imread(redname);
redchan = redchan(700:2250,1750:2800);

grename = fullfile(grepat,grefil);
grechan = imread(grename);
grechan = grechan(700:2250,1750:2800);

lmaname = fullfile(lmapat,lmafil);
lmachan = imread(lmaname);
lmachan = lmachan(700:2250,1750:2800);

NDVIimg = abs((double(grechan-redchan))./(double(redchan+grechan)));

figure;
imshow(NDVIimg)
figure;
imground = round(NDVIimg,1);
imshow(imground)

NDVIimg1 = NDVIimg~=0;
imshow(NDVIimg1)
percentcover = grecovcalc(NDVIimg1,lmachan);
