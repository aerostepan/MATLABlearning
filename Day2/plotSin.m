function plotSin(f1,f2)
if nargin == 1

    numPeriods = f1;
    samplesPerPeriod = 16;
    N = samplesPerPeriod*numPeriods;
    x = linspace(0,2*pi, N);
    plot(sin(f1*x),'r:','LineWidth',2,'Marker','square','MarkerFaceColor','g')

else
    numPeriods = f1;
    samplesPerPeriod = 16;
    N = samplesPerPeriod*numPeriods;
    x = linspace(0,2*pi, N);
    numPeriods2 = f2;
    samplesPerPeriod2 = 16;
    N2 = samplesPerPeriod2*numPeriods2;
    y = linspace(0,2*pi, N2);
    [X,Y] = meshgrid(x,y);
    z = sin(f1*X) + sin(f2*Y);
    mat = reshape(1:10000,100,100);
    imagesc(mat);
    subplot(2,1,2)
    surf(X,Y,z)
    colormap('hot')
    colorbar
    axis xy
    subplot(2,1,1)
    contour(X,Y,z)
    colormap('hot')
    colorbar
    axis xy
end



