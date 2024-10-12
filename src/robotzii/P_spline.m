function y_interp = P_spline(coef, x, x_interp)
    n = length(x);
    m = length(x_interp);
    y_interp = zeros(m, 1);
    a = coef(1:4:end);
    b = coef(2:4:end);
    c = coef(3:4:end);
    d = coef(4:4:end);

    for i = 1:n-1
        indici = find(x_interp >= x(i) & x_interp <= x(i+1));
        if ~isempty(indici)
            dx = x_interp(indici) - x(i);
            y_interp(indici) = a(i) + b(i)*dx + c(i)*dx.^2 + d(i)*dx.^3;
        end
    end
end