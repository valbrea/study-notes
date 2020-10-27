%% ���� tau = �ӣ� NΪ���г��� ���Mackey Glass����
function[sn] = MG(tau, N)  % tau = 11 and tau = 40 
sn = [];
fsn = [];
sn(1 : tau + 1) = rand(1, tau + 1); % ��ʼ��ǰtau������

for ii = tau + 1 : N % ii - tau���Դ�tau + 1��ʼ
    fsn(ii) = 0.2 * sn(ii - tau) / (1 + sn(ii - tau) ^ 10) - 0.1 * sn(ii);
    sn(ii + 1) = sn(ii) + fsn(ii);
end

% ���1000��1500����
figure;
plot(1000 : 1500, sn(1000 : 1500));
xlabel('t'), ylabel('s(n)');
title(['Mackey-Glass Series when �� = ', num2str(tau)]);

% ��ͼ
figure;
plot(sn(1000 : 1500), sn(1000 - tau : 1500 - tau));
xlabel('s(n)'), ylabel('s(n - ��)');
title(['Phase diagram when �� = ', num2str(tau)]);
end
