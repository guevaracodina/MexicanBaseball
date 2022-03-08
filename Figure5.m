%% Script to reproduce Figure 5
% ------------------------------------------------------------------------------
% Influence of baseball construction on the increase in offensive
% statistics in the Mexican baseball league
% Juan Carlos Torres-Galván, Orlando Guarneros García, Francisco Oviedo-Tolentino
% Jaime Meade Collins, Edgar Guevara
% ------------------------------------------------------------------------------
clear; close all; clc
% Load layers density data
load('density.mat')

%% Traditional ball = Rawlings
rawlings_sections = {'Cork center' 'Rubber' 'Wool yarn'...
    'Cotton string' 'Leather cover'};

%% New ball = Franklin
franklin_sections = {'Cork center' 'Rubber' 'inner wool yarn windings'...
    'middle wool yarn windings' 'outer wool yarn windings'...
    'Cotton string windings' 'Leather cover'};
% Maximum density value
maxVal = max([nanmean(rawlingsDensity) nanmean(franklinDensity)]);% 1.9634

%% Traditional ball internal layers
% Create the image.
scaleFactor = 10;
% Image size = 100 mm
imageSizeX = scaleFactor*100;
imageSizeY = imageSizeX;
[columnsInImage, rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
centerX = imageSizeX/2;  centerY = imageSizeY/2;
myCanvas = zeros([imageSizeY, imageSizeX]);
% Next create the concentric circles in the image.
radius = scaleFactor*[0 10.6357 16.7543 32.6694 35.1894 36.3894];
circleFillValue = nanmean(rawlingsDensity);
% Create concentric circles
for idx=1:numel(radius)-1
    circlePixels = (rowsInImage - centerY).^2 ...
        + (columnsInImage - centerX).^2 <= radius(idx+1).^2 & ...
        (rowsInImage - centerY).^2 ...
        + (columnsInImage - centerX).^2 > radius(idx).^2;
    myCanvas(circlePixels) = circleFillValue(idx);
end
h5c = figure; set(h5c, 'color', 'w', 'Name', 'Fig. 5c) Traditional ball layers');
imagesc(myCanvas, [0 maxVal]);
axis image; set(gca,'YDir','normal')
axis off
% a = colorbar('southoutside');
a = colorbar;
a.Label.String = '\rho (g·cm^{-3})';
colormap(flipud(gray));
title('Traditional');
set(gca,'FontSize',14)
% Specify window units
set(h5c, 'units', 'inches')
% Change figure and paper size
set(h5c, 'Position', [0.1 0.1 8 6])
set(h5c, 'PaperPosition', [0.1 0.1 8 6])

%% New ball internal layers
myCanvas = zeros([imageSizeY, imageSizeX]);
% Next create the concentric circles in the image.
radius = scaleFactor*[0 10.3930 16.7490 26.3490 30.7610 35.5000 36.0060 37.2060];
circleFillValue = nanmean(franklinDensity);
% Create concentric circles
for idx=1:numel(radius)-1
    circlePixels = (rowsInImage - centerY).^2 ...
        + (columnsInImage - centerX).^2 <= radius(idx+1).^2 & ...
        (rowsInImage - centerY).^2 ...
        + (columnsInImage - centerX).^2 > radius(idx).^2;
    myCanvas(circlePixels) = circleFillValue(idx);
end
% 10mm Scale bar
myCanvas(10*scaleFactor:12*scaleFactor, (imageSizeY-10*scaleFactor):imageSizeY) = maxVal;
h5d = figure; set(h5d, 'color', 'w', 'Name', 'Fig. 5d) New ball layers');
imagesc(myCanvas, [0 maxVal]);
axis image; set(gca,'YDir','normal')
axis off
a = colorbar; a.Label.String = '\rho (g·cm^{-3})';
colormap(flipud(gray));
title('New');
set(gca,'FontSize',14)
% Specify window units
set(h5d, 'units', 'inches')
% Change figure and paper size
set(h5d, 'Position', [0.1 0.1 8 6])
set(h5d, 'PaperPosition', [0.1 0.1 8 6])

%% Save figures 5 c) & 5 d)
% Save as PNG
print(h5c, '-dpng', 'Figure5c', '-r300');
% Save as PNG
print(h5d, '-dpng', 'Figure5d', '-r300');

% EOF