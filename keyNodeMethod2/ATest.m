%������������ڵ�ĸ�����������ֵ���������ģ�ⶨ
numDelete = 22;

%��������Ч�ʳ�ʼ����
netSum = zeros(1,numDelete);

%������������Ĵ�����Ҳ���Ǻ���ѭ���Ĵ���
numRandom = 50;
for i=1:numRandom
    
    %�ѵõ�������Ч�����鸳��netI
    netI = ATestAver('Data\testBA_100nodes.mat',numDelete);
    %�ۼ�
    netSum = netSum + netI;
end

%���ƽ��ֵ
netAver = netSum/numRandom;

