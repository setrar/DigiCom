% Filename: freq_offset_est.m
function [ f_offset ] = freq_offset_est(signal, pss_1, Nf)
  %%Frequency offset estimator

  DELTA_F = 10;

  Fs = 61.44e6;
  f_min = -7500;
  f_max = 7500;

  m = f_min:DELTA_F:f_max;
  Y = zeros(1,length(m));
  L = length(pss_1);
  t = 0:(1/Fs):((L-1)/Fs);

  signal_part = signal(Nf:(Nf + L - 1));
  trans = signal_part.'
  transConj = conj(pss_1).* trans;

  for j = 1:length(m)
    exp_comp = exp(-2*pi*1i*m(j).*t);
    % fprintf('exp_comp %d \n',length(exp_comp));
    signal_offset = sum(exp_comp.*transConj);
    value = abs(signal_offset).^2
    Y(j) = Y(j) + value;
  end
  
  [A_fo, fo] = max(Y)
  % disp('Detected offset = 150Mhz',real(m2_chan));

  fprintf('m %d, A_fo %d, fo %d \n',length(m),A_fo,fo);
  fprintf('t %d %d\n',(1/Fs),((L-1)/Fs));
  fprintf('Nf %d \n',Nf);

  figure;
  subtitle('Frequency offset');

  plot(1:length(m),Y,".")

  length(Y)
  display(t)

end