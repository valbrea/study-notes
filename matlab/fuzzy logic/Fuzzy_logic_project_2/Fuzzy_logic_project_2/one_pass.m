%one pass method
% Gaussian MFs, 4 antecedents, 
% height defuzzifier, 
% product t-norms based on the Mackey-Glass chaotic time series in 1. with tao=40.
% Samples 1001-1504 are for training, 
% and samples 1505-2000 are for testing. 
train_data_start = 1001;
train_data_end = 1504;
test_data_start = 1505;
test_data_end = 2000;
train_data_num = 504;
test_data_num = 496;
p = 4;

%rule
train_data_pairs = zeros(train_data_num-p,5);
rule_no = 1;
for i = train_data_start:train_data_end-p %��1001~1504�Ĺ�504����������ѵ��
    train_data_pairs(rule_no,:) = s_n(i:i+p); %5������һ��rule����ʽ������ѵ������
    rule_no = rule_no + 1;
end
%test_data_pairs
test_data_pairs = zeros(test_data_num-p,5);
test_pair_no = 1;
for i = train_data_end-p+1:test_data_end-p %��1505~2000�Ĺ�496����������ѵ��
    test_data_pairs(test_pair_no,:) = s_n(i:i+p);
    test_pair_no = test_pair_no + 1;
end

% M, sigma are mxn matrix denotes the mean and std of antecedent Gaussian MFs (m rules, with n antecedent in each rule)
% C is mx1 vector, which denotes the height of consequents
% X is input matrix, Lxn matrix, each row is an input.
M = train_data_pairs(:,1:p); %ǰ�ĸ�Antecedent�ĸ��Եľ�ֵ��ÿ��rule���ĸ�
sigma = zeros(500,p);
sigma(:,:) = 0.1; %������׼��Ϊ0.1����page191
C = train_data_pairs(:,p+1);
X = test_data_pairs(:,1:p);

output = sfls_type1(M,sigma,C,X);
Err = test_data_pairs(:,p+1) - output';
Err_square = Err.* Err;
RMSE = sqrt(1/496 * sum(Err_square))