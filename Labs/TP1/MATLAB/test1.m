load('rxsignal_withchannelandfreqoff.mat')

run('pss.m')

m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan);

Nf = NF2_chan-length(pss2_t)+1

  DELTA_F = 10;

  Fs = 61.44e6;
  f_min = 7500;
  f_max = 7500;

  m = f_min:DELTA_F:f_max;


signal = rxs3;

L = length(pss_2);
t = 0:(1/Fs):((L-1)/Fs);
Y = zeros(1,length(m));
S = (signal(Nf:(Nf + L - 1)).');

C_2 = conj(pss_2)

a = abs(C_2 .* S).^2;

for j = 1:length(m)
  % m = exp( -2*pi*1i*m(j).*t);
  % Y(j) = Y(j);
  Y(j) = Y(j) + abs(sum(exp( -2*pi*1i*m(j).*t).*conj(pss_1).* signal(Nf:(Nf + L - 1)).').^2;
end