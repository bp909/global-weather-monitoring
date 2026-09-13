%% integsolver
% This script goes through the files and for any corrupt dates replace them with a blank file

gg = zeros([3712 3712]);
for i = 1:length(corruptdates)
    name = ['blank-SEVI-',num2str(corruptdates(i)),'-blank.jpg'];
    imwrite(gg, name)
end
