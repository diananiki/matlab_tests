function baltie(suspension_point, thread_length, ball_radius)
    distance = @(x1, y1, x2, y2) sqrt((x2 - x1)^2 + (y2 - y1)^2);
    fig = figure;
    ax = axes('Parent', fig);
    ax.XLim = [0 500];
    ax.YLim = [0 500];
    ax.DataAspectRatio = [1 1 1];
    suspension_x = suspension_point(1);
    suspension_y = suspension_point(2);
    ball_x = suspension_x;
    ball_y = suspension_y - thread_length;
    ball_started_moving = false;

    function move_ball(src, event)
        if ball_started_moving
            current_point = get(ax, 'CurrentPoint');
            mouse_x = current_point(1, 1);
            mouse_y = current_point(1, 2);
            dist = distance(suspension_x, suspension_y, mouse_x, mouse_y);
            if dist <= thread_length
                ball_x = mouse_x;
                ball_y = mouse_y;
            else
                dx = mouse_x - suspension_x;
                dy = mouse_y - suspension_y;
                angle = atan2(dy, dx);
                ball_x = suspension_x + thread_length * cos(angle);
                ball_y = suspension_y + thread_length * sin(angle);
            end
            draw();
        end
    end

    function mouse_pressed(src, ~)
        ball_started_moving = true;
        fig.WindowButtonMotionFcn = @move_ball;
    end

    function mouse_released(src, ~)
        ball_started_moving = false;
        ball_x = suspension_x;
        ball_y = suspension_y - thread_length;
        draw();
        fig.WindowButtonMotionFcn = [];
    end

    function draw()
        cla(ax);
        line(ax, [suspension_x ball_x], [suspension_y ball_y + ball_radius], 'Color', 'black', 'LineWidth', 2);
        h = hsv(10);
        rectangle(ax, 'Position', [ball_x - ball_radius, ball_y - ball_radius, 2*ball_radius, 2*ball_radius], 'Curvature', [1 1], 'FaceColor', h(randi(10),:));
    end

    fig.WindowButtonDownFcn = @mouse_pressed;
    fig.WindowButtonUpFcn = @mouse_released;
    draw();
end