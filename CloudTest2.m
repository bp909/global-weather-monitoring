clc
clear variables

imSize=10;
ground=50*ones(imSize);
newGround=NaN(imSize);
N=5;
for count=1:N
    %% Generate Random clouds 
    clouds=(rand(imSize));
    for i=1:imSize %Turn clouds into integer 1's and 0's
        for j=1:imSize
            if clouds(i,j)>=0.5
                clouds(i,j)=1;
            else
                clouds(i,j)=0;
            end
        end
    end
    clouds=100*clouds;
    realIm=ground+clouds;
    %% Resolving 'ground'
    threshold=100;
    newIm=zeros(imSize);

    for i=1:imSize
        for j=1:imSize
            if realIm(i,j)>=threshold
                newIm(i,j)=NaN;
            else
                newIm(i,j)=realIm(i,j);
            end
        end
    end
    %% Overwriting newGround
    for i=1:imSize
        for j=1:imSize
            if ~isnan(newIm(i,j))
                newGround(i,j)=newIm(i,j);
            end
        end
    end
    newIm
end
newGround