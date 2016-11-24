function [gx gy] =  gradient(img, varargin)
    %% compute the gradient x, y from the image. 
    p = inputParser();
    p.addParamValue('Scale', 5);
    p.addParamValue('Sigma', 3);
    p.parse(varargin{:});
    
    scale = p.Results.Scale;
    sigma = p.Results.Sigma;
    
    gauss = fspecial('gaussian', scale, sigma);
    smoothed_img = imfilter(img, gauss);
    
    gx = smoothed_img(:, 2 : end) - smoothed_img(:, 1 : end - 1);
    gy = smoothed_img(2 : end, :) - smoothed_img(1 : end - 1, :);
    
    gx = [zeros(size(smoothed_img, 1), 1) gx];
    gy = [zeros(1, size(smoothed_img, 2)); gy];
end
