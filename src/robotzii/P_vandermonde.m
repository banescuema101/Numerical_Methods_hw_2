function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
    y_interp = zeros(size(x_interp));
    for i = 1:length(coef)
        y_interp = y_interp + coef(i) * x_interp.^(i-1);
    end
end
