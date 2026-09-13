function landcoverage = grecovcalc(NDVIimg,landmask)
%landcoverage = grecovcalc(NDVIimg,landmask)
    % Function calculating average NDVI in landmasked area
    NDVIimg = double(NDVIimg);
    NDVIimg(landmask~=0) = NaN;
    landcoverage = sum(NDVIimg,'all','omitnan')./sum(~landmask,'all');
end

