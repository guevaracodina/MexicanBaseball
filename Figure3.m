%% Script to reproduce Figure 3
% ------------------------------------------------------------------------------
% Influence of baseball construction on the increase in offensive
% statistics in the Mexican baseball league
% Juan Carlos Torres-Galván, Orlando Guarneros García, Francisco Oviedo-Tolentino
% Jaime Meade Collins, Edgar Guevara
% ------------------------------------------------------------------------------
clear; close all; clc
% Load physical characteristics of the baseballs
load('physical_characteristics.mat')

%% Center and scale data (0 mean, unit variance)
X = [CORdata density volumeBalls homogeneity mass roughness seams_height seams_width];
X = zscore(X);

%% Perform Principal Component analysis (PCA)
[COEFF, SCORE, LATENT, TSQUARED, EXPLAINED] = pca(X, 'centered', true);
% Scores of the first 3 PCs
PC1 = SCORE(:,1);
PC2 = SCORE(:,2);
PC3 = SCORE(:,3);

%% Plot first 3 PC scores
% Green:    Franklin(New)           -> RGB = [109, 167, 75]
% Red:      Rawlings(Traditional)   -> RGB = [181, 39, 53]
groupColors = [repmat([109, 167, 75]/255, 12, 1); repmat([181, 39, 53]/255, 12, 1)];
h3 = figure(3); 
% New ball = Franklin
scatter3(PC1(1:12),PC2(1:12),PC3(1:12), 36, 'MarkerFaceColor', [109, 167, 75]/255,...
    'MarkerEdgeColor', [109, 167, 75]/255);
hold on
% Traditional ball = Rawlings
scatter3(PC1(13:24),PC2(13:24),PC3(13:24), 36, 'MarkerFaceColor', [181, 39, 53]/255,...
    'MarkerEdgeColor', [181, 39, 53]/255);
xlabel(sprintf('PC1 (%0.1f%%)', EXPLAINED(1)))
ylabel(sprintf('PC2 (%0.1f%%)', EXPLAINED(2)))
zlabel(sprintf('PC3 (%0.1f%%)', EXPLAINED(3)))
view([-8 30])       % legend({'New' 'Traditional'})
title('Baseball')
set(gca, 'FontSize', 14)
set(h3, 'color', 'w', 'Name', 'Principal Component Analysis (PCA)')

%% Save figure 3
% Specify window units
set(h3, 'units', 'inches')
% Change figure and paper size
set(h3, 'Position', [0.1 0.1 6 4])
set(h3, 'PaperPosition', [0.1 0.1 6 4])
% Save as PNG
print(h3, '-dpng', 'Figure3', '-r300');
% EOF
