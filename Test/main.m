clearvars

file = '40-13';
filename = [file,'.AVG'];

% read .AVG data file
[f,Data] = ReadAvgData(filename);

% calculate
[rxy,ryx,phxy,phyx,Azx,Bzy,CPxy,CPyx] = Magnetotelluric(f,Data);

% plot
PlotResistivity(f,rxy(1,:),ryx(1,:),file)