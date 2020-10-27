clear all; close all;
L = 2000;
p = 5;
wo = randn(p,1);
vv = randn(1,L) * 0.5;
uu = randn(p,L);
dd = wo' * uu + vv; 
% dd = wo' * uu; vv������������ʱ���ÿ���
%% wiener filter

w_wf = inv(uu * uu') * (uu * dd');
Error = norm(w_wf-wo);
%% LMS 1 �����½���
w_lms = zeros(p,1);
mu_lms = 0.01;

for ii = 1:L
    Err_lms(ii) = norm(w_lms - wo);
    en = dd(ii) - w_lms' * uu(:,ii);
    w_lms = w_lms + mu_lms * en * uu(:,ii);
end


%% LMS 2 �����ݶ�
w_lms2 = zeros(p,1);
mu_lms2 = 0.1;

for ii = 1:L
    Err_lms2(ii) = norm(w_lms2 - wo);
    en = dd(ii) - w_lms2' * uu(:,ii);%��˲ʱ�ݶȹ�����ʵ�ݶ�
    w_lms2 = w_lms2 + mu_lms2 * en * uu(:,ii);
end

%% LMS 3 �䲽��LMS
w_lms3 = zeros(p,1);
mu_lms3 = 0.1;

for ii = 1:L
    Err_lms3(ii) = norm(w_lms3 - wo);
    en = dd(ii) - w_lms3' * uu(:,ii);
    mu(ii) = mu_lms3 / round(ii/100+1);%�����ı�
    w_lms3 = w_lms3 + mu(ii) * en * uu(:,ii);
end

%% LMS 4 ��һ��LMS��NLMS��
w_lms4 = zeros(p,1);
mu_lms4 = 0.1;

for ii = 1:L
    Err_lms4(ii) = norm(w_lms4 - wo);
    en = dd(ii) - w_lms4' * uu(:,ii);
    w_lms4 = w_lms4 + mu_lms4 * en * uu(:,ii) / (uu(:,ii)' * uu(:,ii));%��һ��
end

%% LMS 5 �����LMS
w_lms5 = zeros(p,1);
mu_lms5 = 0.1;
Err_lms5 = norm(w_lms5 - wo);
for ii = 2:L
    Err_lms5(ii) = norm(w_lms5 - wo);
    en = dd(ii) - w_lms5' * uu(:,ii);
    alpha = uu(:,ii-1)' * uu(:,ii) / (uu(:,ii-1)' * uu(:,ii-1));%���ϵ��
    vn = uu(:,ii) - alpha * uu(:,ii-1);%����غ����������
    w_lms5 = w_lms5 + mu_lms5 * en * vn;
end

figure, hold on;
plot (Err_lms, 'r');
plot (Err_lms2, 'g');
plot (Err_lms3, 'b');
plot (Err_lms4, 'k');
plot (Err_lms5, 'c');

legend('LMS','LMS2','LMS3','LMS4','LMS5');

figure;
plot (mu, 'b');
legend('mu');