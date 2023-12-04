% Filename: frequency_offset_estimation.m
function frequency_offset = frequency_offset_estimation(received_pss, expected_pss, sample_rate)
    % Default sample rate if not provided
    if nargin < 3
        sample_rate = 30.72e6;
    end
    
    % Compute phase difference
    % phase_difference = angle(dot(received_pss, conj(expected_pss)));
    phase_difference = abs(conv(received_pss,conj(fliplr(expected_pss))));
    
    % Time duration for transmitting PSS, in seconds
    time_duration_pss = 62 / sample_rate;

    % Convert phase difference to frequency offset in Hz
    frequency_offset = (phase_difference / (2 * pi)) / time_duration_pss;
end
