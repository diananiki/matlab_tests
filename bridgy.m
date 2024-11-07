function [x1, x2] = bridgy(y1, y2)

syms x1 x2
dist_sym = sqrt((x1 - x2)^2 + (y1(x1) - y2(x2))^2);
grad_dist_sym = gradient(dist_sym, [x1, x2]);
grad_distance = matlabFunction(grad_dist_sym, 'Vars', {[x1, x2]});

x0 = [0, 0];
alpha = 0.01;
tol = 1e-6;
max_iter = 1000;

p = x0;
for iter = 1:max_iter
    grad = grad_distance(p);
    p = p - alpha * grad';
    if norm(grad) < tol
        break;
    end
end

x1_opt = p(1);
x2_opt = p(2);
y1_opt = y1(x1_opt);
y2_opt = y2(x2_opt);

x1 = x1_opt
x2 = x2_opt

f = figure;
hold on;
x_range = linspace(-2*pi, 2*pi, 1000);
plot(x_range, y1(x_range));
plot(x_range, y2(x_range));
plot(x1_opt, y1_opt, 'bo', 'MarkerSize', 5);
plot(x2_opt, y2_opt, 'bo', 'MarkerSize', 5);
plot([x1_opt, x2_opt], [y1_opt, y2_opt], 'k--');
xlabel('x');
ylabel('y');
axis equal;
hold off;