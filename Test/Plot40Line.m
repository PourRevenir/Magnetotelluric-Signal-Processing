clearvars

[fv,~] = ReadAvgData('40-11.AVG');
Rxy = zeros(1,520);
Ryx = zeros(1,520);
d = zeros(1,520);
hxy = zeros(1,520);
hyx = zeros(1,520);

for k = 1:13

    file = ['40-',num2str(k+10)];
    filename = [file,'.AVG'];

    % read data file

    [f,Data] = ReadAvgData(filename);

    % calculate
    [rxy,ryx,phxy,phyx,Azx,Bzy,CPxy,CPyx] = Magnetotelluric(f,Data);

    rxy = (rxy(1,:)+rxy(2,:)+rxy(3,:)+rxy(4,:))./4;
    ryx = (ryx(1,:)+ryx(2,:)+ryx(3,:)+ryx(4,:))./4;

    % % plot
    % subplot(1,13,k-10)
    % loglog(rxy,f,'LineWidth',1.3)
    % hold on
    % loglog(ryx,f,'LineWidth',1.3)
    % grid on
    % 
    % set(gca,'YDir','reverse')

    phxy = (phxy(1,:)+phxy(2,:)+phxy(3,:)+phxy(4,:))./4;
    phyx = (phyx(1,:)+phyx(2,:)+phyx(3,:)+phyx(4,:))./4; 

    rxy = interp1(f,rxy,fv);
    ryx = interp1(f,ryx,fv);
    phxy = interp1(f,phxy,fv);
    phyx = interp1(f,phyx,fv);
    
    d((k-1)*40+1:k*40) = k;
    hxy((k-1)*40+1:k*40) = sqrt(rxy./(2.*pi.*fv.*4e-7.*pi));
    hyx((k-1)*40+1:k*40) = sqrt(ryx./(2.*pi.*fv.*4e-7.*pi));
    Rxy((k-1)*40+1:k*40) = rxy.*(180./(2.*phxy)-1);
    Ryx((k-1)*40+1:k*40) = ryx.*(180./(2.*phyx)-1);
end

%% 

figure('Position',[361,72.2,676.8,684.8]);
hq = logspace(-1,5,45);
dq = 1:0.5:13;
[dq,hq] = meshgrid(dq,hq);
Rxyq = griddata(d,hxy,Rxy,dq,hq,'v4');
Ryxq = griddata(d,hyx,Ryx,dq,hq,'v4');
Rxyq(41:45,:) = [];
Ryxq(41:45,:) = [];

Rxyq = log(abs(Rxyq));
Ryxq = log(abs(Ryxq));

[dq,hq] = meshgrid((1:1.5:37),logspace(-1,5,40));
cmap = load('Color\viridis.txt');
contourf(dq,hq,Ryxq)
ax = gca;
ax.YScale = 'log';
ax.YLabel.String = 'Deepth (m)';
ax.YLabel.FontName = 'Times New Roman';
ax.YLabel.FontSize = 14;
ax.YDir = 'reverse';
ax.XLabel.String = 'Distance (km)';
ax.XLabel.FontName = 'Times New Roman';
ax.XLabel.FontSize = 14;
ax.Title.String = 'Bostick inversion of 1D magnetotelluric \rho_{yx}';
ax.Title.FontName = 'Times New Roman';
ax.Title.FontSize = 15;
colormap(cmap)
colorbar

