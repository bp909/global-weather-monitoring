%pixel getter
[redfil,redpat] = uigetfile('*','Choose a clearpic');
redname = fullfile(redpat,redfil);
redchan = imread(redname);
[lmafil,lmapat] = uigetfile('*','Choose a landmask');
lmaname = fullfile(lmapat,lmafil);
lmachan = imread(lmaname);
imshow(redchan)
figure;
redchancut = redchan(750:1100,2600:3000,:);
imshow(redchancut)
