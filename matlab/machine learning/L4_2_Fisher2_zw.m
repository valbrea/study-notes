%Fisher������
clear all;
close all;
%��200����
L=200;
m=2;
%��������
X=rand(2,L)*6;%��Χ0��6
%X�ֳ���������
for ii=1:L
    if ii > L/2
        X(:,ii)=randn(m,1)+[12;2];%ѡ12 2������
    else
        X(:,ii)=randn(m,1)+[2;-6];%ѡ2 -6Ϊ����
    end
end
X1=X(:,1:L/2);
X2=X(:,1+L/2:end);

%��ֱ������ͶӰ���
%1.����������
m1=mean(X1')';
m2=mean(X2')';
%2.����Sd
Sd=(m1-m2)*(m1-m2)';
%3.����Ss
Ss=zeros(m);
for ii= 1:L/2
    x1=X1(:,ii);
    x2=X2(:,ii);
    Ss=Ss+(x1-m1)*(x1-m1)'+(x2-m2)*(x2-m2)';
end
%4.����ֵ�ֽ�
[U1,lamda]=eig(inv(Ss)*Sd);
%�������ֵ������������
w1=U1(:,1);%�����������
%����x����-2��16����ͶӰ�ӿռ�A��w1��ΪͶӰ�ӿռ�
A=w1;
%X1���ӿռ������ͶӰP1
P1=A*inv(A'*A)*A'*X1;
P2=A*inv(A'*A)*A'*X2;
%5.��ͶӰ��ֱ��
x=-6:0.1:16;
y=A(2)/A(1)*x;

figure
hold on
plot(X1(1,:),X1(2,:),'r*')
plot(P1(1,:),P1(2,:),'ro')
plot(x,y,'b')
plot(X2(1,:),X2(2,:),'k*')
plot(P2(1,:),P2(2,:),'ko')
axis([-6 16 -10 12])