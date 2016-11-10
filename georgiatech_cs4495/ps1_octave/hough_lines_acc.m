function [H, theta, rho] = hough_lines_acc(BW, varargin)
    % Compute Hough accumulator array for finding lines.
    %
    % BW: Binary (black and white) image containing edge pixels
    % RhoResolution (optional): Difference between successive rho values, in
    % pixels
    % Theta (optional): Vector of theta values to use, in degrees
    %
    % Please see the Matlab documentation for hough():
    % http://www.mathworks.com/help/images/ref/hough.html
    % Your code should imitate the Matlab implementation.
    %
    % Pay close attention to the coordinate system specified in the assignment.
    % Note: Rows of H should correspond to values of rho, columns those of theta
    % .

    %% Parse input arguments
    p = inputParser();
    p.addParamValue('RhoResolution', 1);
    p.addParamValue('Theta', linspace(-90, 89, 180));
    p.parse(varargin{:});

    rhoStep = p.Results.RhoResolution;
    theta = p.Results.Theta;

    %% TODO: Your code here
    [h, w] = size(BW); 
    
    D = sqrt((h - 1) ^ 2 + (w - 1) ^ 2);
    nrho = 2 * (ceil(D / rhoStep));
    diagonal = rhoStep * ceil(D / rhoStep);
    rho = -diagonal : rhoStep : diagonal;
    ntheta = length(theta);
    H = zeros(nrho, ntheta);
    
    for i = 1 : h
        for j = 1 : w
            cur_theta_index = 0;
            if(BW(i, j) == 1)
                for cur_theta = theta
                    cur_rho = i * cos(cur_theta) + j * sin(cur_theta);
                    cur_theta_index = cur_theta_index + 1;
                    cur_rho_index = floor(cur_rho - rho(1) / rhoStep) + 1;
                    H(cur_rho_index, cur_theta_index) = \
                            uint8(H(cur_rho_index, cur_theta_index) + 1);
                end
            end
            
        end  
    end
    
endfunction
