% This script loads the colormaps from the matlab and saves them as txt files.
%
% coding: utf-8
% created on Thu Dec 10 19:29 2024
% programme written by Yaokun Yang
%
% !Run the script by executing Cmap.py first
% -----------------------------------------------

clearvars

cmarray = {'viridis', 'plasma', 'inferno', 'magma', 'cividis','Greys', 'Purples', 'Blues', 'Greens', 'Oranges', 'Reds','YlOrBr', 'YlOrRd', 'OrRd', 'PuRd', 'RdPu', 'BuPu','GnBu', 'PuBu', 'YlGnBu', 'PuBuGn', 'BuGn', 'YlGn','binary', 'gist_yarg', 'gist_gray', 'gray', 'bone','pink', 'spring', 'summer', 'autumn', 'winter', 'cool','Wistia', 'hot', 'afmhot', 'gist_heat', 'copper','PiYG', 'PRGn', 'BrBG', 'PuOr', 'RdGy', 'RdBu', 'RdYlBu','RdYlGn', 'Spectral', 'coolwarm', 'bwr', 'seismic','twilight', 'twilight_shifted', 'hsv','flag', 'prism', 'ocean', 'gist_earth', 'terrain','gist_stern', 'gnuplot', 'gnuplot2', 'CMRmap','cubehelix', 'brg', 'gist_rainbow', 'rainbow', 'jet','turbo', 'nipy_spectral', 'gist_ncar'};

% load the colormap and save it as a txt file
for i = 1:length(cmarray)
    cm = load([cmarray{i},'.txt']);
    cm = cm(:,1:3);
    save([cmarray{i} '.txt'],'cm','-ascii')
end