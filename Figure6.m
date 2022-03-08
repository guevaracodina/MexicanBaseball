%% Script to reproduce Figure 6
% ------------------------------------------------------------------------------
% Influence of baseball construction on the increase in offensive
% statistics in the Mexican baseball league
% Juan Carlos Torres-Galván, Orlando Guarneros García, Francisco Oviedo-Tolentino
% Jaime Meade Collins, Edgar Guevara
% ------------------------------------------------------------------------------
clear; close all; clc
% Load data from density
load('density.mat')

%% Traditional ball = Rawlings
rawlings_sections = {'Cork center' 'Rubber' 'Wool yarn'...
    'Cotton string' 'Leather cover'};

%% New ball = Franklin
franklin_sections = {'Cork center' 'Rubber' 'inner wool yarn windings'...
    'middle wool yarn windings' 'outer wool yarn windings'...
    'Cotton string windings' 'Leather cover'};

%% Organize densities in a format recognized by boxplot function
% For the new ball the 3 layers of wool yarn are averaged
meanF = nanmean(franklinDensity(:,3:5), 2);
layersDensity = { franklinDensity(:,1); rawlingsDensity(:,1);
    franklinDensity(:,2); rawlingsDensity(:,2);
    meanF; rawlingsDensity(:,3);
    franklinDensity(:,6); rawlingsDensity(:,4);
    franklinDensity(:,7); rawlingsDensity(:,5)};
% Number of samples per group
nSamples = 12;
% Five variables per group, hence 10 box plots
% Cork center, Rubber, Wool yarn, Cotton string, Leather cover
nBoxPlots = 10;
groupVec = repmat(1:nBoxPlots,[nSamples 1]);
groupVec = groupVec(:);

%% Statistical test
idxP=1;     % Index of comparison
% Preallocate memory
P = zeros([ nBoxPlots/2, 1]);
H = zeros([ nBoxPlots/2, 1]);
% Compare corresponding layers with Wilcoxon-Mann-Whitney test
for idx = 1:2:numel(layersDensity)
    [P(idxP),H(idxP)] = ranksum(layersDensity{idx}, layersDensity{idx+1});
    idxP = idxP + 1;
end

% Carry out False Discovery Rate correction
Q = ioi_fdr(P);     % Multiple comparisons correction
for idx=1:numel(Q)
    fprintf('p = %0.4g when comparing %s\n', Q(idx), rawlings_sections{idx})
end
    

%% Boxplots of inner pill & wool yarn
myRed = [181, 39, 53]/255;      % Rawlings, Traditional
myGreen = [109, 167, 75]/255;   % Franklin, New
colors = repmat({myGreen, myRed},[1 numel(unique(groupVec))/2]);

% Boxplots
h6 = figure(6); set(h6, 'color', 'w');
h = boxplot(cell2mat(layersDensity),groupVec, 'colors', [0 0 0]);
set(h, 'linewidth', 0.5)
lines = findobj(h6, 'type', 'line', 'Tag', 'Median');
set(lines, 'LineWidth', 2.5);
xCenter = 1:numel(layersDensity);
xTicks = movmean(xCenter,2); xTicks = xTicks(2:2:end);
set(gca,'XTick', xTicks);
set(gca,'XTickLabel', rawlings_sections)
hold on

% Scatter plots
for idx = 1:numel(layersDensity)
    scatter(repmat(xCenter(idx),size(layersDensity{idx})),...
        layersDensity{idx},'filled','MarkerFaceAlpha',0.8,'MarkerFaceColor',colors{idx},...
        'jitter','on','jitterAmount',0.15);
end

ylabel('\rho (g·cm^{-3})')
legend({'New' 'Traditional'})
set(gca, 'FontSize', 14)
% Specify window units
set(h6, 'units', 'inches')
% Change figure and paper size
set(h6, 'Position', [0.1 0.1 8.5 5])
set(h6, 'PaperPosition', [0.1 0.1 8.5 5])

%% Save figure 6
% Save as PNG
print(h6, '-dpng', 'Figure6', '-r300');

% EOF