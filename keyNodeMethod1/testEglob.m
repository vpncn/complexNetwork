function Con_Index_NetEff = testEglob( A )

A_A = A;                               %%  ����ԭ�еľ���ɾ�������ڵ��� �ڽӾ����ڷ�������л�ʹ�õ� A

%����ȫ��Ч��
A_A=sparse(A_A);

ShortPath=1./graphallshortestpaths(A_A);

ShortPath(ShortPath==inf)=0;

Eglob=(1/(length(A_A)*(length(A_A)-1)))*sum(sum(ShortPath))

Net_Eff_Mymod = Eglob;

% ����ֵ
Con_Index_NetEff = struct('Net_Eff_Mymod',Net_Eff_Mymod);


end

