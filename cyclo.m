function cyclo(f, g, r, ts)
    l_points = [f(ts); g(ts)];
    P = cyclofun(f, g, r, ts);
    plot(l_points(1,:), l_points(2,:), 'linewidth', 2, 'Color', 'b');
    hold on;
    plot(P(1,:), P(2,:), 'linewidth', 2, 'Color', 'g');
    xlabel('x');
    ylabel('y');
    axis equal;
    hold off;
end