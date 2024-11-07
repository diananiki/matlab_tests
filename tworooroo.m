function result = tworooroo(coefficients, tolerance)
    if nargin < 2
        tolerance = 1e-14;
    end
    coefficients = vpa(coefficients, 20);
    Roots = roots(coefficients); % / 1000;
    result = false;
    for i = 1:length(Roots)
        for j = i+1:length(Roots)
            if abs(Roots(i) - Roots(j)) < tolerance
                result = true;
                return;
            end
        end
    end
end