% Generates images for the report
RGBday = RGBcreator(colcfi_Rweek09(:,:,3),colcfi_Gweek09(:,:,3),colcfi_Bweek09(:,:,3));
gg = -NDVIimgsweek09(:,:,3);
ggn = gg>0;

for i = 1:3
   RGBmasggn(:,:,i) = ggn;  
end

RGBMask = zeros(size(RGBday));
bigNumbersLocations = RGBmasggn == 1;
RGBMask(bigNumbersLocations) = RGBday(bigNumbersLocations);
RGBMask(RGBMask == 0) = NaN;

figure;
imshow(gg)
imwrite(gg, 'NDVINat.png')
figure;
imshow(RGBday)
imwrite(RGBday, 'RGBComp.png')
figure;
imshow(ggn)
imwrite(ggn, 'NDVIBin.png')
figure;
imshow(RGBMask/255)
imwrite(RGBMask/255, 'RGBMask.png')
