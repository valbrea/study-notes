function [ trans ] = condition1(a)
SNR=24;
SNR1=10^(SNR / 10);
data_bits=100;
BPSK=0.5 * (1 - sqrt(SNR1/ (SNR1 + 1)));
lam=1-(1-BPSK)^data_bits;
A=unifrnd(0,1);
if A<1-lam%���� 
    trans=0;   
else %ʧ��
   trans=a;
end