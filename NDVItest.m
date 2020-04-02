[redfil,redpat] = uigetfile('*','Choose a Redclearpic');
[grefil,grepat] = uigetfile('*','Choose a Greclearpic');
[lmafil,lmapat] = uigetfile('*','Choose a landmask');


redname = fullfile(redpat,redfil);
redchan = imread(redname);

grename = fullfile(grepat,grefil);
grechan = imread(grename);

lmaname = fullfile(lmapat,lmafil);
lmachan = imread(lmaname);

NDVIimg = abs((double(grechan-redchan))./(double(redchan+grechan)));

figure;
imshow(NDVIimg)
figure;
imground = round(NDVIimg,1);
imshow(imground)

NDVIimg1 = NDVIimg~=0;
imshow(NDVIimg1)
percentcover = grecovcalc(NDVIimg1,lmachan);
