PosSpr = readmatrix('E:\OneDrive\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\PosAndSpre1.csv');

PosSpr(isnan(PosSpr))=0;

for i = 1:423
    STD = std(1:2451, PosSpr(:,i));
    STE(i) = STD./sqrt(2451);
end

plot(STE)

writematrix(STE, 'E:\OneDrive\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\PosAndSpreError.csv')

AvgSTE = mean(STE);




