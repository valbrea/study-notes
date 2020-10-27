%% SVM ֧��������
 % �����Է��࣬ʹ�ú˺���
clear all; close all;
m = 5;
x = [1, 2, 4, 5, 6];
y = [1, 1, -1, -1, 1];
H = zeros(m);
for ii = 1 : m
    for jj = 1 : m
        xi = x(:, ii);
        xj = x(:, jj);
        yi = y(ii);
        yj = y(jj);
        H(ii,jj) = H(ii, jj) + yi * yj * (xi' * xj + 1)^2; % (xi' * xj + 1)^2�Ǻ˺���
    end
end
f = -[1; 1; 1; 1; 1]; % Ŀ�꺯������-�����ű�ʾ�����
Aeq = [1, 1, -1, -1, 1];
beq = 0;
lb = zeros(m, 1);
xval = quadprog(H, f, [], [], Aeq, beq, lb, []) % A bû�У����š�
% quadprog()�Ƕ��ι滮�������ο�matlab����