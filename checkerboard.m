function matrix = checkerboard(rows, cols)
    if nargin == 1
        cols = rows;
    end
    [X, Y] = meshgrid(1:cols, 1:rows);
    matrix = mod(X + Y, 2) == 0;
end


%{
function matrix = checkerboard(n, m = n)
    matrix = logical(zeros(n));
    for i = 1:n
        for j = 1:n
            matrix(i, j) = (mod(i + j, 2) == 0);
        end
    end
end
%}