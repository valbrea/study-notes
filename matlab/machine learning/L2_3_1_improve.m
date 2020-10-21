clear all; close all;
%% d = w'* u + v  ���w����ʵ������Ҫ��hermit������ת��
L = 2000;
p = 5;
wo = randn(p,1);
vv = randn(1,L) * 0.5;
% vv = rand(1,L);
% vv = vv - mean(vv);
% v1 = randn(1,L) * 0.1;
% v2 = randn(1,L);
% numa = randn(1,L);
% for ii = 1:L%������
%     if numa(ii) > 0.1
%         vv(ii) = v1(ii);
%     else
%         vv(ii) = v2(ii);
%     end
%     end
uu = randn(p,L);
dd = wo' * uu + vv; 
%% MSE mean squared error ��С������
mu = 0.01;
w_MSE = randn(p,1);
for ii = 1:L
    Err_MSE(ii) = norm(wo - w_MSE);
    en = dd(ii) - w_MSE'* uu(:,ii);
    w_MSE = w_MSE + mu * en * uu(:,ii);%Ϊʲô��uu(:,ii) ����size(uu)����5 * 2000 ÿ�θ�һ��5 * 1�����飬һ��2000�Ρ�
end                                    %d = w'* u + v ÿһ�ε�u��һ��5 * 1�����顣uu(:,1)���ǵ�һ�ε�����

%% LMF least mean forth ��С�Ľ׾�
mu = 0.01;
w_LMF = randn(p,1);
for ii = 1:L
    Err_LMF(ii) = norm(wo - w_LMF);
    en = dd(ii) - w_LMF'* uu(:,ii);
    w_LMF = w_LMF + mu * en^3 * uu(:,ii);
end
%���ڷ��ȱȽ�С������Ч���ȽϺã�����
%vv = rand(1,L);
%vv = vv - mean(vv);
%kurtosis��˹=3���Ͷȣ�
%�����Ͷ�>3�ĳ���˹������ǰ���ַ���������
%% MCC max correntropy criterion ��������
%��ΪĿ�꺯���Ǽ�������eԽС��exp��һ��Խ��������Ŀ�꺯��ֵ�������
mu = 0.05;
sigma = 2;
w_MCC = randn(p,1);
for ii = 1:L
    Err_MCC(ii) = norm(wo - w_MCC);
    en = dd(ii) - w_MCC'* uu(:,ii);
    w_MCC = w_MCC + mu * exp(-en^2/(2 * sigma^2)) * en * uu(:,ii);
end
%% RLS Recursive least square �ݹ���С����
P = eye(p);
lamda = 1;
w_RLS = zeros(p,1);
for ii = 1:L
    Err_RLS(ii) = norm(wo - w_RLS);
    en = dd(ii) - w_RLS'* uu(:,ii);
    kk = P * uu(:,ii)/(lamda + uu(:,ii)' * P * uu(:,ii));
    P = (1/lamda) * (P - kk * uu(:,ii)' * P);
    w_RLS = w_RLS + kk * en;
end
figure, hold on;
plot(Err_MSE, 'r');
% plot(Err_LMF, 'g');
% plot(Err_MCC, 'b');
plot(Err_RLS, 'k');
% legend('MSE','LMF','MCC','RLS');
legend('MSE','RLS');