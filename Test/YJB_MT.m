clearvars

Et = load('YJBey.dat');
Ht = load('YJBhx.dat');

[f,E] = time2frequency(Et,4096);
[~,H] = time2frequency(Ht,4096);

Z = E./H;

ra = abs(Z).^2./(f'*4e-7.*pi);
ph = 180*angle(Z)/pi;

h = sqrt(ra./(2*pi*f'*pi*4e-7));
r = -ra.*(90./ph-1);

figure('Position',[244.2,235.4,719.2,420])
semilogx(h,r,'-o','LineWidth',1.3,'MarkerSize',2)
grid on 
ylabel('\rho (\Omega\cdot m)')
xlabel('Deepth (m)')
title('Bostick inversion of 1D magnetotelluric')
figure('Name','Apparent resistivity curve','Position',[244.2,235.4,719.2,420])
semilogx(f,ra,'-o','LineWidth',1.3,'MarkerSize',2)
grid on
ylabel('\rho_\alpha (\Omega\cdot m)')
xlabel('Frequency (Hz)')
title('The frequency-apparent resistivity curve')
xlim([0,2048])
ax = gca;
ax.FontName = 'Times New Roman';
ax.FontSize = 13;

figure('Name','Phase curve','Position',[244.2,235.4,719.2,420])
semilogx(f,ph,'-o','LineWidth',1.3,'MarkerSize',2)
grid on
ylabel('\phi (\circ)')
xlabel('Frequency (Hz)')
title('The frequency-phase curve')
xlim([0,2048])
ax = gca;
ax.FontName = 'Times New Roman';
ax.FontSize = 13;
