function [ out] = Network7 (slot )
%数据包大小
data_bits=8472;
%每个节点的初始数据为空
AR=zeros(1,data_bits);
BR=zeros(1,data_bits);
CR=zeros(1,data_bits);
DR=zeros(1,data_bits);
ER=zeros(1,data_bits);
HR=zeros(1,data_bits);
TR=zeros(1,data_bits);
H2T=zeros(1,data_bits);
T2H=zeros(1,data_bits);
%其余数据
throughput=zeros(1,20);
output=0;
empty=zeros(1,data_bits);
prate=11*10^6; %物理链路层速率
T=data_bits/prate; %发送一次数据包所需时间
%接收缓存
Atemp=empty;
Btemp=empty;
Ctemp=empty;
Dtemp=empty;
Etemp=empty;
%重传状态
Htrans=0;
Atrans=0;
Btrans=0;
Ctrans=0;
Dtrans=0;
Etrans=0;
Ttrans=0;
%接收标志
RA=1;LA=0;
RB=0;LB=0;
RC=1;LC=1;
RD=1;LD=0;
RE=0;LE=0;
RH=1;LT=1;
  
slot=1000;
j=1;i=1;
tbegin=zeros(1,slot);
tend=zeros(1,slot);

for time=1:slot
    type=mod(time,3);
    switch type
        case 0 %B E 节点
            %B节点
            if Btrans==1
                Btrans=condition1(Btrans);
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
                Btrans=condition1(Btrans);
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
                
            elseif Btrans==3
                Btrans=condition();
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
                
            elseif RB==1&&LB==1
                Btrans=condition();
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
            
            %E节点
            if Etrans==1
                Etrans=condition1(Etrans);
                if Etrans==0
                    LE=LE-1;
                    if Dtrans==0
                        DR=xor(xor(ER,DR),Dtemp);
                        Dtemp=empty;
                    else
                        Dtemp=ER;
                    end
                    RD=RD+1;
                end
                
            elseif Etrans==2
                Etrans=condition1(Etrans);
                if Etrans==0
                    RE=RE-1;
                    TR=xor(ER,T2H);
                    if ~isequal(TR,empty)&&~isequal(ER,empty)
                        output=output+1;
                        tend(j)=time;
                        j=j+1;
                    end
                    LT=LT+1;
                end
                
            elseif Etrans==3
                Etrans=condition();
                if Etrans==0
                    RE=RE-1;LE=LE-1;
                    TR=xor(ER,T2H);
                    if ~isequal(TR,empty)&&~isequal(ER,empty)
                        output=output+1;
                        tend(j)=time;
                        j=j+1;
                    end
                    if Dtrans==0
                        DR=xor(xor(ER,DR),Dtemp);
                        Dtemp=empty;
                    else
                        Dtemp=ER;
                    end
                    RD=RD+1;LT=LT+1;
                elseif Etrans==1
                    RE=RE-1;
                    TR=xor(ER,T2H);
                    if ~isequal(TR,empty)&&~isequal(ER,empty)
                        output=output+1;
                        tend(j)=time;
                        j=j+1;
                    end
                    LT=LT+1;
                elseif Etrans==2
                    LE=LE-1;
                    if Dtrans==0
                        DR=xor(xor(ER,DR),Dtemp);
                        Dtemp=empty;
                    else
                        Dtemp=ER;
                    end
                    RD=RD+1;
                end
                
            elseif RE==1&&LE==1
                Etrans=condition();
                if Etrans==0
                    RE=RE-1;LE=LE-1;
                    TR=xor(ER,T2H);
                    if ~isequal(TR,empty)&&~isequal(ER,empty)
                        output=output+1;
                        tend(j)=time;
                        j=j+1;
                    end
                    if Dtrans==0
                        DR=xor(xor(ER,DR),Dtemp);
                        Dtemp=empty;
                    else
                        Dtemp=ER;
                    end
                    RD=RD+1;LT=LT+1;
                elseif Etrans==1
                    RE=RE-1;
                    TR=xor(ER,T2H);
                    if ~isequal(TR,empty)&&~isequal(ER,empty)
                        output=output+1;
                        tend(j)=time;
                        j=j+1;
                    end
                    LT=LT+1;
                elseif Etrans==2
                    LE=LE-1;
                    if Dtrans==0
                        DR=xor(xor(ER,DR),Dtemp);
                        Dtemp=empty;
                    else
                        Dtemp=ER;
                    end
                    RD=RD+1;
                end
            end
            
        case 1 %H C T 节点
            %H节点
            if Htrans==1
                Htrans=condition1(1);
                if Htrans==0
                   tbegin(i)=time;
                    i=i+1;
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
                Htrans=condition1(1);
                if Htrans==0
                   tbegin(i)=time;
                    i=i+1;
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
            
            %C节点
            if Ctrans==1
                Ctrans=condition1(Ctrans);
                if Ctrans==0
                    LC=LC-1;
                    if Btrans==0
                        BR=xor(xor(BR,CR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=CR;
                    end
                    RB=RB+1;
                end
                
            elseif Ctrans==2
                Ctrans=condition1(Ctrans);
                if Ctrans==0
                    RC=RC-1;
                    if Dtrans==0
                        DR=xor(xor(DR,CR),Dtemp);
                        Dtemp=empty;
                    else
                        Dtemp=CR;
                    end
                    LD=LD+1;
                end
                
            elseif Ctrans==3
                Ctrans=condition();
                if Ctrans==0
                    RC=RC-1;LC=LC-1;
                    if Dtrans==0
                        DR=xor(xor(DR,CR),Dtemp);
                        Dtemp=empty;
                        if Btrans==0
                            BR=xor(xor(BR,CR),Btemp);
                            Btemp=empty;
                        else
                            Btemp=CR;
                        end
                    else
                        Dtemp=CR;
                        if Btrans==0
                            BR=xor(xor(BR,CR),Btemp);
                            Btemp=empty;
                        else
                            Btemp=CR;
                        end
                    end
                    RB=RB+1;LD=LD+1;
                elseif Ctrans==1
                    RC=RC-1;
                    if Dtrans==0
                        DR=xor(xor(DR,CR),Dtemp);
                        Dtemp=empty;
                    else
                        Dtemp=DR;
                    end
                    LD=LD+1;
                elseif Ctrans==2
                    LC=LC-1;
                    if Btrans==0
                        BR=xor(xor(BR,CR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=CR;
                    end
                    RB=RB+1;
                end
                
            elseif RC==1&&LC==1
                Ctrans=condition();
                if Ctrans==0
                    RC=RC-1;LC=LC-1;
                    if Dtrans==0
                        DR=xor(xor(DR,CR),Dtemp);
                        Dtemp=empty;
                        if Btrans==0
                            BR=xor(xor(BR,CR),Btemp);
                            Btemp=empty;
                        else
                            Btemp=CR;
                        end
                    else
                        Dtemp=CR;
                        if Btrans==0
                            BR=xor(xor(BR,CR),Btemp);
                            Btemp=empty;
                        else
                            Btemp=CR;
                        end
                    end
                    RB=RB+1;LD=LD+1;
                elseif Ctrans==1
                    RC=RC-1;
                    if Dtrans==0
                        DR=xor(xor(DR,CR),Dtemp);
                        Dtemp=empty;
                    else
                        Dtemp=DR;
                    end
                    LD=LD+1;
                elseif Ctrans==2
                    LC=LC-1;
                    if Btrans==0
                        BR=xor(xor(BR,CR),Btemp);
                        Btemp=empty;
                    else
                        Btemp=CR;
                    end
                    RB=RB+1;
                end
            end
            
            %T节点
            if Ttrans==1
                Ttrans=condition1(1);
                if Ttrans==0
                    tbegin(i)=time;
                    i=i+1;
                    LT=LT-1;
                    T2H=randi([0,1],1,data_bits);
                    TR=xor(TR,T2H);
                    if Etrans==0
                        ER=xor(xor(ER,TR),Etemp);
                        Etemp=empty;
                    else
                        Etemp=TR;
                    end
                    RE=RE+1;
                end
                
            elseif LT==1
                Ttrans=condition1(1);
                if Ttrans==0
                    tbegin(i)=time;
                    i=i+1;
                    LT=LT-1;
                    T2H=randi([0,1],1,data_bits);
                    TR=xor(TR,T2H);
                    if Etrans==0
                        ER=xor(xor(ER,TR),Etemp);
                        Etemp=empty;
                    else
                        Etemp=TR;
                    end
                    RE=RE+1;
                end
            end
            
        case 2 %A D 节点
            %A节点
            if Atrans==1
                Atrans=condition1(Atrans);
                if Atrans==0
                    LA=LA-1;
                    HR=xor(AR,H2T);
                    if ~isequal(HR,empty)&&~isequal(AR,empty)
                        output=output+1;
                        tend(j)=time;
                        j=j+1;
                    end
                    RH=RH+1;
                end
                
            elseif Atrans==2
                Atrans=condition1(Atrans);
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
                Atrans=condition();
                if Atrans==0
                    RA=RA-1;LA=LA-1;
                    HR=xor(AR,H2T);
                    if ~isequal(HR,empty)&&~isequal(AR,empty)
                        output=output+1;
                        tend(j)=time;
                        j=j+1;
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
                        tend(j)=time;
                        j=j+1;
                    end
                    RH=RH+1;
                end
                
            elseif RA==1&&LA==1
                Atrans=condition();
                if Atrans==0
                    RA=RA-1;LA=LA-1;
                    HR=xor(AR,H2T);
                    if ~isequal(HR,empty)&&~isequal(AR,empty)
                        output=output+1;
                        tend(j)=time;
                        j=j+1;
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
                        tend(j)=time;
                        j=j+1;
                    end
                    RH=RH+1;
                end
            end
            
            %D节点
            if Dtrans==1
                Dtrans=condition1(Dtrans);
                if Dtrans==0
                    LD=LD-1;
                    if Ctrans==0
                        CR=xor(xor(CR,DR),Ctemp);
                        Ctemp=empty;
                    else
                        Ctemp=DR;
                    end
                    RC=RC+1;
                end
                
            elseif Dtrans==2
                Dtrans=condition1(Dtrans);
                if Dtrans==0
                    RD=RD-1;
                    if Etrans==0
                        ER=xor(xor(ER,DR),Etemp);
                        Etemp=empty;
                    else
                        Etemp=DR;
                    end
                    LE=LE+1;
                end
                
            elseif Dtrans==3
                Dtrans=condition();
                if Dtrans==0
                    RD=RD-1;LD=LD-1;
                    if Etrans==0
                        ER=xor(xor(ER,DR),Etemp);
                        Etemp=empty;
                        if Ctrans==0
                            CR=xor(xor(CR,DR),Ctemp);
                            Ctemp=empty;
                        else
                            Ctemp=DR;
                        end
                    else
                        Etemp=DR;
                        if Ctrans==0
                            CR=xor(xor(CR,DR),Ctemp);
                            Ctemp=empty;
                        else
                            Ctemp=DR;
                        end
                    end
                    RC=RC+1;LE=LE+1;
                elseif Dtrans==1
                    RD=RD-1;
                    if Etrans==0
                        ER=xor(xor(ER,DR),Etemp);
                        Etemp=empty;
                    else
                        Etemp=ER;
                    end
                    LE=LE+1;
                elseif Dtrans==2
                    LD=LD-1;
                    if Ctrans==0
                        CR=xor(xor(CR,DR),Ctemp);
                        Ctemp=empty;
                    else
                        Ctemp=DR;
                    end
                    RC=RC+1;
                end
                
            elseif RD==1&&LD==1
                Dtrans=condition();
                if Dtrans==0
                    RD=RD-1;LD=LD-1;
                    if Etrans==0
                        ER=xor(xor(ER,DR),Etemp);
                        Etemp=empty;
                        if Ctrans==0
                            CR=xor(xor(CR,DR),Ctemp);
                            Ctemp=empty;
                        else
                            Ctemp=DR;
                        end
                    else
                        Etemp=DR;
                        if Ctrans==0
                            CR=xor(xor(CR,DR),Ctemp);
                            Ctemp=empty;
                        else
                            Ctemp=DR;
                        end
                    end
                    RC=RC+1;LE=LE+1;
                elseif Dtrans==1
                    RD=RD-1;
                    if Etrans==0
                        ER=xor(xor(ER,DR),Etemp);
                        Etemp=empty;
                    else
                        Etemp=ER;
                    end
                    LE=LE+1;
                elseif Dtrans==2
                    LD=LD-1;
                    if Ctrans==0
                        CR=xor(xor(CR,DR),Ctemp);
                        Ctemp=empty;
                    else
                        Ctemp=DR;
                    end
                    RC=RC+1;
                end
            end
            
    end
    %if mod(time,10)==0
    %    throughput(k)=output*data_bits/(time*T);
    %    k=k+1;
    %end
    shiyan=tend-tbegin+1;
    throughput=output/(time+1);
    a=shiyan(:,1:100);
    out=mean(a(:));
end
end


