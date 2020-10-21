close all;
clear all;
% BP algorithm
X=-1:0.05:1;
% X = -2: 0.1:2;
n = size(X,1);
L = size(X,2);
% D=[-0.9602,-0.5770,-0.0729,0.3771,0.6405,0.66,0.4609,0.1366,-0.2013 -0.4344,-0.5,-0.393,-0.1647,0.0988,0.3072,0.396,0.3449,0.1816,-0.0312,-0.2183,-0.3201];
% D=sin(X*5+randn(1,L)*0.0)+1;

D = sin(X* 4) + cos(X* 5) + tanh(X*3 );
%������ǵ�1֮�䣬�������������Χһ��Ҫ��һ������Ȼ�㷨��������
%��������޶���Χ������1�����û�ˣ�D��������
% D = sin(4*X) + cos(5*X+rand(1,L)*0.0) + tanh(6 *X);

D = D/6 +0.5; %% [0 1]
%�������᷶Χ��-3��3�����Գ���6����-0.5��0.5��+0.5��0��1

Num = 20000;
mu1 = 0.5; mu2 = 0.5; mu3 = 2; mu4 = 3;
m = 30;
W1 = randn(m,n); b1 = randn(m,1);
W2 = randn(1,m); b2 = randn(1);

%% BP training
% �����в������г�ʼ��
for kk =1: Num
    for ii=1:L
        x = X(:,ii);       
        z2 = W1 * x + b1;
        a2 = 1 ./(1 + exp(-z2));
        z3 = W2 * a2 + b2;
        y(ii) = 1 ./(1 + exp(-z3)); 
        d = D(ii);
        e = d - y(ii);
        %
        Jb1 = e * y(ii) * (1 - y(ii));
        b2 = b2 + mu4 * Jb1;
        W2 = W2 + mu3 * Jb1 * a2';
        Jb2 = W2' .* a2 .* (1 - a2);
        b1 = b1 + mu2 * Jb1 * Jb2;
        W1 = W1 + mu1 * Jb1 * Jb2 * x';
    end
    Err(kk) = norm(y-D); % ÿ��ѵ����������
end

figure,plot(Err);
figure,hold on
plot(D,'r');
plot(y,'b');