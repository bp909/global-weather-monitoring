%% integsolver

gg = zeros([3712 3712]);
for i = 1:length(corruptdates)
    name = ['blank-SEVI-',num2str(corruptdates(i)),'-blank.jpg'];
    imwrite(gg, name)
end