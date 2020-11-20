% �㷨1���۱���������
function [throughput] = A1TheoreticalSaturatedThroughput (time)

    N = 4; %�м̽ڵ����

    Tr = mod(N + 1, 3) + 2 * N;

    if 0 <= time && time < N
        throughput = 0;
    elseif N <= time && time < Tr
        throughput = (1 + fix((time - N) / 3)) / (time + 1);
    elseif time >= Tr
        throughput = (2 + fix((time - N) / 3) + fix((time - Tb) / 3)) / (time + 1);
    end

end
