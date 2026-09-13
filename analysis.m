% this script produces a graph tracking the average vegetation coverage on the continent
percentcovtrack = zeros(1, modecount);
NDVIimgs = zeros([imagesiz_Y imagesiz_X modecount]);

for m = 1:modecount
    [percentcovtrack(m), NDVIimgs(:,:,m)] = NDVIcalc(colcfi_R(:,:,m),colcfi_G(:,:,m),chan_L);
end


figure;
plot(percentcovtrack)
hold on;
ff = movmean(percentcovtrack,3);
plot(ff)
