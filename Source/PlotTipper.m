function PlotTipper(f,Azx,Byz,file)
    %PlotTipper 
    %   PlotTipper(f,Azx,Byz,file)
    %

    subplot(2,1,1)
    semilogx(f,abs(Azx),'LineWidth',1.3)
    hold on
    semilogx(f,abs(Byz),'LineWidth',1.3)
    grid on
    ax = gca;
    ax.YLabel.String = 'Tipper amplitude';
    ax.YLabel.FontName = 'Times New Roman';
    ax.YLabel.FontSize = 14;
    ax.XLim = [0.001,330];
    ax.Title.String = ['Tipper vector of Dunhuang ',file,', 1995'];
    ax.Title.FontName = 'Times New Roman';
    ax.Title.FontSize = 15;
    legend('A_{zx}','B_{yz}');

    subplot(2,1,2)
    semilogx(f,180*angle(Azx)/pi,'LineWidth',1.3)
    hold on
    semilogx(f,180*angle(Byz)/pi,'LineWidth',1.3)
    grid on
    ax = gca;
    ax.XLabel.String = 'Frequency (Hz)';
    ax.XLabel.FontName = 'Times New Roman';
    ax.XLabel.FontSize = 14;
    ax.YLabel.String = 'Tipper phase(\circ)';
    ax.YLabel.FontName = 'Times New Roman';
    ax.YLabel.FontSize = 14;
    ax.XLim = [0.001,330];
    legend('A_{zx}','B_{yz}');
    
end