% Calculates moving means, plots it and saves it

CloudCov3 = movmean(CloudCov2019, 3);
CloudCov7 = movmean(CloudCov2019, 7);
plot(CloudCov3)
hold on
plot(CloudCov7)
VegCov3 = movmean(VegCov0420, 3);
VegCov5 = movmean(VegCov0420, 5);
figure;
plot(VegCov3)
hold on
plot(VegCov5)

writematrix(VegCov3, 'VegCov3.csv')
writematrix(VegCov5, 'VegCov5.csv')
writematrix(CloudCov7, 'CloudCov7.csv')

