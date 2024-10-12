function coef = spline_c2 (x, y)
    n = length(x);
    h = diff(x);
    alfa = 3 * (diff(y) ./ h - diff(y([1, 1:n - 1])) ./ h([1, 1:n - 2]));

    l = zeros(n, 1);
    miu = zeros(n, 1);
    z = zeros(n, 1);

    l(1) = 1;
    miu(1) = 0;
    z(1) = 0;
    for i = 2:n - 1
        l(i) = 2 * (x(i + 1) - x(i - 1)) - h(i - 1) * miu(i - 1);
        miu(i) = h(i) / l(i);
        z(i) = (alfa(i) - h(i - 1) * z(i - 1)) / l(i);
    end
    l(n) = 1;
    z(n) = 0;
    c = zeros(n, 1);
    c(n) = 0;

    for j = n - 1:-1:1
        c(j) = z(j) - miu(j) * c(j + 1);
        b(j) = (y(j + 1) - y(j)) / h(j) - h(j) * (c(j + 1) + 2 * c(j)) / 3;
        d(j) = (c(j + 1) - c(j)) / (3 * h(j));
        a(j) = y(j);
    end

    coef = [];
    for i = 1:n - 1
        coef = [coef, [a(i); b(i); c(i); d(i)]];
    end
    coef = coef(:);
end
