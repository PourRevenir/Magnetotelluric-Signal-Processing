function [rxy,ryx,phxy,phyx,Azx,Bzy,CPxy,CPyx] = Magnetotelluric(f,Data)
%Magnetotelluric Calculation of apparent resistivity, phase, coherence and tipper vector.
%
%   [rxy,ryx,phxy,phyx,Azx,Bzy,CPxy,CPyx] = Magnetotelluric(Data)
%
%   Input
%       f - frequency.
%       Data - matrix of data.
%
%   Output
%       rxy - apparent resistivity of x-y component.
%       ryx - apparent resistivity of y-x component.
%       phxy - phase of x-y component.
%       phyx - phase of y-x component.
%       Azx - tipper of x component.
%       Bzy - tipper of y component.
%       CPxy - coherence of x-y component.
%       CPyx - coherence of y-x component.
%

u = 4*pi/10e3;
Zxy1 = u*(Data(1).*Data(8)-Data(2).*Data(6))./(Data(6).*Data(13)-Data(8).*Data(11));
Zxy2 = u*(Data(1).*Data(9)-Data(5).*Data(6))./(Data(6).*Data(14)-Data(9).*Data(11));
Zxy3 = u*(Data(2).*Data(15)-Data(10).*Data(8))./(Data(8).*Data(16)-Data(15).*Data(13));
Zxy4 = u*(Data(5).*Data(15)-Data(10).*Data(9))./(Data(9).*Data(16)-Data(15).*Data(14));

rxy1 = abs(Zxy1).^2./(2.*pi.*f.*4.*pi.*10e-7);
rxy2 = abs(Zxy2).^2./(2.*pi.*f.*4.*pi.*10e-7);
rxy3 = abs(Zxy3).^2./(2.*pi.*f.*4.*pi.*10e-7);
rxy4 = abs(Zxy4).^2./(2.*pi.*f.*4.*pi.*10e-7);
rxy = [rxy1,rxy2,rxy3,rxy4];

phxy1 = angle(Zxy1);
phxy2 = angle(Zxy2);
phxy3 = angle(Zxy3);
phxy4 = angle(Zxy4);
phxy = [phxy1,phxy2,phxy3,phxy4];

Rxy = (Zxy1+Zxy2+Zxy3+Zxy4)./4;
Dxy = (abs(Rxy-Zxy1)+abs(Rxy-Zxy2)+abs(Rxy-Zxy3)+abs(Rxy-Zxy4))./4;
CPxy = 1 - Dxy./Rxy;

Zyx1 = u*(Data(3).*Data(13)-Data(4).*Data(11))./(Data(6).*Data(13)-Data(8).*Data(11));
Zyx2 = u*(Data(3).*Data(14)-Data(7).*Data(11))./(Data(6).*Data(14)-Data(9).*Data(11));
Zyx3 = u*(Data(4).*Data(16)-Data(12).*Data(13))./(Data(8).*Data(16)-Data(15).*Data(13));
Zyx4 = u*(Data(7).*Data(16)-Data(12).*Data(14))./(Data(9).*Data(16)-Data(15).*Data(14));

ryx1 = abs(Zyx1).^2./(2.*pi.*f.*4.*pi.*10e-7);
ryx2 = abs(Zyx2).^2./(2.*pi.*f.*4.*pi.*10e-7);
ryx3 = abs(Zyx3).^2./(2.*pi.*f.*4.*pi.*10e-7);
ryx4 = abs(Zyx4).^2./(2.*pi.*f.*4.*pi.*10e-7);
ryx = [ryx1,ryx2,ryx3,ryx4];

phyx1 = angle(Zyx1);
phyx2 = angle(Zyx2);
phyx3 = angle(Zyx3);
phyx4 = angle(Zyx4);
phyx = [phyx1,phyx2,phyx3,phyx4];

Ryx = (Zyx1+Zyx2+Zyx3+Zyx4)./4;
Dyx = (abs(Ryx-Zyx1)+abs(Ryx-Zyx2)+abs(Ryx-Zyx3)+abs(Ryx-Zyx4))./4;
CPyx = 1 - Dyx./Ryx;

Azx = (Data(16).*Data(22)-Data(14).*Data(24))./(Data(9).*Data(16)-Data(15).*Data(16));
Bzy = (Data(9).*Data(24)-Data(15).*Data(22))./(Data(9).*Data(16)-Data(15).*Data(16));

end