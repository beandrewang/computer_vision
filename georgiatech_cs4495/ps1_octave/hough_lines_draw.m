function hough_lines_draw(img, outfile, peaks, rho, theta)
    % Draw lines found in an image using Hough transform.
    %
    % img: Image on top of which to draw lines
    % outfile: Output image filename to save plot as
    % peaks: Qx2 matrix containing row, column indices of the Q peaks found 
    % in accumulator
    % rho: Vector of rho values, in pixels
    % theta: Vector of theta values, in degrees

    % TODO: Your code here
    figure; 
    imshow(img);
    x = 1 : size(img, 2);
    
    for i = 1 : size(peaks, 1)
        peak = peaks(i, :);
        cur_rho = rho(peak(1));
        cur_theta = theta(peak(2));
       
        y = (cur_rho - (x  - 1) * cos(cur_theta)) / sin(cur_theta) + 1;
       
        hold on; plot(x, y, 'color', 'green'); 
    end
    
    print(outfile);
endfunction
