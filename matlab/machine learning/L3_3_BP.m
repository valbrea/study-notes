clear all; close all;
% BP algorithm
X = -1 : 0.05 : 1;

n = size(X, 1);
L = size(X, 2);
D = sin(X * 4) + cos(X * 5) + tanh (X * 3); % �����Ժ���������ӳ���Ϊ���Թ�ϵ
D = D/6 + 0.5; % ע��Ҫ��һ����f(z)�����һ����[0, 1]֮�䣬���򲻻�����
 % �������᷶Χ��-3��3�����Գ���6����-0.5��0.5��+0.5��0��1
 
Num = 50000;
mu1 = 3; mu2 = 1; mu3 = 2; mu4 = 3;
m = 20;
W1 = randn(m, n); b1 = randn(m, 1);
W2 = randn(1, m); b2 = randn(1);

%% BP training
for kk = 1 : Num
    for ii = 1 : L
        x = X(:, ii);
        z2 = W1 * x + b1;
        a2 = 1 ./ (1 + exp(-z2)); % �����y = 1 ./ (1 + exp(-z))
        z3 = W2 * a2 + b2;
        y(ii) = 1 ./ (1 + exp(-z3));
        d = D(ii);
        e = d - y(ii);    
        Jb1 = e * y(ii) * (1 - y(ii)); %������ĵ��� y * (1 - y)
        b2 = b2 + mu4 * Jb1;
        W2 = W2 + mu3 * Jb1 * a2';
        Jb2 = W2' .* a2 .* (1 - a2);
        b1 = b1 + mu2 * Jb1 * Jb2;
        W1 = W1 + mu1 * Jb1 * Jb2 * x';
        
    end
    Err(kk) = norm(y - D);
end

figure, hold on;
plot(D,'r'), plot(y,'b');
legend('�������', 'ʵ�����');
figure, plot(Err);