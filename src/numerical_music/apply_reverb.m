function signal = apply_reverb(signal, impulse_response)
    impulse_response = stereo_to_mono(impulse_response);
    convolved_signal = fftconv(signal, impulse_response);
    signal = convolved_signal / max(abs(convolved_signal));
endfunction