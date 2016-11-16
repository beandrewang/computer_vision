function D = disparity_ssd(L, R)
    % Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))
    %
    % L: Grayscale left image
    % R: Grayscale right image, same size as L
    % D: Output disparity map, same size as L, R

    % TODO: Your code here
    [h, w] = size(L);
    win_w = 11;
    win_h = 11;
    
    D = zeros(h, w);

    for i = 1 : h - win_h + 1
        for j = 1 : w - win_w + 1
            % abstract a window from L
            D(i, j) = find_best_match(L(i : i + win_h - 1, j : j + win_w - 1),...
                            R(i : i + win_h - 1, :)) - j;
        end
    end
end

function best_x = find_best_match(patch, strip)    

    diff = zeros(size(strip, 2) - size(patch, 2) + 1);
    for i = 1 : size(strip, 2) - size(patch, 2) + 1
        diff(i) = sumsq((patch - strip(:, i : i + size(patch, 2) - 1))(:));
    end
    
    best_x = find(diff == min(diff))(1);
end
