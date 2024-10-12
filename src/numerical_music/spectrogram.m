function [S, F, T] = spectrogram(signal, sampling_rate, window_size)
  signal_length = length(signal);
  
  num_windows = floor(signal_length / window_size);

  hann_window = hanning(window_size);
  
  S = zeros(window_size, num_windows);

  for i = 1:num_windows
    start_idx = (i-1) * window_size + 1;
    end_idx = start_idx + window_size - 1;
    windowed_signal = signal(start_idx:end_idx) .* hann_window;
    
    fft_result = fft(windowed_signal, 2*window_size);

    magnitude = abs(fft_result(1:window_size));

    S(:, i) = magnitude;
  endfor
  
  F = (0:(window_size-1)) * (sampling_rate / (2 * window_size));
  F = F';

  T = ((0:(num_windows-1)) * window_size) / sampling_rate;
  T = T'
endfunction