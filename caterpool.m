function caterpool(startXY, initialSpeed, limits)
    numSegments = 20;
    segmentRadius = 4;
    segmentSpacing = 4;
    x = linspace(startXY(1), startXY(1) + (numSegments-1)*segmentSpacing, numSegments);
    y = linspace(startXY(2), startXY(2), numSegments);
    vx = initialSpeed;
    vy = initialSpeed * 0.5;

    caterpillar(x, y, vx, vy, segmentRadius, segmentSpacing, limits);
end