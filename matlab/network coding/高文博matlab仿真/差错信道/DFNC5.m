function [throughput] = DFNC5(slot)
data_bits=8472;
R_1=randi([0,1],1,data_bits);
R_2=zeros(1,data_bits);
R_6=zeros(1,data_bits);
R_7=randi([0,1],1,data_bits);
R_3=R_1;
R_5=R_7;
R_4=xor(R_5,R_1);

RR_1=1;
LR_2=0;
RR_2=0;
LR_3=0;
RR_3=0;
RR_4=1;
LR_4=1;
LR_5=0;
RR_5=0;
LR_6=0;
RR_6=0;
LR_7=1;

RT_1=0;
RT_2=0;
LRT_3=0;
RRT_3=0;
RT_4=0;
LRT_5=0;
RRT_5=0;
RT_6=0;
RT_7=0;

output=0;
prate=11*10^6;
T=data_bits/prate;

tbegin=zeros(1,slot);
tend=zeros(1,slot);
tbegin(1)=1;
i=2;
j=1;


for time=1:slot %����ʱ��
    type=mod(time,5); %�����̷�Ϊ����׶�
    switch type
        case 1
            if RR_1==1||RT_1==1 % �ڵ�1 �Ҵ�
                R_1=randi([0,1],1,data_bits);
                RT_1=condition2();
                if RT_1==0
                    tbegin(i)=time+4;
                    i=i+1;
                    R_2=xor(R_1,R_2);
                    LR_2=LR_2+1;
                    RR_1=RR_1-1;
                end
            end
            
            if RT_4==2 % �ڵ�4 ˫��
                RT_4=condition2();
                if RT_4==0
                    RR_3=RR_3+1;
                    LR_4=LR_4-1;
                    R_3=xor(R_4,R_3);
                else
                    RT_4=2;
                end
            elseif RT_4==1
                RT_4=condition2();
                if RT_4==0
                    R_5=xor(R_5,R_4);
                    LR_5=LR_5+1;
                    RR_4=RR_4-1;
                else
                    RT_4=1;
                end
            else
                if (RT_4==3)||(LR_4==1&&RR_4==1)
                    RT_4=condition();
                    if RT_4==0
                        RR_3=RR_3+1;
                        R_3=xor(R_4,R_3);
                        R_5=xor(R_4,R_5);
                        LR_5=LR_5+1;
                        LR_4=LR_4-1;
                        RR_4=RR_4-1;
                    elseif RT_4==1
                        RR_3=RR_3+1;
                        LR_4=LR_4-1;
                        R_3=xor(R_4,R_3);
                    elseif RT_4==2
                        LR_5=LR_5+1;
                        RR_4=RR_4-1;
                        R_5=xor(R_4,R_5);
                    end
                end
            end
            
            if LR_7==1||RT_7==1 % �ڵ�7 ��
                R_7=randi([0,1],1,data_bits);
                RT_7=condition2();
                if RT_7==0
                    R_6=xor(R_6,R_7);
                    LR_7=LR_7-1;
                    RR_6=RR_6+1;
                end
            end
            
        case 2
            if RR_3==1||LRT_3==1 %�ڵ�3 ��
                LRT_3=condition2();
                if LRT_3==0
                    R_2=xor(R_3,R_2);
                    RR_2=RR_2+1;
                    RR_3=RR_3-1;
                end
            end
            
            
            if LR_5==1||RRT_5==1 %�ڵ�5 �Ҵ�
                RRT_5=condition2();
                if RRT_5==0
                    LR_5=LR_5-1;
                    LR_6=LR_6+1;
                    R_6=xor(R_6,R_5);
                end
            end
            
        case 3
            if RT_2==2 % �ڵ�2 ˫��
                RT_2=condition2();
                if RT_2==0
                    output=output+1;
                    RR_1=RR_1+1;
                    LR_2=LR_2-1;
                else
                    RT_2=2;
                end
            elseif RT_2==1
                RT_2=condition2();
                if RT_2==0
                    R_3=xor(R_2,R_3);
                    LR_3=LR_3+1;
                    RR_2=RR_2-1;
                else
                    RT_2=1;
                end
            else
                if (RT_2==3)||(LR_2==1&&RR_2==1)
                    RT_2=condition();
                    if RT_2==0
                        output=output+1;
                        RR_1=RR_1+1;
                        R_3=xor(R_2,R_3);
                        LR_3=LR_3+1;
                        LR_2=LR_2-1;
                        RR_2=RR_2-1;
                    elseif RT_2==1
                        output=output+1;
                        RR_1=RR_1+1;
                        LR_2=LR_2-1;
                    elseif RT_2==2
                        RR_2=RR_2-1;
                        R_3=xor(R_2,R_3);
                        LR_3=LR_3+1;
                    end
                end
            end
            
            if RT_6==2 % �ڵ�6 ˫��
                RT_6=condition2();
                if RT_6==0
                    LR_6=LR_6-1;
                    RR_5=RR_5+1;
                    R_5=xor(R_5,R_6);
                else
                    RT_6=2;
                end
            elseif RT_6==1
                RT_6=condition2();
                if RT_6==0
                    tend(j)=time+4;
                    j=j+1;
                    output=output+1;
                    RR_6=RR_6-1;
                    LR_7=LR_7+1;
                else
                    RT_6=1;
                end
            else
                if (RT_6==3)||(LR_6==1&&RR_6==1)
                    RT_6=condition();
                    if RT_6==0
                        output=output+1;
                        tend(j)=time+4;
                        j=j+1;
                        LR_7=LR_7+1;
                        R_5=xor(R_6,R_5);
                        RR_5=RR_5+1;
                        LR_6=LR_6-1;
                        RR_6=RR_6-1;
                    elseif RT_6==1
                        RR_5=RR_5+1;
                        LR_6=LR_6-1;
                        R_5=xor(R_5,R_6);
                    elseif RT_6==2
                        output=output+1;
                        tend(j)=time++4;
                        j=j+1;
                        RR_6=RR_6-1;
                        LR_7=LR_7+1;
                    end
                end
            end
            
        case 4
            if LR_3==1||RRT_3==1 % �ڵ�3 �Ҵ�
                RRT_3=condition2();
                if RRT_3==0
                    R_4=xor(R_4,R_3);
                    LR_4=LR_4+1;
                    LR_3=LR_3-1;
                end
            end
            
        case 0
            if RR_5==1||LRT_5==1 %�ڵ�5 ��
                LRT_5=condition2();
                if LRT_5==0
                    RR_4=RR_4+1;
                    RR_5=RR_5-1;
                    R_4=xor(R_4,R_5);
                end
            end
    end
end
throughput=output*data_bits/((time+4)*T);
shiyan=tend-tbegin;
end