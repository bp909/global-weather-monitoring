
[lmafil,lmapat] = uigetfile('*','Choose a landmask');
lim_UP = 600;
lim_LO = 3050;
lim_RI = 3400;
lim_LE = 1230;
lmaname = fullfile(lmapat,lmafil);
chan_L = imread(lmaname);
chan_L = chan_L(lim_UP:lim_LO,lim_LE:lim_RI);

for i = 1:30
    chan_LA(:,:,i) = chan_L;
end

for i = 1:14
    
    
    load(['E:\OneDrive\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\img',num2str(i),'.mat'])
    if i<10
        hh = ['week0',num2str(i)];
    else
        hh = ['week',num2str(i)];
    end
    CFIR = eval(['colcfi_R',hh]);
    CFIG = eval(['colcfi_G',hh]);
    STER = eval(['colste_R',hh]);
    STEG = eval(['colste_R',hh]);
    
    
    bigNumbersR = zeros(size(CFIR));
    bigNumbersLocations = chan_LA == 0;
    bigNumbersR(bigNumbersLocations) = CFIR(bigNumbersLocations);
    bigNumbersR(bigNumbersR == 0) = NaN;
    
    bigNumbersG = zeros(size(CFIG));
    bigNumbersG(bigNumbersLocations) = CFIG(bigNumbersLocations);
    bigNumbersG(bigNumbersG == 0) = NaN;
    
    bigNumbersRE = zeros(size(STER));
    bigNumbersRE(bigNumbersLocations) = STER(bigNumbersLocations);
    bigNumbersRE(bigNumbersRE == 0) = NaN;
    
    bigNumbersGE = zeros(size(STEG));
    bigNumbersGE(bigNumbersLocations) = STEG(bigNumbersLocations);
    bigNumbersGE(bigNumbersGE == 0) = NaN;
    
    
    
    
    
    
    
    meanoR((30*(i-1)+1):30*(i)) = mean(bigNumbersR,[1 2], 'omitnan');
    meanoG((30*(i-1)+1):30*(i)) = mean(bigNumbersG,[1 2], 'omitnan');
    meanoRE((30*(i-1)+1):30*(i)) = mean(bigNumbersRE,[1 2], 'omitnan');
    meanoGE((30*(i-1)+1):30*(i)) = mean(bigNumbersGE,[1 2], 'omitnan');
    
    vars = {['colcfi_R',hh],['colcfi_G',hh],['colste_R',hh],['colste_G',hh],['colcfi_B',hh],['colste_B',hh],['NDVIimgs', hh]};
    clear(vars{:})
    
end
plot(meanoRE)