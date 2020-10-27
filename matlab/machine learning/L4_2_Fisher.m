clear all, close all;
%% ��������ĳ��ֱ���ϵ�ͶӰ
L = 200; % ��������ֲ���һ������
X = rand(2, L) * 6;
X(1,:) = X(1,:) + 4;
X(2,:) = X(2,:) - 4;

x = -5 : 0.5 : 5; % ������һ��ֱ��
y = 2 * x; 
A = [1; 2]; 

p = A * inv(A' * A) * A' * X; % ������ֱ���ϵ�ͶӰ
% A = A / norm(A);
%���Է�����A' * A=1����p=A * A' * X, A * A'�Ǹ�����


figure, hold on;
plot(x, y, 'r');
plot(X(1,:), X(2,:), '*');
plot(p(1,:), p(2,:), 'o');
axis([-10, 10, -10, 10]);