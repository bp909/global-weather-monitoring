function [mode_R, mode_G, mode_B, std_R, std_G, std_B] = CFImaker(chan_R,chan_G,chan_B)
    chan_R(chan_R == 0) = NaN;
    chan_G(chan_G == 0) = NaN;
    chan_B(chan_B == 0) = NaN;
    
    mode_R = mode(chan_R,3);
    mode_G = mode(chan_G,3);
    mode_B = mode(chan_B,3);
    std_R = std(chan_R, 0,3);
    std_G = std(chan_G, 0,3);
    std_B = std(chan_B, 0,3);
    
end

