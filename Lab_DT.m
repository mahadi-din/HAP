SNRdb=0:1:16;
SNR=10.^(SNRdb/10);
Pe_bpsk=0.5*erfc(sqrt(SNR));
Pe_bfsk=0.5*erfc(sqrt(SNR/2));
semilogy(SNRdb,Pe_bpsk,'g');         % for base 10 scale in y exis
hold on;
semilogy(SNRdb,Pe_bfsk,'r');
grid on;
title('Bit Error Rate curve for BPSK and BFSK')
xlabel('SNR values in db')
Ylabel('Bit Error Rate')