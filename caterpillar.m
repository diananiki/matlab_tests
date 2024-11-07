function caterpillar(x, y, vx, vy, segmentRadius, segmentSpacing, limits)
    figure;
    h = plot(x, y, 'o', 'MarkerSize', segmentRadius*2);
    axis equal;
    axis(limits);
    colors = hsv(length(x));

    while true
        prevX = x;
        prevY = y;
        x(1) = x(1) + vx;
        y(1) = y(1) + vy;
        if x(1) - segmentRadius < limits(1) || x(1) + segmentRadius > limits(2)
            vx = -vx;
            x(1) = x(1) + 2*vx;
        end
        if y(1) - segmentRadius < limits(3) || y(1) + segmentRadius > limits(4)
            vy = -vy;
            y(1) = y(1) + 2*vy;
        end

        for i = 2:length(x)
            distance = sqrt((x(i-1) - x(i))^2 + (y(i-1) - y(i))^2);
            if distance > segmentSpacing
                direction = [x(i-1) - x(i), y(i-1) - y(i)];
                direction = direction / norm(direction);
                x(i) = x(i-1) - direction(1) * segmentSpacing;
                y(i) = y(i-1) - direction(2) * segmentSpacing;
            end
        end
        delete(h);
        hold on;
        for i = 1:length(x)
            h(i) = plot(x(i), y(i), 'o', 'MarkerSize', segmentRadius*2, ...
                'MarkerFaceColor', colors(i,:), 'MarkerEdgeColor', 'k');
        end
        hold off;
        drawnow;
        pause(0.01);
    end
end