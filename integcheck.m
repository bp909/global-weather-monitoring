%%integrity check
% checks if there's any days where the files don't exist
dir_R = uigetdir('E:\','Choose your Red root folder');
Rdir = dir(dir_R);
[lodfil,lodpat] = uigetfile('*','Choose a list of dates');
lodname = fullfile(lodpat,lodfil);
dates = readmatrix(lodname);
gg = zeros([1 length(dates)]);
for i = 1:length(dates)
    name = ['*SEVI*',num2str(dates(i)),'*.jpg'];
    name_R = dir(fullfile(dir_R, name));
    gg(i) = isfile(fullfile(dir_R,name_R.name));
end
hh = find(gg == 0);

dates8 = dates(hh);
