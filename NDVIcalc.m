function percentcover = NDVIcalc(chan_R, chan_G, chan_L)
    NDVIimg = abs((double(chan_G-chan_R))./(double(chan_R+chan_G)));
    NDVIimg1 = NDVIimg~=0;
    percentcover = grecovcalc(NDVIimg1,chan_L);
end

