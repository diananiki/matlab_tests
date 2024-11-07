function matrix = circleMatrix(n, r)
    [X, Y] = meshgrid(1:n, 1:n);
    matrix = (((X - ((n + 1) / 2)).^2 + (Y - ((n + 1) / 2)).^2) <= r.^2);
end


%{
function matrix = circleMatrix(n, r)
    matrix = logical(zeros(n));
    for i = 1:n
        for j = 1:n
            matrix(i, j) = (((i - ((n + 1) / 2)).^2 + (j - ((n + 1) / 2)).^2) <= r.^2);
        end
    end
end
%}