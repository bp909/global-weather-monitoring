%pixel getter
[redfil,redpat] = uigetfile('*','Choose a clearpic');
redname = fullfile(redpat,redfil);
redchan = imread(redname);
[lmafil,lmapat] = uigetfile('*','Choose a landmask');
lmaname = fullfile(lmapat,lmafil);
lmachan = imread(lmaname);
imshow(redchan)
figure;
redchancut = redchan(700:2250,1750:2800);
imshow(redchancut)
