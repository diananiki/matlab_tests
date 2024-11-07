function tangenta(f, dmin, dmax, n)
    points = zeros(2, n*2 + 1);
    for i=0:n*2
        points(:, i + 1) = f((dmax - dmin) / (n*2) * i);
    end
    t_mid = (dmin + dmax) / 2;
    d_mid = f(t_mid);
    p = diffi(f, [t_mid]);
    p_mid = p(2) / p(1);
    k = fimplicit(@(x, y) p_mid * (x - d_mid(1)) + d_mid(2) - y);
    hold on;
    set(k, 'linewidth', 2, 'Color', 'g');
    plot(points(1,:), points(2,:), 'linewidth', 2, 'Color', 'b');
    xlabel('x');
    ylabel('y');
    hold off;
end