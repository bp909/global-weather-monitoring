function RGBImage = RGBcreator(RChan,GChan,BChan)
    % function creates an RGB image
    RGBImage = cat(3, RChan, GChan, BChan);
end
