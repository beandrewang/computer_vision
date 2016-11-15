function D = disparity_ssd(L, R)
    % Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))
    %
    % L: Grayscale left image
    % R: Grayscale right image, same size as L
    % D: Output disparity map, same size as L, R

    % TODO: Your code here
    [h, w] = size(L);
    win_w = 3;
    win_h = 3;
    
    patch = zeros(win_h, win_w);
    strip = zeros(win_h, w);
    D = zeros(h, w);

    for i = 1 : h - win_h + 1
        for j = 1 : w - win_w + 1
            % abstract a window from L
            patch = L(i : i + win_h - 1, j : j + win_w - 1);
            strip = R(i : i + win_h - 1, :);
            best_x = find_best_match(patch, strip);
            D(i, j) = best_x - j;
        end
    end
end

function best_x = find_best_match(patch, strip)
    min_diff = Inf;
    best_x = 1;
    
    for i = 1 : size(strip, 2) - size(patch, 2) + 1
        diff = sumsq((patch - strip(:, i : i + size(patch, 2) - 1))(:));
        if(diff < min_diff)
            min_diff = diff;
            best_x = i;
        end
    end
end
