function [ trans ] = TRANS2(SNR,data )
data=double(data);
R=BPSK(SNR,data);
L=BPSK(SNR,data);
if isequal(R,data) && isequal(L,data) %��ȷ����
    trans=0;
elseif ~isequal(R,data) && isequal(L,data) %�Ҵ�ʧ��
    trans=1;    
elseif isequal(R,data) && ~isequal(L,data) %��ʧ��
    trans=2;
else %��ʧ��
    trans=3;
end  
end

