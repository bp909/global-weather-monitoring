function landcoverage = grecovcalc(NDVIimg,landmask)
%landcoverage = grecovcalc(NDVIimg,landmask)
    NDVIimg = double(NDVIimg);
    NDVIimg(landmask~=0) = NaN;
    landcoverage = sum(NDVIimg,'all','omitnan')./sum(~landmask,'all');
end

