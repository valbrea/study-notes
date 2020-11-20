% ˼·2�� N = 4��ʱ϶���յ����ݰ�������Ƿ�ͷ���������ȣ��������Ч������+1
function [ valid_throughput ] = A3Network6_v2 (SNR, slot)
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
% ���ջ���
Hreceive = zeros(1,data_bits); 
Treceive = zeros(1,data_bits);
% ��������
Hsend = zeros(slot + 4, data_bits);
Tsend = zeros(slot + 4, data_bits);
%��������
throughput = zeros(1, slot);
valid_throughput = zeros(1, slot);
output = 0; % �������
% % ÿ�δ�����������
% left_error = 0; % �󴫴�������
% right_error = 0;
valid = 0; % ��Ч���
empty=zeros(1,data_bits);%����
% % �����־ �ɹ�0 ��1 ��2 ��3
% FLAG = zeros(1, 6); % 6���ڵ�012345�Ĵ����־����
for i = 1 : 6
    
end
for time=1:slot %����ʱ��
    type=mod(time,3); %�������еĽڵ��Ϊ����
    switch type
        case 0 %��2 5���ڵ㷢������
            % B�ڵ㷢��
            AR=xor(AR,BPSK(SNR, BR)); % B��A��
            CR=xor(CR,BPSK(SNR, BR)); % B��C��
%             FLAG(3) = TRANS2(SNR, BR);
        
            % T�ڵ㷢��
            T2H=randi([0,1],1,data_bits); % ÿ�η���ǰ���������Y1��Y2��Y3���ݰ�
            Tsend(time + 4, :) = T2H;
            DR=xor(DR,BPSK(SNR, T2H)); % T��D��
%             FLAG(6) = TRANSL(SNR, T2H);
            TR = xor(T2H, TR); % �˽ڵ�ÿ�δ���ǰ ���TB��PB������PB��
            
        case 1 %��0 3���ڵ㷢������
            % H�ڵ㷢��
            H2T = randi([0,1],1,data_bits); % ÿ�η���ǰ���������X1��X2��X3���ݰ�
            Hsend(time + 4, :) = H2T;
            AR = xor(AR, BPSK(SNR, H2T));
%             FLAG(1) = TRANSR(SNR, BR);
            HR = xor(H2T, HR); % �˽ڵ�ÿ�δ���ǰ ���TB��PB������PB�� 

            % C�ڵ㷢��
            BR=xor(BPSK(SNR, CR), BR);
            DR=xor(BPSK(SNR, CR), DR);
%             FLAG(4) = TRANS2(SNR, CR);
        case 2 %��1 4���ڵ㷢������
            % A�ڵ㷢��
            BR=xor(BR, BPSK(SNR, AR));
            Hreceive = xor(HR, BPSK(SNR, AR)); % H���յ��İ���HR�������
%             FLAG(2) = TRANS2(SNR, AR);
            if ~isequal(AR, empty) && ~isequal(Hreceive, empty) % ������յ��İ���HR����Ϊ��
                output = output + 1; % �ݽ�XOR�Ľ�����ϲ�Э�飨���+1)
                if isequal(Tsend(time, :), Hreceive)
                    valid = valid + 1;
                end
            end
            HR = BPSK(SNR, AR); % ��HR���³�������յ��İ�
            AR = empty; % A�ڵ㷢�ͺ�PB���
            % D�ڵ㷢��
            CR=xor(CR, BPSK(SNR, DR));
            Treceive = xor(TR, BPSK(SNR, DR));
%             FLAG(5) = TRANS2(SNR, DR);
            if ~isequal(DR, empty) && ~isequal(Treceive, empty)
                output = output + 1;
                if isequal(Hsend(time, :), Treceive)
                    valid = valid + 1;
                end
            end
            TR = BPSK(SNR, DR);
            DR = empty; % D���ͺ�PB���
    end
    throughput(time) = output / (time + 1);
    valid_throughput(time) = valid / (time + 1);
    
end
figure, hold on;
plot(throughput, 'r--');
plot(valid_throughput, 'b--');
xlabel('timeslot'), ylabel('throughput');
end