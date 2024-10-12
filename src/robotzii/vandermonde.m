function coef = vandermonde(x, y)
    V = ones(length(x), length(x));
    for i = 1:length(x)
        V(:, i) = x.^(i-1);
    end
    coef = V \ y;
endfunction
