function signal = low_pass(signal, fs, cutoff_freq)
  signal_fft = fft(signal);
  N = length(signal);
  f = (0:N-1) * fs / N;
  mask = f <= cutoff_freq;
  filtered_fft = signal_fft .* mask';
  filtered_signal = ifft(filtered_fft);
  signal = filtered_signal / max(abs(filtered_signal));
endfunction

