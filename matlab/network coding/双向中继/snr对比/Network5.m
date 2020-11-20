function [ throughput] = Network5 (SNR)
%���ݰ���С
data_bits=100;
%ÿ���ڵ�ĳ�ʼ����Ϊ��
AR=zeros(1,data_bits);
BR=zeros(1,data_bits);
CR=zeros(1,data_bits);
HR=zeros(1,data_bits);
TR=zeros(1,data_bits);
H2T=zeros(1,data_bits);
T2H=zeros(1,data_bits);
%��������
output=0;
empty=zeros(1,data_bits);
prate=11*10^6; %������·������
T=data_bits/prate; %����һ�����ݰ�����ʱ��
%���ջ��� 
Atemp=empty;
Btemp=empty;
Ctemp=empty;
%�ش�״̬
Htrans=0;
Atrans=0;
Btrans=0;
Ctrans=0;
Ttrans=0;
%���ձ�־
RA=1;LA=0;
RB=0;LB=0;
RC=1;LC=1;
RH=1;LT=0;
hsend=0;
tsend=0;
hrecive=0;
trecive=0;
%����ʱ϶
slot=200;

for time=1:slot
    type=mod(time,3);
    switch type
        case 0 %B�ڵ�
            %B�ڵ�
            if Btrans==1
                Btrans=TRANSR(SNR,BR);
                if Btrans==0
                    LB=LB-1;
                    if Atrans==0
                        AR=xor(xor(AR,BR),Atemp); 
                        Atemp=empty;
                    else
                        Atemp=BR;
                    end
                    RA=RA+1;
                end
                
            elseif Btrans==2
                Btrans=TRANSL(SNR,BR);
                if Btrans==0
                    RB=RB-1;
                    if Ctrans==0
                        CR=xor(xor(CR,BR),Ctemp);
                        Ctemp=empty;
                    else
                        Ctemp=BR;
                    end
                    LC=LC+1;
                end
                
            elseif Btrans==3 % �����ش�
                Btrans=TRANS2(SNR,BR);
                if Btrans==0
                    RB=RB-1;LB=LB-1;
                    if Ctrans==0
                        CR=xor(xor(CR,BR),Ctemp);
                        Ctemp=empty;
                        if Atrans==0
                            AR=xor(xor(AR,BR),Atemp);
                            Atemp=empty;  
                        else
                            Atemp=BR;
                        end
                    else
                        Ctemp=BR;
                        if Atrans==0
                            AR=xor(xor(AR,BR),Atemp);
                            Atemp=empty;  
                        else
                            Atemp=BR;
                        end                          
                    end
                    RA=RA+1;LC=LC+1;
                elseif Btrans==1
                    RB=RB-1;
                    if Ctrans==0
                        CR=xor(xor(CR,BR),Ctemp);
                        Ctemp=empty;
                    else
                         Ctemp=CR;
                    end
                    LC=LC+1;
                elseif Btrans==2
                    LB=LB-1;
                    if Atrans==0 
                        AR=xor(xor(AR,BR),Atemp);
                        Atemp=empty;   
                    else
                       Atemp=BR;
                    end
                    RA=RA+1;
                end
                
            elseif RB==1&&LB==1 % Ϊɶ��Btrans == 3 һ��
                Btrans=TRANS2(SNR,BR);
                if Btrans==0
                    RB=RB-1;LB=LB-1;
                    if Ctrans==0
                        CR=xor(xor(CR,BR),Ctemp);
                        Ctemp=empty;
                        if Atrans==0
                            AR=xor(xor(AR,BR),Atemp);
                            Atemp=empty;  
                        else
                            Atemp=BR;
                        end
                    else
                        Ctemp=BR;
                        if Atrans==0
                            AR=xor(xor(AR,BR),Atemp);
                            Atemp=empty;  
                        else
                            Atemp=BR;
                        end                          
                    end
                    RA=RA+1;LC=LC+1;
                elseif Btrans==1
                    RB=RB-1;
                    if Ctrans==0
                        CR=xor(xor(CR,BR),Ctemp);
                        Ctemp=empty;
                    else
                         Ctemp=CR;
                    end
                    LC=LC+1;
                elseif Btrans==2
                    LB=LB-1;
                    if Atrans==0 
                        AR=xor(xor(AR,BR),Atemp);
                        Atemp=empty;   
                    else
                       Atemp=BR;
                    end
                    RA=RA+1;
                end
            end
            
        case 1  %H C�ڵ�
            %H�ڵ�
            if Htrans==1
                Htrans=TRANSR(SNR,HR);
                if Htrans==0
                    hsend=[hsend,time];
                    RH=RH-1;
                    H2T=randi([0,1],1,data_bits);
                    HR=xor(HR,H2T);
                    if Atrans==0
                        AR=xor(xor(AR,HR),Atemp);
                        Atemp=empty;
                    else
                        Atemp=HR;
                    end
                    LA=LA+1; 
                end
                
            elseif RH==1
                Htrans=TRANSR(SNR,HR);
                if Htrans==0
                    hsend=[hsend,time];
                    RH=RH-1;
                    H2T=randi([0,1],1,data_bits);
                    HR=xor(HR,H2T);
                    if Atrans==0
                        AR=xor(xor(AR,HR),Atemp);
                        Atemp=empty;
                    else
                        Atemp=HR;
                    end
                    LA=LA+1;
                end
            end
            
            %C�ڵ�
            if Ctrans==1
                Ctrans=TRANSR(SNR,CR);
                if Ctrans==0 
                    LC=LC-1;
                    if Btrans==0
                        BR=xor(xor(CR,BR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=CR;
                    end
                    RB=RB+1;
                end
                
            elseif Ctrans==2
                Ctrans=TRANSL(SNR,CR);
                if Ctrans==0
                    RC=RC-1;
                    TR=xor(CR,T2H);
                    if ~isequal(TR,empty)&&~isequal(CR,empty)
                        output=output+1;
                        trecive=[trecive,time];
                    end
                    LT=LT+1;
                end
                
            elseif Ctrans==3
                Ctrans=TRANS2(SNR,CR);
                if Ctrans==0
                    RC=RC-1;LC=LC-1;
                    TR=xor(CR,T2H);
                    if ~isequal(TR,empty)&&~isequal(CR,empty)
                        output=output+1;
                        trecive=[trecive,time];
                    end
                    if Btrans==0
                        BR=xor(xor(CR,BR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=CR;
                    end
                    RB=RB+1;LT=LT+1;
                elseif Ctrans==1
                    RC=RC-1;
                    TR=xor(CR,T2H);
                    if ~isequal(TR,empty)&&~isequal(CR,empty)
                        output=output+1;
                        trecive=[trecive,time];
                    end
                    LT=LT+1;
                elseif Ctrans==2
                    LC=LC-1;
                    if Btrans==0
                        BR=xor(xor(CR,BR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=CR;
                    end
                    RB=RB+1;
                end
                
            elseif RC==1&&LC==1
                Ctrans=TRANS2(SNR,CR);
                if Ctrans==0
                    RC=RC-1;LC=LC-1;
                    TR=xor(CR,T2H);
                    if ~isequal(TR,empty)&&~isequal(CR,empty)
                        output=output+1;
                        trecive=[trecive,time];
                    end
                    if Btrans==0
                        BR=xor(xor(CR,BR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=CR;
                    end
                    RB=RB+1;LT=LT+1;
                elseif Ctrans==1
                    RC=RC-1;
                    TR=xor(CR,T2H);
                    if ~isequal(TR,empty)&&~isequal(CR,empty)
                        output=output+1;
                        trecive=[trecive,time];
                    end
                    LT=LT+1;
                elseif Ctrans==2
                    LC=LC-1;
                    if Btrans==0
                        BR=xor(xor(CR,BR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=CR;
                    end
                    RB=RB+1;
                end
            end
            
        case 2 %A T�ڵ�
            %A�ڵ�
            if Atrans==1
                Atrans=TRANSR(SNR,AR);
                if Atrans==0
                    LA=LA-1;
                    HR=xor(AR,H2T);
                    if ~isequal(HR,empty)&&~isequal(AR,empty)
                        output=output+1;
                        hrecive=[hrecive,time];
                    end
                    RH=RH+1;
                end
                
            elseif Atrans==2
                Atrans=TRANSL(SNR,AR);
                if Atrans==0
                    RA=RA-1;
                    if Btrans==0
                        BR=xor(xor(BR,AR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=AR;
                    end
                    LB=LB+1;
                end
                
            elseif Atrans==3
                Atrans=TRANS2(SNR,AR);
                if Atrans==0
                    RA=RA-1;LA=LA-1;
                    HR=xor(AR,H2T);
                    if ~isequal(HR,empty)&&~isequal(AR,empty)
                        output=output+1;
                        hrecive=[hrecive,time];
                    end
                    if Btrans==0
                        BR=xor(xor(AR,BR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=AR;
                    end
                    LB=LB+1;RH=RH+1;
                elseif Atrans==1
                    RA=RA-1;
                    if Btrans==0
                        BR=xor(xor(BR,AR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=AR;
                    end
                    LB=LB+1;
                elseif Atrans==2
                    LA=LA-1;
                    HR=xor(AR,H2T);
                    if ~isequal(HR,empty)&&~isequal(AR,empty)
                        output=output+1;
                        hrecive=[hrecive,time];
                    end
                    RH=RH+1;
                end
                
            elseif RA==1&&LA==1
                Atrans=TRANS2(SNR,AR);
                if Atrans==0
                    RA=RA-1;LA=LA-1;
                    HR=xor(AR,H2T);
                    if ~isequal(HR,empty)&&~isequal(AR,empty)
                        output=output+1;
                        hrecive=[hrecive,time];
                    end
                    if Btrans==0
                        BR=xor(xor(AR,BR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=AR;
                    end
                    LB=LB+1;RH=RH+1;
                elseif Atrans==1
                    RA=RA-1;
                    if Btrans==0
                        BR=xor(xor(BR,AR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=AR;
                    end
                    LB=LB+1;
                elseif Atrans==2
                    LA=LA-1;
                    HR=xor(AR,H2T);
                    if ~isequal(HR,empty)&&~isequal(AR,empty)
                        output=output+1;
                        hrecive=[hrecive,time];
                    end
                    RH=RH+1;
                end
            end
            
            %T�ڵ�
            if Ttrans==1
                Ttrans=TRANSR(SNR,TR);
                if Ttrans==0
                    tsend=[tsend,time];
                    LT=LT-1;
                    T2H=randi([0,1],1,data_bits);
                    TR=xor(TR,T2H);
                    if Ctrans==0
                        CR=xor(xor(CR,TR),Ctemp);
                        Ctemp=empty;      
                    else
                        Ctemp=TR;
                    end
                    RC=RC+1;
                end
                
            elseif LT==1
                Ttrans=TRANSR(SNR,TR);
                if Ttrans==0
                    tsend=[tsend,time];
                    LT=LT-1;
                    T2H=randi([0,1],1,data_bits);
                    TR=xor(TR,T2H);
                    if Ctrans==0
                        CR=xor(xor(CR,TR),Ctemp);
                        Ctemp=empty;
                    else
                        Ctemp=TR;
                    end
                    RC=RC+1;
                end
            end  
    end
end
h=length(hrecive);
t=length(trecive);
hsend=hsend(:,2:t);
hrecive=hrecive(:,2:h);
tsend=tsend(:,2:h);
trecive=trecive(:,2:t);
delay=[trecive-hsend,hrecive-tsend];
delay=mean(delay(:))+1;
throughput=output/time;
end