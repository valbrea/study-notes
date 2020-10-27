function [throughput] = RF6( slot )
data_bits=8472;

AR=zeros(1,data_bits);
AL=zeros(1,data_bits);
BR=zeros(1,data_bits);
BL=zeros(1,data_bits);
CR=zeros(1,data_bits);
CL=zeros(1,data_bits);
DR=zeros(1,data_bits);
DL=zeros(1,data_bits);

hbegin=zeros(1,100);
hend=zeros(1,100);
T1=zeros(1,100);
i=1;
j=1;

throughput=0;
output=0;
empty=zeros(1,data_bits);%����
prate=11*10^6; %������·������
T=data_bits/prate; %����һ�����ݰ�����ʱ��

for time=1:slot %����ʱ��
    type=mod(time,5); %�������еĽڵ��Ϊ����
    switch type
        case 1
            H2T=randi([0,1],1,data_bits);
           
            AR=H2T;
            BL=CL;   
        case 2
            if ~isequal(AL,empty)
                output=output+1;
                hend(j)=time;
                 j=j+1;
            end
            DR=CR;          
        case 3
            BR=AR;
            CL=DL;
        case 4
            AL=BL;
            if ~isequal(DR,empty)
                output=output+1;
                 
            end
           
        case 0
            CR=BR;
            T2H=randi([0,1],1,data_bits);
             hbegin(i)=time;
            i=i+1;
            DL=T2H;
    end
throughput=output*data_bits/(time*T);
end
%T1=hend-hbegin;
end

