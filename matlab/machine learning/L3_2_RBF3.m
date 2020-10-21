clear all; close all;
X = -1 : 0.1 : 1; %��֪X��D����c���ҡ�w
% ���Ч�����ÿ��Կ�������X���������߸ı�ѵ��������������������������Ȳ�������֮RBF�����ܺ����ƽ���
D= sin(X * 10) + cos(X * 5 + randn * 10 ) + tanh (X * 3 + randn * 6);
D = sin(X * 4) + cos(X * 5) + tanh(X * 3); % Ŀ�꺯��

X = [1 0 0 1; 1 0 1 0]; % ������Դ����������
D = [0 0 1 1]

L = length(D); % ���ݳ���
m = 30; % ���������
n = size(X,1);
c = rand(n,m) * 2 - 1; % c��ά����Ϊn
a = ones(1,m) * 2; % ��ȡ1����2
w = randn(m + 1,1); % Ȩֵ��m���� + ƫ��
h = zeros(m + 1,1); % �м���ֵ

Num = 200; % ѵ������
mu1 = 0.1 ; mu2 = 0.5 ; mu3 = 0.1; % ���� ���⣨Ҫ������ֵ��������������
%% TRAINING ѵ������
for kk = 1 : Num % ѵ��200��
    for ii = 1 : L % L�����ݽ���ѵ��
        x = X(:, ii); % ��֪����X�����������D
        d = D(ii);
        for jj = 1 : m % ��֪h���ʽ ����˹�˺�����
            h(jj) = exp( - ( x - c(:, jj) )' * (x - c(:, jj) ) * a(jj)^2); % c(:, jj)��ʾc�ĵ�jj��
        end
        h(m + 1) = 0; % h���һ��ƫ��
        y(ii) = w' * h;
        e = d - y(ii); % �����
        w = w + mu1 * e * h; % ��w���и���
        for jj = 1 : m % ��ÿһ��c�ͦҽ��и���
            c(:,jj) = c(:,jj) + mu2 * e * w(jj) * h(jj) * ( x - c(:,jj) ); 
            a(jj) = a(jj) - mu3 * e * w(jj) * h(jj) * ( x - c(:, jj))' * (x - c(:, jj) ) * a(jj);
        end
    end
    Err(kk) = norm(D - y); % ÿһ��ѵ���Ľ��
end

%% TESTING ���Թ���
for ii = 1 : L
    x = X(:, ii);
    for jj = 1 : m
        h(jj) = exp( - ( x - c(:, jj) )' * (x - c(:,jj) )  * a(jj)^2);
    end
    h(m + 1) = 0; % ƫ��Ϊ1
    y(ii) = w' * h;
end
    
figure, hold on;
plot(X, D, 'bo');
plot(X, y, 'r*');
legend('REAL','TRAIN');
figure,plot(Err);