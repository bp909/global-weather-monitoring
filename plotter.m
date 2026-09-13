% Plotting vegetation coverage and cloud coverage (calculated by partner).

x04 = 347/14;
x05 = x04 + 365/14;
x06 = x05 + 365/14;
x07 = x06 + 365/14;
x08 = x07 + 366/14;
x09 = x08 + 365/14;
x10 = x09 + 365/14;
x11 = x10 + 365/14;
x12 = x11 + 366/14;
x13 = x12 + 365/14;
x14 = x13 + 365/14;
x15 = x14 + 365/14;
x16 = x15 + 366/14;
x17 = x16 + 365/14;
x18 = x17 + 365/14;
x19 = x18 + 365/14;
figure;
xline(x04,'k-.');
hold on;
xline(x05,'k-.');
xline(x06,'k-.');
xline(x07,'k-.');
xline(x08,'k-.');
xline(x09,'k-.');
xline(x10,'k-.');
xline(x11,'k-.');
xline(x12,'k-.');
xline(x13,'k-.');
xline(x14,'k-.');
xline(x15,'k-.');
xline(x16,'k-.');
xline(x17,'k-.');
xline(x18,'k-.');
xline(x19,'k-.');
%plot(covtot, 'k-');
plot(movmean(covtot, 5), 'k-');
export_fig AllCov.eps 
fig1 = gcf;
%plot2svg('AllCov.svg',fig1,'png')
figure;
yyaxis left
plot((0:26)*14,movmean(covtot(ceil(x17):(floor(x18))), 3), 'k-');
xlabel('Time (Weeks)')
ylabel('Cloud Coverage (\%)')
hold on;
yyaxis right
plot(movmean(MeanData,9), 'k--')
ylabel('Vegetation Coverage (\%)')
set(gca,'FontName','CMU Sans Serif','Fontsize',20,'XColor','k','YColor','k')
% Cover up existing axis with a white line.
% line([xlim, xlim], ylim, 'color', 'w', 'LineWidth',3);
% Draw a dashed line on top of the white line.
% line([xlim, xlim], ylim, 'color', 'k', 'LineStyle', '--');
hold off;
export_fig RainVegCov.eps
fig2 = gcf;
plot2svg('RainVegCov.svg',fig2,'png')
