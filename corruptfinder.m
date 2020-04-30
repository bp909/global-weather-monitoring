dir_R = uigetdir('E:\Resources\GWM\all_of_it','Choose your Red root folder');
dir_G = uigetdir('E:\Resources\GWM\all_of_it','Choose your Green root folder');
dir_B = uigetdir('E:\Resources\GWM\all_of_it','Choose your Blue root folder');

[lodfil,lodpat] = uigetfile('*','Choose a list of dates');
lodname = fullfile(lodpat,lodfil);
dates = readmatrix(lodname);

l = 0;
for i = 500:645
    time = tic;
    name = ['*SEVI*',num2str(dates(i)),'*.jpg'];
    name_R = dir(fullfile(dir_R, name));
    name_G = dir(fullfile(dir_G, name));
    name_B = dir(fullfile(dir_B, name));
    
    name = ['RED',num2str(dates(i))]
    single_R = imread(fullfile(dir_R,name_R.name));
    name = ['GREEN',num2str(dates(i))]
    single_G = imread(fullfile(dir_G,name_G.name));
    name = ['BLUE',num2str(dates(i))]
    single_B = imread(fullfile(dir_B,name_B.name));
    timeel = toc(time);
    if timeel > 2
        l = l+1;
        corruptdates(l) = dates(i);
    end
end