function [centers, radii] = find_circles(BW, radius_range)
    % Find circles in given radius range using Hough transform.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius_range: Range of circle radii [min max] to look for, in pixels

    % TODO: Your code here
    centers = [];
    radii = [];
    
    r = radius_range(1) : radius_range(2);
    H = cell(length(r), 1);
    P = cell(length(r), 1);
    
    for i = 1 : length(r)
        H{i} = hough_circles_acc(BW, r(i));
        P{i} = hough_peaks(H{i}, 10);
    end
    
    for num = 1 : 30
        for j = 1 : 10
            for i = 1 : length(r)
                m(i, j) = H{i}(P{i}(j, 1), P{i}(j, 2));
            end
        end
        
        [row, col] = find(m == max(m(:)));
        row = row(1); col = col(1);
        
        radii = [radii; r(row)];
        centers = [centers; P{row}(col, :)];
        H{row}(P{row}(col, 1), P{row}(col, 2)) = 0;
    end
endfunction
