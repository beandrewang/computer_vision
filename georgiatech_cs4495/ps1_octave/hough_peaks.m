function peaks = hough_peaks(H, varargin)
    % Find peaks in a Hough accumulator array.
    %
    % Threshold (optional): Threshold at which values of H are considered to be 
    % peaks
    % NHoodSize (optional): Size of the suppression neighborhood, [M N]
    %
    % Please see the Matlab documentation for houghpeaks():
    %   
    % Your code should imitate the matlab implementation.

    %% Parse input arguments
    p = inputParser;
    p.addOptional('numpeaks', 1, @isnumeric);
    p.addParamValue('Threshold', 0.5 * max(H(:)));
    % odd values >= size(H)/50
    p.addParamValue('NHoodSize', floor(size(H) / 100.0) * 2 + 1);  
    p.parse(varargin{:});

    numpeaks = p.Results.numpeaks;
    threshold = p.Results.Threshold;
    nHoodSize = p.Results.NHoodSize;

    % TODO: Your code here
    peaks = zeros(numpeaks, 2);
    thresed_h = (H > threshold) .* H;
    
    [h, w] = size(H);
  
    for i = 1 : numpeaks
        [r, c] = find(thresed_h == max(thresed_h(:)));
        r = r(1); c = c(1);
        window_r = max([r - floor(nHoodSize(1) / 2), 1]) : 1 : \ 
                   min([r + floor(nHoodSize(1) / 2), h]);
        window_c = max([c - floor(nHoodSize(2) / 2), 1]) : 1 : \
                   min([c + floor(nHoodSize(2) / 2), w]);
        
        thresed_h(window_r, window_c) = 0;
        peaks(i, :) = [r, c];
    end
endfunction
