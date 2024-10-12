function mono = stereo_to_mono(stereo)
  [m, n] = size(stereo);
  mono = zeros(m, 1);
  for i = 1:m
    mono(i) = sum(stereo(i, :)) / n;
  end
  mono = mono / max(abs(mono));
endfunction
