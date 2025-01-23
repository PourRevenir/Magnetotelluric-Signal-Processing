function PlotPhase(f,phxy,phyx,file)
%PlotPhase 
%   PlotPhase(f,phxy,phyx,file)
%

    % figure('Name','Phase curve','Position',[244.2,235.4,719.2,420])
    semilogx(f,phxy,'-o','LineWidth',1.3)
    hold on
    semilogx(f,phyx,'-o','LineWidth',1.3)
    grid on
    ax = gca;
    ax.XLabel.String = 'Frequency (Hz)';
    ax.XLabel.FontName = 'Times New Roman';
    ax.XLabel.FontSize = 14;
    ax.YLabel.String = 'Phase (\circ)';
    ax.YLabel.FontName = 'Times New Roman';
    ax.YLabel.FontSize = 14;
    ax.XLim = [0.001,330];
    ax.Title.String = ['Phase curve of Dunhuang ',file,', 1995'];
    ax.Title.FontName = 'Times New Roman';
    ax.Title.FontSize = 15;
    legend('\phi_{xy}','\phi_{yx}');
    
end