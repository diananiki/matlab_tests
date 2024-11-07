function matrix = diagsn(rows, cols)
    if nargin == 1
        cols = rows;
    end
    if rows < cols
        matrix = zeros(cols, cols);
        ind = 1;
        flifF = true;
        z_u = fix((cols - rows) / 2);
        z_d = cols - rows - z_u;
        for i = 0:cols - 2
            vec = zeros(1, min((i + 1), z_d));
            if i >= z_d
                v = ind:ind + i - z_d;
                if i >= rows + z_d
                    v = v(1:rows);
                    ind = ind - i + z_d + rows - 1;
                end
                if flifF
                    v = flip(v);
                end
                vec = [vec, v];
                ind = ind + i - z_d + 1;
            end
            if i >= rows + z_d
                vec = [vec, zeros(1, (i - length(vec) + 1))];
            end
            vec = flip(vec);
            matrix = matrix + diag([vec], -cols + i + 1);
            flifF = ~flifF;
        end
        v = ind:ind + rows - 1;
        if ~flifF
            v = flip(v);
        end
        vec = [zeros(1, z_u), v, zeros(1, z_d)];
        matrix = matrix + diag([vec]);
        ind = rows * cols;
        flifF = false;
        for i = 0:cols - 2
            vec = zeros(1, min((i + 1), z_u));
            if i >= z_u
                v = ind - i + z_u:ind;
                if i >= rows + z_u - 1
                    v = v(1:rows);
                    ind = ind + i - z_u - rows + 2;
                end
                if flifF
                    v = flip(v);
                end
                vec = [vec, v];
                ind = ind - i + z_u - 1;
            end
            if i >= rows + z_u
                vec = [vec, zeros(1, (i - length(vec) + 1))];
            end
            matrix = matrix + diag([vec], cols - i - 1);
            flifF = ~flifF;
        end
        matrix = flipud(matrix);
        matrix = matrix(z_d + 1:cols - z_u, :);
    else
        matrix = zeros(rows, rows);
        ind = 1;
        flifF = false;
        z_l = fix((rows - cols) / 2);
        z_r = rows - cols - z_l;
        for i = 0:rows - 2
            vec = zeros(1, min((i + 1), z_l));
            if i >= z_l
                v = ind:ind + i - z_l;
                if i >= cols + z_l
                    v = v(1:cols);
                    ind = ind - i + z_l + cols - 1;
                end
                if flifF
                    v = flip(v);
                end
                vec = [v, vec];
                ind = ind + i - z_l + 1;
            end
            if i >= cols + z_l
                vec = [zeros(1, (i - length(vec) + 1)), vec];
            end
            vec = flip(vec);
            matrix = matrix + diag([vec], -rows + i + 1);
            flifF = ~flifF;
        end
        v = ind:ind + cols - 1;
        if ~flifF
            v = flip(v);
        end
        vec = [zeros(1, z_l), v, zeros(1, z_r)];
        matrix = matrix + diag([vec]);
        ind = rows * cols;
        flifF = true;
        for i = 0:rows - 2
            vec = zeros(1, min((i + 1), z_r));
            if i >= z_r
                v = ind - i + z_r:ind;
                if i >= cols + z_r - 1
                    v = v(1:cols);
                    ind = ind + i - z_r - cols + 2;
                end
                if flifF
                    v = flip(v);
                end
                vec = [v, vec];
                ind = ind - i + z_r - 1;
            end
            if i >= cols + z_r
                vec = [zeros(1, (i - length(vec) + 1)), vec];
            end
            matrix = matrix + diag([vec], rows - i - 1);
            flifF = ~flifF;
        end
        matrix = flipud(matrix);
        matrix = matrix(:, z_l + 1:rows - z_r);
    end
    matrix = uint32(matrix);
end