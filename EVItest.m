[redfil,redpat] = uigetfile('*','Choose a Redclearpic');
[grefil,grepat] = uigetfile('*','Choose a Greclearpic');
[blufil,blupat] = uigetfile('*','Choose a Bluclearpic');
[lmafil,lmapat] = uigetfile('*','Choose a landmask');


redname = fullfile(redpat,redfil);
redchan = imread(redname);

grename = fullfile(grepat,grefil);
grechan = imread(grename);

bluname = fullfile(blupat,blufil);
bluchan = imread(bluname);

lmaname = fullfile(lmapat,lmafil);
lmachan = imread(lmaname);

redchan = double(redchan);
grechan = double(grechan);
bluchan = double(bluchan);

EVIimg = 2.5.*abs((redchan-grechan)./(redchan+6.*grechan-7.5*bluchan+1));

figure;
imshow(EVIimg)
figure;
imground = round(EVIimg,1);
imshow(imground)

NDVIimg1 = EVIimg~=0;
imshow(NDVIimg1)
percentcover = grecovcalc(NDVIimg1,lmachan);
