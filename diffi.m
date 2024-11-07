function res = diffi(f, ts, h)
    if nargin < 3
        h = 1e-8;
    end
    res = zeros(2, length(ts));
    for i = 1:length(ts)
        t = ts(i);
        f_t = f(t);
        f_t_plus_h = f(t + h);
        res(:, i) = (f_t_plus_h - f_t) / h;
    end
end