% Assuming you have rxsig4_noiseandchannel as the received signal

% Received signal parameters
rx_signal = rxsig4_noiseandchannel;
N_received = length(rx_signal);

% Frequency-domain correlation with Zadoff-Chu sequences
corr_result1 = ifft(fft(rx_signal) .* conj(fft(xu1_49152)));
corr_result2 = ifft(fft(rx_signal) .* conj(fft(xu2_49152)));
corr_result3 = ifft(fft(rx_signal) .* conj(fft(xu3_49152)));

% Find the peak correlation for each sequence
[~, idx1] = max(abs(corr_result1));
[~, idx2] = max(abs(corr_result2));
[~, idx3] = max(abs(corr_result3));

% Estimated time delays
estimated_delay1 = idx1 - 1;
estimated_delay2 = idx2 - 1;
estimated_delay3 = idx3 - 1;

% Display the estimated time delays
fprintf('Estimated Time Delay for Sequence 1: %d samples\n', estimated_delay1);
fprintf('Estimated Time Delay for Sequence 2: %d samples\n', estimated_delay2);
fprintf('Estimated Time Delay for Sequence 3: %d samples\n', estimated_delay3);
