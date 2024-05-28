function sinusoidalCaterpillar()
    numSegments = 7;
    segmentRadius = 2;
    segmentSpacing = 1;
    limits = [0 100 0 100];
    initialSpeed = 0.5;
    amplitude = 10;
    frequency = 0.5;

    x = linspace(10, 10 + (numSegments-1)*segmentSpacing, numSegments);
    y = linspace(50, 50, numSegments);
    vx = initialSpeed;
    vy = 0;

    figure;
    hold on;
    axis equal;
    axis(limits);
    sineX = limits(1):0.1:limits(2);
    sineY = 50 + amplitude * sin(frequency * sineX);
    plot(sineX, sineY, '--', 'Color', [0.5 0.5 0.5]);
    h = plot(x, y, 'o', 'MarkerSize', segmentRadius*2, 'MarkerFaceColor', 'g');
    colors = hsv(length(x));

    while true
        prevX = x;
        prevY = y;
        x(1) = x(1) + vx;
        y(1) = 50 + amplitude * sin(frequency * x(1));
        if x(1) - segmentRadius < limits(1) || x(1) + segmentRadius > limits(2)
            vx = -vx;
            x(1) = x(1) + 2*vx;
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
        plot(sineX, sineY, '--', 'Color', [0.5 0.5 0.5]);
        for i = 1:length(x)
            h(i) = plot(x(i), y(i), 'o', 'MarkerSize', segmentRadius*2, ...
                'MarkerFaceColor', colors(i,:), 'MarkerEdgeColor', 'k');
        end
        hold off;
        drawnow;
        pause(0.01);
    end
end
