% Call the function
result = add_numbers(3, 5);

% Display the result
% disp(result);


% Call the frequency offset function
load('rxsignal_withchannelandfreqoff.mat')

run('pss.m')

m2_chan = 10*log(abs(conv(rxs3,conj(fliplr(pss2_t)))));
[c2_chan,NF2_chan] = max(m2_chan);

% Grab the function Profs Frequency Offset with his values
freq_offset_est(rxs3,pss2_t,NF2_chan-length(pss2_t)+1)
% Detected_offset: 150 Hz
% ans = 766