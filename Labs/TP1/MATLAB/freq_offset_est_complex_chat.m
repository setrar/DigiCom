% Parameters
fs = 1e6;  % Sampling frequency
Ts = 1/fs;  % Sampling period
N = 1024;  % Number of samples
fc = 900e6;  % Nominal carrier frequency
delta_f_range = 7.5e3;  % Initial frequency offset range in Hz

% Create a complex signal with a frequency offset
t = (0:N-1) * Ts;
delta_f_true = 2e3;  % True frequency offset in Hz
received_signal_complex = exp(1i*2*pi*(fc + delta_f_true)*t);

% Initial search range
search_range = [-delta_f_range, delta_f_range];
resolution_threshold = 1e-2;  % Adjust as needed

while (search_range(2) - search_range(1)) > resolution_threshold
    % Compute peaks for the current search range
    delta_f_values = linspace(search_range(1), search_range(2), 100);
    peak_values = zeros(size(delta_f_values));
    
    for i = 1:length(delta_f_values)
        % Apply frequency offset to the received signal
        received_signal_offset = exp(1i*2*pi*(fc + delta_f_values(i))*t);
        
        % FFT for the offset signal
        spectrum_offset = fftshift(fft(received_signal_offset));
        
        % Calculate peak value based on PSS index (replace with actual index)
        peak_values(i) = abs(spectrum_offset(locs(1)));  % Adjust based on your PSS index
    end
    
    % Find the maximum peak and refine search range
    [~, idx_max] = max(peak_values);
    max_offset = delta_f_values(idx_max);
    
    % Refine the search range
    search_range = [max_offset - delta_f_range, max_offset + delta_f_range];
end

% Most likely frequency offset
most_likely_offset = (search_range(1) + search_range(2)) / 2;

disp(['Most likely frequency offset: ', num2str(most_likely_offset), ' Hz']);
