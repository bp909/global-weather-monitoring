z = zeros(499,499);
for n = 1:996
    z = z.^2 + linspace(-2,0.5,499) + 1i*linspace(-1.25,1.25,499)';
end
surf(-2:2.5/498:0.5, -1.25:2.5/498:1.25, abs(z), 'edgecolor', 'none')
