function P = cyclofun(f, g, r, ts)
    P = zeros(2, length(ts));
    phi = pi/2;
    df = gradient(f(ts), ts);
    dg = gradient(g(ts), ts);
    P(1, 1) = f(ts(1));
    P(2, 1) = g(ts(1)) + r + r / 2;
    pred_n = 0;
    fl = -1;
    for i = 1:length(ts) - 1
        t_1 = ts(i);
        t_2 = ts(i + 1);
        d_f = df(i);
        d_g = dg(i);
        if d_g == 0
            P(:, i + 1) = P(:, i);
            continue;
        end
        n = -d_f / d_g;
        d_x = r ./ sqrt(n .^ 2 + 1);
        if pred_n * n < 0 && abs(d_f) > 0.999
            fl = -fl;
        end
        d_x = fl * d_x;
        B = [f(t_2) + d_x, g(t_2) + n .* d_x];
        L = trapz(ts(i:i+1), sqrt(abs(df(i:i+1)) .^ 2 + abs(dg(i:i+1)) .^ 2));
        theta = L ./ r;
        E = [B(1) + r .* cos(phi - theta), B(2) + r .* sin(phi - theta)];
        P(1, i + 1) = (B(1) + E(1)) ./ 2;
        P(2, i + 1) = (B(2) + E(2)) ./ 2;
        phi = phi - theta;
        pred_n = n;
    end
end