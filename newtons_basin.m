function newtons_basin()

P = [1, 0, 0, -1];
Z = roots(P);
cm = ["#ef3e5b" "#4b256d" "#95d47a" "k"];
figure();
func = @(z) z.^3 - 1;
func_p = @(z) 3*z.^2;
e = 0.000001;
C = [];
x_i = 0;
hold on
for x = -2:0.05:2
    x_i = x_i + 1;
    y_i = 0;
    for y = -2:0.05:2
        y_i= y_i + 1;
        z = x + 1i*y;
        it = 0;
        while (it < 100)
            it = it + 1;
            z_p = z;
            z = z_p - func(z_p)/func_p(z_p);
            if abs(func(z)) < e
                break;
            end
        end
        k = 4;
        for ii=1:length(Z)
            if abs(Z(ii) - z) <= e
                k = ii;
                C(y_i, x_i) = ii;
            end
        end
        plot(x, y, "pentagram", color = cm(k));
    end
end
hold off
figure();
image(C, 'CdataMapping', 'scaled');
colorbar