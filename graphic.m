syms x y;

func = 2*x*(x^2 + y^2) - 2*(3*x^2 - y^2) == 0;

figure;
fimplicit(func, [-4 4 -4 4], 'LineWidth', 3, 'Color', "#A2142F");
xlabel('x');
ylabel('y');
title('Трисектриса Маклорена');
grid on;

u = linspace(0, 4*pi, 100);
v = linspace(0.001, 2, 50);
[U, V] = meshgrid(u, v);

X = cos(U) .* sin(V);
Y = sin(U) .* sin(V);
Z = cos(U) + log(tan(V ./ 2)) + 0.2*U - 4;

figure;
surf(X, Y, Z, 'FaceColor', 'interp', 'EdgeColor', 'none');
colormap hot;
colorbar;
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Поверхность Дини');
grid on;
view(3);