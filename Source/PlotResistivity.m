function PlotResistivity(f,rxy,ryx,file)
%PlotResistivity 
%   PlotResistivity(f,rxy,ryx,file)
%

    % figure('Name','Apparent resistivity curve','Position',[244.2,235.4,719.2,420])
    loglog(f,rxy,'LineWidth',1.3)
    hold on
    loglog(f,ryx,'LineWidth',1.3)
    grid on
    ax = gca;
    ax.XLabel.String = 'Frequency (Hz)';
    ax.XLabel.FontName = 'Times New Roman';
    ax.XLabel.FontSize = 14;
    ax.YLabel.String = 'Apparent resistivity (\Omega\cdot m)';
    ax.YLabel.FontName = 'Times New Roman';
    ax.YLabel.FontSize = 14;
    ax.XLim = [0.001,330];
    ax.Title.String = ['Apparent resistivity curve of Dunhuang ',file,', 1995'];
    ax.Title.FontName = 'Times New Roman';
    ax.Title.FontSize = 15;
    legend('\rho_{xy}','\rho_{yx}');
    
end