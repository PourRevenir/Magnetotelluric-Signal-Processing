clearvars

Rxy = zeros(1,509);
Ryx = zeros(1,509);
d = zeros(1,509);
hxy = zeros(1,509);
hyx = zeros(1,509);

n = 0;
l = 4;
for k = 1:13

    file = ['40-',num2str(k+10)];
    filename = [file,'.AVG'];

    % read data file

    [f,Data] = ReadAvgData(filename);

    % calculate
    [rxy,ryx,phxy,phyx,Azx,Bzy,CPxy,CPyx] = Magnetotelluric(f,Data);

    rxy = (rxy(1,:)+rxy(2,:)+rxy(3,:)+rxy(4,:))./4;
    ryx = (ryx(1,:)+ryx(2,:)+ryx(3,:)+ryx(4,:))./4;
    phxy = (phxy(1,:)+phxy(2,:)+phxy(3,:)+phxy(4,:))./4;
    phyx = (phyx(1,:)+phyx(2,:)+phyx(3,:)+phyx(4,:))./4; 
    % rxy = rxy(l,:);
    % ryx = ryx(l,:);
    % phxy = phxy(l,:);
    % phyx = phyx(l,:);
    
    n1 = n+1;
    nn = n+length(f);
    
    d(n1:nn) = k+10;
    hxy(n1:nn) = sqrt(rxy./(2.*pi.*f.*4e-7.*pi));
    hyx(n1:nn) = sqrt(ryx./(2.*pi.*f.*4e-7.*pi));
    Rxy(n1:nn) = rxy.*(180./(2.*phxy)-1);
    Ryx(n1:nn) = ryx.*(180./(2.*phyx)-1);

    n = nn;
end

%% 

figure('Position',[361,72.2,676.8,684.8]);
hq = logspace(0,5,45);
dq = 11:23;
[dq,hq] = meshgrid(dq,hq);
Rxyq = griddata(d,hxy,Rxy,dq,hq,'v4');
Ryxq = griddata(d,hyx,Ryx,dq,hq,'v4');
Rxyq(41:45,:) = [];
Ryxq(41:45,:) = [];
% 
Rxyq = log10(abs(Rxyq));
Ryxq = log10(abs(Ryxq));

cmap = load('Color\viridis.txt');
[dq,hq] = meshgrid(11:23,logspace(0,5,40));
contourf(dq,hq,Ryxq)
ax = gca;
ax.YScale = 'log';
ax.YLabel.String = 'Deepth (m)';
ax.FontName = 'Times New Roman';
ax.FontSize = 14;
ax.YDir = 'reverse';
ax.XLabel.String = 'Observation point';
ax.XLim = [11,23]
ax.Title.String = 'Bostick inversion of 1D magnetotelluric \rho_{xy}';

colormap(cmap)
colorbar

