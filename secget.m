%pixel getter
[redfil,redpat] = uigetfile('*','Choose a clearpic');
redname = fullfile(redpat,redfil);
redchan = imread(redname);
imshow(redchan)
figure;
redchancut = redchan(600:3050,1230:3400,:);
imshow(redchancut)
