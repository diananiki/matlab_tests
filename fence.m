function matrix = fence(rows, cols)
    if nargin == 1
        cols = rows;
    end
    [X, Y] = meshgrid(1:cols, 1:rows);
    matrix = mod(X, 2) == 1;
end


%{
function matrix = fence(rows, cols)
    matrix = logical(zeros(rows, cols));
    for i = 1:rows
        for j = 1:cols
            matrix(i, j) = (mod(j, 2) == 1);
        end
    end
end
%}