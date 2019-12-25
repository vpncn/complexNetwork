% ���⹥�������սڵ���Ҫ��˳��һ�ι���һ���ڵ�

clc;
clear; 

%��������
load('Data\testBA_100nodes.mat');

%% ��ʼ��
%%%��Ҫ�����Ĳ���
NumDelete = 20;                                              %% ����ɾ���Ľڵ���

Name_Struct = Node_Key_Sort_Descend;       %  Name_Struct ���ݼ����ƣ������������ݼ�ʱ����Ҫ���Ĵ˴��ṹ������
A_Init =  Name_Struct.Adjacent_Matrix;      %% �����ڽӾ���
N_Init = size(A_Init,1);                     %% �ڵ����

NetEff_Init = zeros(1,NumDelete);
Struct_Init = struct('Deg',NetEff_Init);

% ��ʼ��������
%������������Դ˽������������ע�͵���Ϊ���⹥�����������ֵ��Ϊ���Լ�����Ľڵ���
Name_Struct.Node_Key_Degree = randperm(440);

%% 
%  ���� Degree �㷨����ɾ���ڵ�
A = A_Init;          %% �����ڽӾ��� A
B=[];                %%��������飬���ձ�ɾ���Ľڵ����
for i = 1:NumDelete
    A( Name_Struct.Node_Key_Degree(i),: ) = 0;     %% ɾ���ڵ� Node_Key_Degree(i),�� 0 ռλ�������ÿ�
    A( :,Name_Struct.Node_Key_Degree(i) ) = 0;
    AA = A;
    AA( sum(A)==0,: ) = [];
    AA( :,sum(A)==0 ) = [];
    B(i) = Name_Struct.Node_Key_Degree(i);
    Con_Index_NetEff = testEglob( AA );

    Eglob(i) = Con_Index_NetEff.Net_Eff_Mymod;

end          

%%
%��������������������ͨЧ��ͼ
%Eglob�洢����Ӧ������Ч�ʵ���ֵ