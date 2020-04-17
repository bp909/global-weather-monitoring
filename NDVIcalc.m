function [percentcover, NDVIimg] = NDVIcalc(chan_R, chan_G, chan_L)
    NDVIimg = (double(chan_R)-double(chan_G))./(double(chan_R)+double(chan_G));
    %imshow(NDVIimg)
    NDVIimg1 = NDVIimg < 0;
    imshow(NDVIimg1)
    percentcover = grecovcalc(NDVIimg1,chan_L);
    
end