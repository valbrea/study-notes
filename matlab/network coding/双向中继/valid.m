% 计算有效吞吐量
function valid(SNR, slot)
loop = 50;

A2_valid_throughput = zeros(loop, slot);
A3_valid_throughput = zeros(loop, slot);
DFNC4_valid_throughput = zeros(loop, slot);
SNC4_valid_throughput = zeros(loop, slot);

A2_valid_mean = zeros(1, slot);
A3_valid_mean = zeros(1, slot);
DFNC4_valid_mean = zeros(1, slot);
SNC4_valid_mean = zeros(1, slot);
for i = 1 : 1 : loop
    A2_valid_throughput(i, :) = A2Network6(SNR, slot);
    A3_valid_throughput(i, :) = A3Network6 (SNR, slot);
%     A3_valid_throughput(i, :) = A3Network6_v2 (SNR, slot);
    DFNC4_valid_throughput(i, :) = DFNC4(SNR, slot);
    SNC4_valid_throughput(i, :) = SNC4(SNR, slot);
end

A2_valid_mean = mean(A2_valid_throughput);
A3_valid_mean = mean(A3_valid_throughput);
DFNC4_valid_mean = mean(DFNC4_valid_throughput);
SNC4_valid_mean = mean(SNC4_valid_throughput);

figure, hold on;
plot (A2_valid_mean);
plot (A3_valid_mean);
plot (DFNC4_valid_mean);
plot (SNC4_valid_mean);
legend('A2\_valid', 'A3\_valid', 'DFNC4\_valid', 'SNC4\_valid');
xlabel('Timeslot');
ylabel('Valid\_Throughput');
title(['SNR=', num2str(SNR), ', loop=', num2str(loop)]);
end

