function ecdict = importfile(filename, startRow, endRow)
%IMPORTFILE ���ı��ļ��е���ֵ������Ϊ�����롣
%   ECDICT = IMPORTFILE(FILENAME) ��ȡ�ı��ļ� FILENAME ��Ĭ��ѡ����Χ�����ݡ�
%
%   ECDICT = IMPORTFILE(FILENAME, STARTROW, ENDROW) ��ȡ�ı��ļ� FILENAME ��
%   STARTROW �е� ENDROW ���е����ݡ�
%
% Example:
%   ecdict = importfile('ecdict.csv', 1, 770612);
%
%    ������� TEXTSCAN��

% �� MATLAB �Զ������� 2019/03/21 20:44:50

%% ��ʼ��������
delimiter = ',';
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% ����������Ϊ�ı���ȡ:
% �й���ϸ��Ϣ������� TEXTSCAN �ĵ���
formatSpec = '%q%[^\n\r]';

%% ���ı��ļ���
fileID = fopen(filename,'r');

%% ���ݸ�ʽ��ȡ�����С�
% �õ��û������ɴ˴������õ��ļ��Ľṹ����������ļ����ִ����볢��ͨ�����빤���������ɴ��롣
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    dataArray{1} = [dataArray{1};dataArrayBlock{1}];
end

%% �ر��ı��ļ���
fclose(fileID);

%% ��������ֵ�ı���������ת��Ϊ��ֵ��
% ������ֵ�ı��滻Ϊ NaN��
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));


%% �����ݲ��Ϊ��ֵ���ַ����С�
rawNumericColumns = {};
rawStringColumns = string(raw(:, 1));


%% ������ֵԪ���滻Ϊ NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % ���ҷ���ֵԪ��
rawNumericColumns(R) = {NaN}; % �滻����ֵԪ��

%% �����������
ecdict = table;
ecdict.word = rawStringColumns(:, 1);

