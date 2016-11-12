function H = hough_circles_acc(BW, radius)
    % Compute Hough accumulator array for finding circles.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius: Radius of circles to look for, in pixels

    % TODO: Your code here
    
    [h, w] = size(BW);
    theta = 0 : 45;
    nradius = length(radius);
    ntheta = length(theta);
    [r, c] = find(BW == 1);
    
    H = zeros(w, h);
    
    for i = 1 : length(r)
        x = c(i);
        y = r(i);
        for radius_idx = 1 : nradius
            raddi = radius(radius_idx);
            for theta_idx = 1 : ntheta
                a = round(x - raddi * cos(theta(theta_idx)));
                b = round(y + raddi * sin(theta(theta_idx)));
                if(a < 1)
                    a = 1;
                end
                if(a > w)
                    a = w;
                end
                if(b < 1)
                    b = 1;
                end
                if(b > h)
                    b = h;
                end
                H(a, b) = (H(a, b) + 1);
            end
        end
    end
    
    H = H';
    
endfunction
