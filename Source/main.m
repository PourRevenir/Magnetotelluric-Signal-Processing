clearvars

filename = '40-11.AVG';

%% read data file

fid=fopen(filename,'r');

for i = 1:27
    temp=fgets(fid);
end

data=fscanf(fid,'%g',[1,inf]);
data=reshape(data,34,length(data)/34);

f = data(1,:);
ExEx = data(5,:) + 1j * data(6,:);
ExEy = data(7,:) + 1j * data(8,:); EyEx = conj(ExEy);
% EyEx = data(7,:) + 1j * data(8,:); ExEy = conj(EyEx);
EyEy = data(9,:) + 1j * data(10,:);
ExHx = data(11,:) + 1j * data(12,:); HxEx = conj(ExHx);
% HxEx = data(11,:) + 1j * data(12,:); ExHx = conj(HxEx);
EyHx = data(13,:) + 1j * data(14,:); HxEy = conj(EyHx);
% HxEy = data(13,:) + 1j * data(14,:); EyHx = conj(HxEy);
HxHx = data(15,:) + 1j * data(16,:);
ExHy = data(17,:) + 1j * data(18,:); HyEx = conj(ExHy);
% HyEx = data(17,:) + 1j * data(18,:); ExHy = conj(HyEx);
EyHy = data(19,:) + 1j * data(20,:); HyEy = conj(EyHy);
% HyEy = data(19,:) + 1j * data(20,:); EyHy = conj(HyEy);
HyHx = data(21,:) + 1j * data(22,:); HxHy = conj(HyHx);
% HxHy = data(21,:) + 1j * data(22,:); HyHx = conj(HxHy);
HyHy = data(23,:) + 1j * data(24,:);
ExHz = data(25,:) + 1j * data(26,:); HzEx = conj(ExHz);
% HzEx = data(25,:) + 1j * data(26,:); ExHz = conj(HzEx);
EyHz = data(27,:) + 1j * data(28,:); HzEy = conj(EyHz);
% HzEy = data(27,:) + 1j * data(28,:); EyHz = conj(HzEy);
HxHz = data(29,:) + 1j * data(30,:); HzHx = conj(HxHz);
% HzHx = data(29,:) + 1j * data(30,:); HxHz = conj(HzHx);
HyHz = data(31,:) + 1j * data(32,:); HzHy = conj(HyHz);
% HzHy = data(31,:) + 1j * data(32,:); HyHz = conj(HzHy);
HzHz = data(33,:) + 1j * data(34,:);

% calculate
Zxy1 = (ExEx.*HxEy-ExEy.*HxEx)./(HxEx.*HyEy-HxEy.*HyEx);
Zxy2 = (ExEx.*HxHx-ExHx.*HxEx)./(HxEx.*HyHx-HxHx.*HyEx);
Zxy3 = (ExEy.*HxHy-ExHy.*HxEy)./(HxEy.*HyHy-HxHy.*HyEy);
Zxy4 = (ExHx.*HxHy-ExHy.*HxHx)./(HxHx.*HyHy-HxHy.*HyHx);

rxy1 = abs(Zxy1).^2./(2.*pi.*f.*4.*pi.*10e-7);
rxy2 = abs(Zxy2).^2./(2.*pi.*f.*4.*pi.*10e-7);
rxy3 = abs(Zxy3).^2./(2.*pi.*f.*4.*pi.*10e-7);
rxy4 = abs(Zxy4).^2./(2.*pi.*f.*4.*pi.*10e-7);

phxy1 = angle(Zxy1);
phxy2 = angle(Zxy2);
phxy3 = angle(Zxy3);
phxy4 = angle(Zxy4);

Rxy = (Zxy1+Zxy2+Zxy3+Zxy4)./4;
Dxy = (abs(Rxy-Zxy1)+abs(Rxy-Zxy2)+abs(Rxy-Zxy3)+abs(Rxy-Zxy4))./4;
CPxy = 1 - Dxy./Rxy;

Zyx1 = (EyEx.*HyEy-EyEy.*HyEx)./(HxEx.*HyEy-HxEy.*HyEx);
Zyx2 = (EyEx.*HyHx-EyHx.*HyEx)./(HxEx.*HyHx-HxHx.*HyEx);
Zyx3 = (EyEy.*HyHy-EyHy.*HyEy)./(HxEy.*HyHy-HxHy.*HyEy);
Zyx4 = (EyHx.*HyHy-EyHy.*HyHx)./(HxHx.*HyHy-HxHy.*HyHx);

ryx1 = abs(Zyx1).^2./(2.*pi.*f.*4.*pi.*10e-7);
ryx2 = abs(Zyx2).^2./(2.*pi.*f.*4.*pi.*10e-7);
ryx3 = abs(Zyx3).^2./(2.*pi.*f.*4.*pi.*10e-7);
ryx4 = abs(Zyx4).^2./(2.*pi.*f.*4.*pi.*10e-7);

phyx1 = angle(Zyx1);
phyx2 = angle(Zyx2);
phyx3 = angle(Zyx3);
phyx4 = angle(Zyx4);

Ryx = (Zyx1+Zyx2+Zyx3+Zyx4)./4;
Dyx = (abs(Ryx-Zyx1)+abs(Ryx-Zyx2)+abs(Ryx-Zyx3)+abs(Ryx-Zyx4))./4;
CPyx = 1 - Dyx./Ryx;

Azx = (HyHy.*HzHx-HyHx.*HzHy)./(HxHx.*HyHy-HxHy.*HyHy);
Bzy = (HxHx.*HzHy-HxHy.*HzHx)./(HxHx.*HyHy-HxHy.*HyHy);
