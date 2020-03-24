[redfil,redpat] = uigetfile('*','Choose a Redclearpic');
[grefil,grepat] = uigetfile('*','Choose a Greclearpic');

redname = fullfile(redpat,redfil);
redchan = imread(redname);

grename = fullfile(grepat,grefil);
grechan = imread(grename);

NDVIimg = abs((double(grechan-redchan))./(double(redchan+grechan)));

figure;
imshow(NDimg)
figure;
imshow(VIimg)
figure;
imshow(NDVIimg)
figure;
imground = round(NDVIimg,1);
imshow(imground)
NDVIimg1(NDVIimg~=0) = 1;
NDVIimg1 = NDVIimg~=0;
imshow(NDVIimg1)
