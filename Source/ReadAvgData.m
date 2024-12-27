function [f,Data] = ReadAvgData(filename)
%ReadAvgData Read .AVG files data
%
%   Data = ReadAvgData(filename)
%
%   Input
%       filename - .AVG file name
%
%   Output
%       Data - 25 channels data
%       f - frequency
%

    fid=fopen(filename,'r');

    for i = 1:27
        temp=fgets(fid);
    end

    data=fscanf(fid,'%g',[1,inf]);
    data=reshape(data,34,length(data)/34);

    f = data(1,:);
    Data(1,:) = data(5,:) + 1j * data(6,:);
    Data(2,:) = data(7,:) + 1j * data(8,:);
    Data(3,:) = conj(Data(2,:));
    Data(4,:) = data(9,:) + 1j * data(10,:);
    Data(5,:) = data(11,:) + 1j * data(12,:);
    Data(6,:) = conj(Data(5,:));
    Data(7,:) = data(13,:) + 1j * data(14,:);
    Data(8,:) = conj(Data(7,:));
    Data(9,:) = data(15,:) + 1j * data(16,:);
    Data(10,:) = data(17,:) + 1j * data(18,:);
    Data(11,:) = conj(Data(10,:));
    Data(12,:) = data(19,:) + 1j * data(20,:);
    Data(13,:) = conj(Data(12,:));
    Data(14,:) = data(21,:) + 1j * data(22,:);
    Data(15,:) = conj(Data(14,:));
    Data(16,:) = data(23,:) + 1j * data(24,:);
    Data(17,:) = data(25,:) + 1j * data(26,:);
    Data(18,:) = conj(Data(17,:));
    Data(19,:) = data(27,:) + 1j * data(28,:);
    Data(20,:) = conj(Data(19,:));
    Data(21,:) = data(29,:) + 1j * data(30,:);
    Data(22,:) = conj(Data(21,:));
    Data(23,:) = data(31,:) + 1j * data(32,:);
    Data(24,:) = conj(Data(23,:));
    Data(25,:) = data(33,:) + 1j * data(34,:);

end