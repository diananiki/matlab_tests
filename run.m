

function run(T, X, link1, link2)
    figure;
    hold on;
    axis equal;
    grid on;
    xlim([-3, 3]);
    ylim([-4, 2]);

    rod1 = plot([0, 0], [0, 0], 'Color', [0.7, 0.7, 0.7], 'LineWidth', 2);
    rod2 = plot([0, 0], [0, 0], 'Color', [0.7, 0.7, 0.7], 'LineWidth', 2);
    joint1 = plot(0, 0, 'p', 'MarkerFaceColor', [0.8, 0.8, 0.3], 'MarkerEdgeColor', 'black', 'MarkerSize', 15);
    joint2 = plot(0, 0, 'p', 'MarkerFaceColor', [0.5, 0.5, 0.5], 'MarkerEdgeColor', 'black', 'MarkerSize', 15);

    pause_duration = 0.05;

    for i = 1:length(T)
        x1 = link1.l * sin(X(i, 1));
        y1 = -link1.l * cos(X(i, 1));
        x2 = x1 + link2.l * sin(X(i, 2));
        y2 = y1 - link2.l * cos(X(i, 2));

        set(rod1, 'XData', [0, x1], 'YData', [0, y1]);
        set(rod2, 'XData', [x1, x2], 'YData', [y1, y2]);
        set(joint1, 'XData', x1, 'YData', y1);
        set(joint2, 'XData', x2, 'YData', y2);

        pause(pause_duration);
    end
end
