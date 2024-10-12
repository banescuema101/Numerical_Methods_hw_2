function x = oscillator(freq, fs, dur, A, D, S, R)
    num_samples = round(dur * fs);

    t = (0:num_samples-1) / fs;
    
    sine_wave = sin(2 * pi * freq * t)';
    
    A_samples = max(1, round(A * fs));
    D_samples = max(1, round(D * fs));
    R_samples = max(1, round(R * fs));
    

    total_ADR = A + D + R;
    sustain_duration = dur - total_ADR;
    
    S_samples = max(1, round(sustain_duration * fs));

    attack_env = (0:A_samples-1)' / A_samples;
    decay_env = linspace(1, S, D_samples)';
    sustain_env = S * ones(S_samples, 1);
    release_env = linspace(S, 0, R_samples)';

    envelope = [attack_env; decay_env; sustain_env; release_env];
    if length(envelope) < num_samples
        envelope = [envelope; zeros(num_samples - length(envelope), 1)];
    elseif length(envelope) > num_samples
        envelope = envelope(1:num_samples);
    end
    
    diff_length = num_samples - length(envelope);
    x = sine_wave .* envelope;
end