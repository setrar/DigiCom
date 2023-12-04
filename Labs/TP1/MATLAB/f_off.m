function squared_magnitude_Y = calculate_squared_magnitude_Y(delta_f_min, fs, n_values, x_i, y, Nf, m)
    % Initialize Y to zero
    Y = zeros(size(m));

    % Iterate over each term in the summation
    for n = 0:N_pss
        % Calculate the complex exponential term
        exponential_term = exp(-2*pi*1i*m*n*delta_f_min/fs);

        % Calculate the complex conjugate of xi
        x_i_conjugate = conj(x_i);

        % Calculate Y for the current term and accumulate
        Y = Y + exponential_term .* x_i_conjugate .* y(n_values + Nf);
    end

    % Calculate the squared magnitude of Y
    squared_magnitude_Y = abs(sum(Y))^2;
end


% Parameters
delta_f_min = 15e3;  % Minimum frequency offset in Hz
fs = 61.44e6;  % Sampling frequency in Hz
N_pss = 127;  % Number of PSS symbols

% Other relevant parameters (adjust as needed)
Nf = 0;  % Example value for Nf
m = 0;   % Example value for m

load('rxsignal_withchannelandfreqoff.mat')

received_signal = rxs3;

num_samples = length(received_signal);
n_values = (0:num_samples-1) / fs;


% Frequency range with 100 Hz steps and a ±7.5kHz window
frequency_range = -7.5e3:100:7.5e3;

% Initialize arrays to store results
peak_values = zeros(size(frequency_range));

% Iterate over each frequency offset
for idx = 1:length(frequency_range)
    % Calculate the squared magnitude of Y for the current frequency offset
    squared_magnitude_Y = calculate_squared_magnitude_Y(delta_f_min + frequency_range(idx), fs, n_values, x_i, y, Nf, m);

    % Store the peak value in the array
    peak_values(idx) = squared_magnitude_Y;
end

% Find the frequency offset with the highest peak value
[max_peak_value, max_peak_index] = max(peak_values);

% Most likely frequency offset
most_likely_frequency_offset = delta_f_min + frequency_range(max_peak_index);

% Plot the results
figure;
plot(frequency_range, peak_values, '-o');
xlabel('Frequency Offset (Hz)');
ylabel('Squared Magnitude of Y');
title('Squared Magnitude of Y vs. Frequency Offset');
grid on;

% Mark the most likely frequency offset with a red star
hold on;
plot(most_likely_frequency_offset, max_peak_value, 'r*', 'MarkerSize', 10);
hold off;
