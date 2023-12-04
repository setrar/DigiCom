function [ f_offset ] = freq_offset_est(signal, pss_1, Nf)
    %% Frequency offset estimator

    % To make sure the signals are generated before running this func.
    pss();

    figure;
    % subtitle('Frequency offset');
    DELTA_F = 10;

    Fs = 61.44e6;
    f_min = 7500;
    f_max = 7500;

    m = f_min:DELTA_F:f_max;
    Y = zeros(1, length(m));
    L = length(pss_1);
    t = 0:(1/Fs):((L-1)/Fs);

    signal = exp(2*pi*1i*DELTA_F*t) + 0.2*(randn(size(t)) + 1i*randn(size(t)));

    for j = 1:length(m)
        % Y(j) = Y(j) + abs().^2;
        S = signal(Nf:(Nf + L - 1))
        % S = signal
        Y(j) = Y(j) + abs(sum(exp(-2*pi*1i*m(j).*t).* conj(pss_1).*S.')).^2;
    end
end