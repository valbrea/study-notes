function [ throughput ] = Noerror6 (slot )
%���ݰ�����
data_bits=8472;
%ÿ���ڵ�ĳ�ʼ����Ϊ��
AR=zeros(1,data_bits);
BR=zeros(1,data_bits);
CR=zeros(1,data_bits);
DR=zeros(1,data_bits);
%�׽ڵ���ĩ�ڵ����յ��ĳ�ʼ����Ϊ��
HR=zeros(1,data_bits);
TR=zeros(1,data_bits);
H2T=zeros(1,data_bits);
T2H=zeros(1,data_bits);
%��������
throughput=0;
output=0;
empty=zeros(1,data_bits);%����

for time=1:slot %����ʱ��
    type=mod(time,3); %�������еĽڵ��Ϊ����
    switch type
        case 0 %��2 5���ڵ㷢������
            AR=xor(AR,BR);
            CR=xor(CR,BR);
            T2H=randi([0,1],1,data_bits);
            if TR==empty
                TR=T2H;
            else TR=xor(T2H,TR);
            end
            DR=xor(DR,TR);
            
        case 1 %��0 3���ڵ㷢������
            H2T=randi([0,1],1,data_bits);
            if HR==empty
                HR=H2T;
            else HR=xor(H2T,HR);
            end
            AR=xor(AR,HR);
            
            BR=xor(CR,BR);
            DR=xor(CR,DR);
            
        case 2 %��1 4���ڵ㷢������
            BR=xor(BR,AR);
            HR=xor(H2T,AR);
            if ~isequal(AR,empty)&&~isequal(HR,empty)
                output=output+1;
            end
            
            CR=xor(CR,DR);
            TR=xor(T2H,DR);
            if ~isequal(DR,empty)&&~isequal(xor(DR,T2H),empty)
                output=output+1;
            end
    end
    throughput=output/(time+1);
end
end