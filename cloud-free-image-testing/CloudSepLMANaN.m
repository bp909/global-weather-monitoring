function [respicg] = CloudSepLMANaN(pic,lma,threshl,threshs)
    respicg = pic;
    respicg( respicg>threshs & lma>0.5 ) = NaN;
    respicg( respicg>threshl & lma<0.5 ) = NaN;
    
    
end

