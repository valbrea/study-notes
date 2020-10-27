clear all; close all;
%% 99 Nature 
% ��һ��m * n�����ݾ���ѹ��Ϊm * p + p * n������
m = 50; n = 20; p = 5;
V = rand(m, n); % ��ʵֵ
W = rand(m, p); % i*a�ľ���
H = rand(p, n); 
Num = 100;

for kk = 1: Num
    for a = 1 : p % W��P�� ��һ����ʽ ����W����
        V_tmp = W * H;
        tmp1 = V ./ V_tmp; % ����
        for ii = 1 : m
            W(ii, a) = W(ii, a) * sum(tmp1(ii, :) .* H(a, :)); % Vÿ��n��������H������ÿ��n�����ݣ������ǵ�����
        end
        
        W(:, a) = W(:, a) / sum(W(:, a)); % �ڶ�����ʽ������W����
        
        for mu = 1 : n 
            H(a, mu) = H(a, mu) * sum(W(:, a) .* tmp1(:, mu)); % ��������ʽ������H
        end
    end
    Err(kk) = norm(V - W* H);
end

figure, plot(Err);
        