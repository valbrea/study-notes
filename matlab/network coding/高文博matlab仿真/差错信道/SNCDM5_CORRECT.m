function [ throughput] = SNCDM5_CORRECT (SNR)
data_bits=100;
slot=1000;
output=0;
empty=zeros(1,data_bits);
%中继节点初始化
X1=randi([0,1],1,data_bits);
Y1=randi([0,1],1,data_bits);
X2=randi([0,1],1,data_bits);
Y2=randi([0,1],1,data_bits);
RR1=empty;RL1=empty;SR1=Y1;SL1=X2;
RR2=Y1;RL2=empty;SR2=Y2;SL2=empty;
RR3=Y2;RL3=X1;SR3=empty;SL3=empty;

for time=1:slot %仿真时间
    type=mod(time,4); %将过程分为五个阶段
    switch type
        case 0
            if ~isequal(SR3,empty)&&~isequal(SL3,empty)          
                R_3=XOR(SR3,SL3);
                RR3=SR3;
                RL3=SL3;
                sign1=twoway(R_3,SNR);
                if sign1==1
                    output=output+1;
                    SR2=XOR(R_3,RL2);    
                elseif sign==2
                    SR2=XOR(R_1,RL2);    
                elseif sign==3
                    output=output+1;
                    SR2=empty;
                end             
            elseif ~isequal(SR3,empty)&&isequal(SL3,empty)
                R_3=SR3;
                RR3=SR3;
                if oneway(R_1,SNR)==1
                    SR2=SR3;
                else
                    SR2=empty;
                end
            elseif isequal(SR1,empty)&&~isequal(SL1,empty)
                R_3=SL3;
                RL3=SL3;
                if oneway(R_3,SNR)==1
                    output=output+1;
                end
            end
  
        case 1
            if ~isequal(SR1,empty)&&~isequal(SL1,empty)          
                R_1=XOR(SR1,SL1);
                RR1=SR1;
                RL1=SL1;
                sign1=twoway(R_1,SNR);
                if sign1==1
                    output=output+1;
                    SL2=XOR(R_1,RR2);    
                elseif sign==2
                    output=output+1;
                    SL2=empty;
                elseif sign==3
                    SL2=XOR(R_1,RR2);
                end             
            elseif ~isequal(SR1,empty)&&isequal(SL1,empty)
                R_1=SR1;
                RR1=SR1;
                if oneway(R_1,SNR)==1
                    output=output+1;
                end
            elseif isequal(SR1,empty)&&~isequal(SL1,empty)
                R_1=SL1;
                RL1=SL1;
                if oneway(R_1,SNR)==1
                    SL2=SL1;
                else
                    SL2=empty;
                end
            end
            
        case 2
            H2T=randi([0,1],1,data_bits);
            if oneway(H2T,SNR)==1
                SR1=H2T;
            else
                SR1=empty;
            end
            
            T2H=randi([0,1],1,data_bits);
            if oneway(T2H,SNR)==1
                SL3=T2H;
            else
                SL3=empty;
            end
                    
        case 3
            if ~isequal(SR2,empty)&&~isequal(SL2,empty)          
                R_2=XOR(SR2,SL2);
                RR2=SR2;
                RL2=SL2;
                sign1=twoway(R_2,SNR);
                if sign1==1
                    SR1=XOR(R_2,RL1);
                    SL3=XOR(R_2,RR3);    
                elseif sign==2
                    SR1=XOR(R_2,RL1);
                    SL3=empty;
                elseif sign==3
                    SR1=empty;
                    SL3=XOR(R_2,RR3);
                end
            elseif ~isequal(SR2,empty)&&isequal(SL2,empty)
                R_2=SR2;
                RR2=SR2;
                if oneway(R_2,SNR)==1
                    SR1=XOR(R_2,RL1);
                else 
                    SR1=empty;
                end
            elseif isequal(SR2,empty)&&~isequal(SL2,empty)
                R_2=SL2;
                RL2=SL2;
                if oneway(R_2,SNR)==1
                    SL3=XOR(R_2,RR3);
                else
                    SL3=empty;
                end
            end               
    end
end
throughput=output+1/(timeslot+8);
end










