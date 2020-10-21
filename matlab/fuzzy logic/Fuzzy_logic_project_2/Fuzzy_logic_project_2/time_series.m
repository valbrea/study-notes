%series tao=11
tao=11;
s_t = rand(1,tao+1); %�������tao+1�����ݣ�����������Ϊ��ʼֵ
n = 2000;
f_s_n = []; %����Ϊs(n)��ʱ��t�ĵ���
s_n = []; %����ʱ������s(n)
s_n(1:tao+1) = s_t; %�ó�ʼֵ������ƽ����ʱ���������ڽ�������Ԥ��
s = 1; %��¼�ڼ���s(n)�ĵ���
for i = tao+1:n %��ʼԤ��
    f_s_n(s) = 0.2*s_n(i-tao) / (1+s_n(i-tao)^10) - 0.1*s_n(i); %Mackey-Glass equation
    s_n(i+1) = s_n(i) + f_s_n(s);   
    s = s+1;
end
figure;
plot(1000:1500,s_n(1000:1500));
%axis([1000,1500,0.5,1.3])
title('time series with tao=11');

figure,
plot(s_n(1000:1500),s_n(1000-tao:1500-tao));
title('phase for tao=11');
xlabel('s(t)');ylabel('s(t-d)');
