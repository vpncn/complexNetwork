function Eglob = ATestAver(str,numDelete)
%���� �� 
%        str����Ϊ�����ļ���·��
%        numDelete:ɾ���ڵ�ĸ���

%����ֵ��Eglob��������Ч��ֵ������

%���������ļ�
load(str);

Name_Struct = Node_Key_Sort_Descend;       %  Name_Struct ���ݼ����ƣ������������ݼ�ʱ����Ҫ���Ĵ˴��ṹ������
A_Init =  Name_Struct.Adjacent_Matrix;      %% �����ڽӾ���
N_Init = size(A_Init,1);                     %% �ڵ����

NetEff_Init = zeros(1,numDelete);
Struct_Init = struct('Deg',NetEff_Init);

% ��ʼ��������
%������������Դ˽��������
Name_Struct.Node_Key_Degree = randperm(440);

%% 
%  ���� Degree �㷨����ɾ���ڵ�
A = A_Init;          %% �����ڽӾ��� A
for i = 1:numDelete
    A( Name_Struct.Node_Key_Degree(i),: ) = 0;     %% ɾ���ڵ� Node_Key_Degree(i),�� 0 ռλ�������ÿ�
    A( :,Name_Struct.Node_Key_Degree(i) ) = 0;
    AA = A;
    AA( sum(A)==0,: ) = [];
    AA( :,sum(A)==0 ) = [];
    Con_Index_NetEff = testEglob( AA );

    Eglob(i) = Con_Index_NetEff.Net_Eff_Mymod;          
end
