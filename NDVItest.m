[redfil,redpat] = uigetfile('*','Choose a Redclearpic');
[grefil,grepat] = uigetfile('*','Choose a Greclearpic');
[blufil,blupat] = uigetfile('*','Choose a Bluclearpic');
redname = fullfile(redpat,redfil);
redchan = imread(redname);
bluname = fullfile(blupat,blufil);
bluchan = imread(bluname);
grename = fullfile(grepat,grefil);
grechan = imread(grename);

NDVIimg