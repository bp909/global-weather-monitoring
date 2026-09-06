function [respicc,respicg] = CloudSep(pic,thresh)
    respicg = pic;
    respicc = pic;
    respicg(respicg>thresh) = 0;
    
    respicc(respicc<=thresh) = 0;
    
end

