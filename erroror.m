mean15gr = reshape(mean15g,[1,3]);
mean15ger = reshape(mean15ge,[1,3]);
mean15rr = reshape(mean15r,[1,3]);
mean15rer = reshape(mean15re,[1,3]);

G = cat(2, meanoG, mean15gr);
GER = cat(2, meanoGE, mean15ger);
R = cat(2, meanoR, mean15rr);
RER = cat(2, meanoRE, mean15rer);

PropmayErrorVeg = 2.*sqrt(((G.^2).*(GER.^2)+(R.^2).*(RER.^2))./(G+R).^4);

plot(PropmayErrorVeg)
hold on;
NDVI = (R-G)./(G+R);

PropErrorVeg = abs(PropmayErrorVeg./NDVI);



writematrix(PropmayErrorVeg, 'ProErrVegCov.csv')
writematrix(PropErrorVeg, 'NotProErrVegCov.csv')

movmeanpro5 = movmean(PropmayErrorVeg,5, 'omitnan');
plot(movmeanpro5)
writematrix(movmeanpro5, 'ProErrVegCovMean.csv')