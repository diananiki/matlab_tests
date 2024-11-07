function pendux2(link1, link2, initial_conditions, t_range)
    function dxdt = odes(t, x)
        g = 9.81;
        theta1 = x(1);
        theta2 = x(2);
        dtheta1 = x(3);
        dtheta2 = x(4);

        delta = theta2 - theta1;
        den1 = (link1.m + link2.m) * link1.l - link2.m * link1.l * cos(delta) * cos(delta);
        den2 = (link1.l * den1) / link2.l;
        ddtheta1 = (link2.m * link1.l * dtheta1 * dtheta1 * sin(delta) * cos(delta) + link2.m * g * sin(theta2) * cos(delta) + link2.m * link2.l * dtheta2 * dtheta2 * sin(delta) - (link1.m + link2.m) * g * sin(theta1)) / den1;
        ddtheta2 = (-link2.m * link2.l * dtheta2 * dtheta2 * sin(delta) * cos(delta) + (link1.m + link2.m) * g * sin(theta1) * cos(delta) - (link1.m + link2.m) * link1.l * dtheta1 * dtheta1 * sin(delta) - (link1.m + link2.m) * g * sin(theta2)) / den2;
        dxdt = [dtheta1; dtheta2; ddtheta1; ddtheta2];
    end
    [T, X] = ode45(@odes, t_range, initial_conditions);
    run(T, X, link1, link2);
end