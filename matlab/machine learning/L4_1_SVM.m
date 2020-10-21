%% SVM ֧��������
 % ��֧���������У����볬ƽ�������������һ�������ļ���ѵ�������㱻��Ϊ֧��������
clear all; close all;
m = 4;
x = [0, 1, 2, 0; 0, 0, 0, 2];
y = [1, 1, -1, -1];
H = zeros(m);
for ii = 1 : m
    for jj = 1 : m
        xi = x(:, ii);
        xj = x(:, jj);
        yi = y(ii);
        yj = y(jj);
        H(ii,jj) = H(ii, jj) + yi * yj * xi' * xj; % Hesse����
    end
end
f = -[1; 1; 1; 1]; % Ŀ�꺯������-�����ű�ʾ�����
Aeq = [1, 1, -1, -1];
beq = 0;
lb = zeros(m, 1);
xval = quadprog(H, f, [], [], Aeq, beq, lb, []) % A bû�У����š�
% quadprog()�Ƕ��ι滮�������ο�matlab����

% figure, hold on;
% plot(x(1, 1 : 2), x(2, 1:2), 'ro');
% plot(x(1, 3 : 4), x(2, 3:4), 'b');



