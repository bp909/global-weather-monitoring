function [respicc,respicg] = CloudSepLMA(pic,lma,threshl,threshs)
    respicg = pic;
    respicc = pic;
    respicg(respicg>threshl & lma<0.5) = 0;
    respicg(respicg>threshs & lma>0.5) = 0;
    
    respicc(respicc<=threshl & lma<0.5) = 0;
    respicc(respicc<=threshs & lma>0.5) = 0;
    
end

