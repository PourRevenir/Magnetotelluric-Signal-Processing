clearvars

file = '40-13';
filename = [file,'.AVG'];

% read data file

[f,Data] = ReadAvgData(filename);

% calculate
[rxy,ryx,phxy,phyx,Azx,Bzy,CPxy,CPyx] = Magnetotelluric(f,Data);

% plot
PlotCoherence(f,CPxy,CPyx,file)
% PlotPhase(f,phxy(1,:),phyx(1,:),file)