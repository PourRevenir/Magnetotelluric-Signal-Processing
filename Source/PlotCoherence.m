function PlotCoherence(f,CPxy,CPyx,file)
    %PlotCoherence 
    %   PlotCoherence(f,CPxy,CPyx,file)
    %

    % figure('Name','Coherence curve','Position',[244.2,235.4,719.2,420])
    semilogx(f,CPxy,'LineWidth',1.3)
    hold on
    semilogx(f,CPyx,'LineWidth',1.3)
    grid on
    ax = gca;
    ax.XLabel.String = 'Frequency (Hz)';
    ax.XLabel.FontName = 'Times New Roman';
    ax.XLabel.FontSize = 14;
    ax.YLabel.String = 'Coherence';
    ax.YLabel.FontName = 'Times New Roman';
    ax.YLabel.FontSize = 14;
    ax.XLim = [0.001,330];
    ax.Title.String = ['Coherence curve of Dunhuang ',file,', 1995'];
    ax.Title.FontName = 'Times New Roman';
    ax.Title.FontSize = 15;
    legend('CP_{xy}','CP_{yx}');
    
end