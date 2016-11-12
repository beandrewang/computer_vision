function [centers, radii] = find_circles(BW, radius_range)
    % Find circles in given radius range using Hough transform.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius_range: Range of circle radii [min max] to look for, in pixels

    % TODO: Your code here
    centers = [];
    radii = [];
    
    for r = radius_range(1) : radius_range(2)
        H = hough_circles_acc(BW, r);
        peaks = hough_peaks(H, 1);
        centers = [centers; peaks];
        radii = [radii; ones(size(peaks, 1), 1) * r];
    end
endfunction
