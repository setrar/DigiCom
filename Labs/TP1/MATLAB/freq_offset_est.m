function [ f_offset ] = freq_offset_est(signal, pss_1, Nf)
  %%Frequency offset estimator

  %To make sure the signals are generated befor running this func.
  pss;

  figure;
  %subtitle('Frequency offset');
  DELTA_F = 10;

  Fs = 61.44e6;
  f_min = 7500;
  f_max = 7500;

  m = f_min:DELTA_F:f_max;
  Y = zeros(1,length(m));
  L = length(pss_1);
  t = 0:(1/Fs):((L-1)/Fs);

  %figure
      for j = 1:length(m)
        % Calculate the complex exponential term
        exponential_term = exp(-2*pi*1i*m(j).*t);

        % Calculate the complex conjugate of xi
        x_i_conjugate = conj(pss_1);

        % Calculate Y for the current term and accumulate
        % Y(j) = Y(j) * exponential_term .* x_i_conjugate .* signal(Nf:(Nf + L - 1));

          % Y(j) = Y(j) * 
          % abs(sum(exp( -2*pi*1i*m(j).*t).*conj(pss_1).* signal(Nf:(Nf + L - 1)).'));
      end
end