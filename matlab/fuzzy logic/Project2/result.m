%% ����ͻ�ͼ
initial_values
final_values = [mean_SD, ybar_SD] % ����centers & ybar��
final_sigmas = sigma_SD % ����std��

figure, hold on;
plot(1 : 6, RMSE_OP * ones(1, 6));
plot(1 : 6, RMSE_SD);
legend('one pass', 'steepest descent');
title('RMSE');