% ˼·�� ��ÿ����ֱ����ô����־����¼ÿ�εĴ��ͳɹ���ʧ�ܣ������յ�ʱ�������б�־�� ��ͳ����Ч������
function [ valid_throughput ] = A3Network6 (SNR, slot)
%���ݰ�����
data_bits=8472;
%ÿ���ڵ�ĳ�ʼ����Ϊ��
AR=zeros(1,data_bits);
BR=zeros(1,data_bits);
CR=zeros(1,data_bits);
DR=zeros(1,data_bits);
%�׽ڵ���ĩ�ڵ����յ��ĳ�ʼ����Ϊ��
HR=zeros(1,data_bits);
TR=zeros(1,data_bits);
H2T=zeros(1,data_bits);
T2H=zeros(1,data_bits);
Htemp = zeros(1,data_bits);
Ttemp = zeros(1,data_bits);
%��������
throughput = zeros(1, slot);
valid_throughput = zeros(1, slot);
output = 0; % �������
% ÿ�δ�����������
left_error = 0; % �󴫴�������
right_error = 0;
valid = 0; % ��Ч���
empty=zeros(1,data_bits);%����
% �����־ �ɹ�0 ��1 ��2 ��3
FLAG = zeros(1, 6); % 6���ڵ�012345�Ĵ����־����
for i = 1 : 6
    
end
for time=1:slot %����ʱ��
    type=mod(time,3); %�������еĽڵ��Ϊ����
    switch type
        case 0 %��2 5���ڵ㷢������
            % B�ڵ㷢��
            AR=xor(AR,BPSK(SNR, BR)); % B��A��
            CR=xor(CR,BPSK(SNR, BR)); % B��C��
            FLAG(3) = TRANS2(SNR, BR);
        
            % T�ڵ㷢��
            T2H=randi([0,1],1,data_bits); % ÿ�η���ǰ���������Y1��Y2��Y3���ݰ�
            DR=xor(DR,BPSK(SNR, T2H)); % T��D��
            FLAG(6) = TRANSL(SNR, T2H);
            TR = xor(T2H, TR); % �˽ڵ�ÿ�δ���ǰ ���TB��PB������PB��
            
        case 1 %��0 3���ڵ㷢������
            % H�ڵ㷢��
            H2T = randi([0,1],1,data_bits); % ÿ�η���ǰ���������X1��X2��X3���ݰ�
            AR = xor(AR, BPSK(SNR, H2T));
            FLAG(1) = TRANSR(SNR, BR);
            HR = xor(H2T, HR); % �˽ڵ�ÿ�δ���ǰ ���TB��PB������PB�� 

            % C�ڵ㷢��
            BR=xor(BPSK(SNR, CR), BR);
            DR=xor(BPSK(SNR, CR), DR);
            FLAG(4) = TRANS2(SNR, CR);
        case 2 %��1 4���ڵ㷢������
            % A�ڵ㷢��
            BR=xor(BR, BPSK(SNR, AR));
            Htemp = xor(HR, BPSK(SNR, AR)); % H���յ��İ���HR�������
            FLAG(2) = TRANS2(SNR, AR);
            if ~isequal(AR, empty) && ~isequal(Htemp, empty) % ������յ��İ���HR����Ϊ��
                output = output + 1; % �ݽ�XOR�Ľ�����ϲ�Э�飨���+1)
                % ���H�ڵ��յ��İ���������������Ƿ��д�
                for i = 1 : 1 : 6
                    switch FLAG(i) 
                        case 2 % ������д�(case2) ����+1(��ڵ����ֻ����һ�Σ�
                            left_error = 1; 
                            FLAG(i) = 0;
                        case 3 % �����˫����� ���ִ���+1 
                            left_error = 1;
                            right_error = 1;
                            FLAG(i) = 0; % �����ظ����� һ��Ҫ����
                    end
                end
                valid = valid + 1 - left_error;% ֻ�۳������� �Ҳ�����Ѿ���������������T�ڵ���յ�ʱ����ͳ�ƣ�
                left_error = 0; % ֻ����������
            end
            HR = BPSK(SNR, AR); % ��HR���³�������յ��İ�
            AR = empty; % A�ڵ㷢�ͺ�PB���
            % D�ڵ㷢��
            CR=xor(CR, BPSK(SNR, DR));
            Ttemp = xor(TR, BPSK(SNR, DR));
            FLAG(5) = TRANS2(SNR, DR);
            if ~isequal(DR, empty) && ~isequal(Ttemp, empty)
                output = output + 1;
                % ���T�ڵ��յ��İ������Ҵ���������Ƿ��д�
                for i = 1 : 1 : 6
                    switch FLAG(i) 
                        case 1 % ����Ҵ��д�(case1) ����+1(��ڵ����ֻ����һ�Σ�
                            right_error = 1; 
                            FLAG(i) = 0;
                        case 3 % �����˫����� ���ִ���+1 
                            left_error = 1;
                            right_error = 1;
                            FLAG(i) = 0; % �����ظ����� һ��Ҫ����
                    end
                end
                valid = valid + 1 - right_error;
                right_error = 0; % ֻ�����Ҳ����
            end
            TR = BPSK(SNR, DR);
            DR = empty; % D���ͺ�PB���
    end
    throughput(time) = output / (time + 1);
    valid_throughput(time) = valid / (time + 1);
    
end
% figure, hold on;
% plot(throughput, 'r');
% plot(valid_throughput, 'b');
% % xlabel('timeslot'), ylabel('throughput');
end