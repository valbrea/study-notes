%% ��2 ��������
clear all; close all;
L = 1000;
N = 2;%2�ֿ���
m = 6;%ά��m���6
X = [[-1 1 -1 1]',[1 1 -1 1]'];
X = [rand -rand,%randnҲһ����randn����������
    -rand rand,
    rand -rand,
    -rand rand,
    rand -rand,
    1 1];%����
D = [1 0];%��������ʵֵ��
w = randn(m,1);%��ʼȨֵ�������
mu = 10;%�ı䲽�� �����ʺϴ󲽳�����Ϊ���ᷢɢ

for kk = 1:L%ѵ��
    for ii = 1:N
        x = X(:,ii);
        z = w' * x;
        fz = 1 /(1 + exp(-z));
        d = D(ii);
        e = d - fz;
        w = w + mu * e * fz * (1 - fz) * x;
    end
    Err(kk) = norm(e);
end
    
    
for ii = 1:N %δ����ѵ��
    x = X(:,ii);
    z = w' * x;
    fz(ii) = 1 /(1 + exp(-z));
end

figure,plot(Err);
figure, hold on;
plot(D,'ro');plot(fz,'g*');
legend('REAL','TRAIN');

