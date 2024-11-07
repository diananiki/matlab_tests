function matrix = rain(rows, cols)
    if nargin == 1
        cols = rows;
    end
    [X, Y] = meshgrid(1:cols, 1:rows);
    matrix = Y;
    matrix = uint32(matrix);
end