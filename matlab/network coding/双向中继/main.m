function main(slot)
A1_throughput = zeros(1, slot);
figure, hold on;
for time = 1 : 1 : slot
    throughput = output/(time+1);
    A1_throughput(time) = A1Noerror6 (time);
    plot (time, A1_throughput);
end

end

