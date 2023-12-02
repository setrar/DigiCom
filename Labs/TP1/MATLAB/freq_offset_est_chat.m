% Parameters
fs = 1e6;  % Sampling frequency
Ts = 1/fs;  % Sampling period
N = 1024;  % Number of samples
fc = 900e6;  % Nominal carrier frequency
delta_f_range = 7.5e3;  % Frequency offset range in Hz

% Create a signal with a frequency offset
t = (0:N-1) * Ts;
delta_f_true = 2e3;  % True frequency offset in Hz
received_signal = cos(2*pi*(fc + delta_f_true)*t);

% FFT to find spectrum
frequencies = linspace(-fs/2, fs/2, N);
spectrum = fftshift(fft(received_signal));

% Search for PSS peaks
% (Replace this part with your actual PSS detection algorithm)
[pks, locs] = findpeaks(abs(spectrum));

% Evaluate peak values for different frequency offsets
delta_f_values = linspace(-delta_f_range, delta_f_range, 100);
peak_values = zeros(size(delta_f_values));

for i = 1:length(delta_f_values)
    % Apply frequency offset to the received signal
    received_signal_offset = cos(2*pi*(fc + delta_f_values(i))*t);
    
    % FFT for the offset signal
    spectrum_offset = fftshift(fft(received_signal_offset));
    
    % Calculate peak value based on PSS index (replace with actual index)
    peak_values(i) = abs(spectrum_offset(locs(1)));  % Adjust based on your PSS index
end

% Plot the results
figure;
plot(delta_f_values, peak_values, 'LineWidth', 2);
xlabel('Frequency Offset (Hz)');
ylabel('Peak Value');
title('Frequency Offset Estimation');
grid on;

% Find the most likely frequency offset
[~, idx_max] = max(peak_values);
most_likely_offset = delta_f_values(idx_max);

disp(['Most likely frequency offset: ', num2str(most_likely_offset), ' Hz']);
