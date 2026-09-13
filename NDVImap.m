% Script that concatenates and squashes NDVI images so that they can be tracked north-south in timeseries
lim_UP = 600;
lim_LO = 3050;
lim_RI = 3400;
lim_LE = 1230;

[lmafil,lmapat] = uigetfile('*','Choose a landmask');
lmaname = fullfile(lmapat,lmafil);
chan_L = imread(lmaname);
chan_L = chan_L(lim_UP:lim_LO,lim_LE:lim_RI);


sum11 = sum((chan_L == 0 & NDVIimgs1 < 0),2)./sum(chan_L == 0, 2);
sum22 = sum((chan_L == 0 & NDVIimgs2 < 0),2)./sum(chan_L == 0, 2);
ghj = reshape(sum11, [2451 210]);
klz = reshape(sum22, [2451 213]);
kfc = cat(2, ghj, klz);
imagesc(kfc./(max(kfc,[],1)))
hold on
colormap gray

[M,I] = max(kfc(500:2000,:),[],1);
plot(I+500)
maxpos = I+500
