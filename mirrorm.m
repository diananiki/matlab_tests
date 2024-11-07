function matrix = mirrorm(a, n)
    [rows, cols] = size(a);
    matrix = zeros(rows + 2*n, cols + 2*n);
    matrix(n+1:rows+n, n+1:cols+n) = a;
    matrix(n+1:rows+n, 1:n) = flip(a(:, 1:n), 2);
    matrix(n+1:rows+n, cols + n + 1: cols + n * 2) = flip(a(:, cols - n + 1:cols), 2);
    matrix(1:n, n + 1:n + cols) = flip(a(1:n, :), 1);
    matrix(n + rows + 1: rows + n * 2, n + 1:cols + n) = flip(a(rows - n + 1:rows, :), 1);
    matrix(1:n, 1:n) = flip(rot90(a(1:n, 1:n), 3), 1);
    matrix(1:n, n + cols + 1:cols + n * 2) = flip(rot90(a(1:n, cols - n + 1:cols), 1), 1);
    matrix(rows + n + 1:rows + n * 2, 1:n) = flip(rot90(a(rows - n + 1:rows, 1:n), 1), 1);
    matrix(rows + n + 1:rows + n * 2, n + cols + 1:cols + n * 2) = flip(rot90(a(rows - n + 1:rows, cols - n + 1:cols), 3), 1);
end