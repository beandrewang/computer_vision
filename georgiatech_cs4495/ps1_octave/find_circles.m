function [centers, radii] = find_circles(BW, radius_range)
    % Find circles in given radius range using Hough transform.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius_range: Range of circle radii [min max] to look for, in pixels

    % TODO: Your code here
    centers = [];
    radii = [];
    H_sum = [];
    
    r = radius_range(1) : radius_range(2);
    H = cell(length(r), 1);
    P = cell(length(r), 1);
    
    for i = 1 : length(r)
        H{i} = hough_circles_acc(BW, r(i));
        P{i} = hough_peaks(H{i}, 10);
        H_sum(P{i}(:, 1), P{i}(:, 2)) = H{i}(P{i}(:, 1), P{i}(:, 2));
    end
    
    centers = hough_peaks(H_sum, 14);
    for i = 1 : 14
        for j = 1 : length(r)
            if(find(P{j} == centers(i)))
                radii(i) = r(j);
                break;
            end
        end
    end
    
endfunction
