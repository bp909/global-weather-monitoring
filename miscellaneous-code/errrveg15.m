for i = 1:3
    chan_LA(:,:,i) = chan_L;
end


bigNumbersR = zeros(size(colcfi_Rweek15));
bigNumbersLocations = chan_LA == 0;
bigNumbersR(bigNumbersLocations) = colcfi_Rweek15(bigNumbersLocations);
bigNumbersR(bigNumbersR == 0) = NaN;

bigNumbersG = zeros(size(colcfi_Gweek15));
bigNumbersG(bigNumbersLocations) = colcfi_Gweek15(bigNumbersLocations);
bigNumbersG(bigNumbersG == 0) = NaN;

bigNumbersRE = zeros(size(colste_Rweek15));
bigNumbersRE(bigNumbersLocations) = colste_Rweek15(bigNumbersLocations);
bigNumbersRE(bigNumbersRE == 0) = NaN;

bigNumbersGE = zeros(size(colste_Gweek15));
bigNumbersGE(bigNumbersLocations) = colste_Gweek15(bigNumbersLocations);
bigNumbersGE(bigNumbersGE == 0) = NaN;




mean15r = mean(bigNumbersR,[1 2], 'omitnan');
mean15g = mean(bigNumbersG,[1 2], 'omitnan');
mean15re = mean(bigNumbersRE,[1 2], 'omitnan');
mean15ge = mean(bigNumbersGE,[1 2], 'omitnan');
