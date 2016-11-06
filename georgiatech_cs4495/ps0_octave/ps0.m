clc;
close all;
clear all;

pkg load image;

% store the two images in the input directory into the output directory, also 
% rename them as 'ps0-1-a-1.png' and 'ps0-1-a-2.png'
img1 = imread('input/4.1.01.tiff');
img2 = imread('input/4.1.02.tiff');

% convert them into png format and rename 
imwrite(img1, 'output/ps0-1-a-1.png');
imwrite(img2, 'output/ps0-1-a-2.png');

% swap the red and blue pixels of image 1
img1_swap_r_b = img1;
img1_swap_r_b(:, :, 1) = img1(:, :, 3);
img1_swap_r_b(:, :, 3) = img1(:, :, 1);

% Output: Store as ps0-2-a-1.png in the output folder
imwrite(img1_swap_r_b, 'output/ps0-2-a-1.png');

% Create a monochrome image (img1_green) by selecting the green channel of 
% image 1, Output: ps0-2-b-1.png
img1_green = img1(:, :, 2);
imwrite(img1_green, 'output/ps0-2-b-1.png');

% Create a monochrome image (img1_red) by selecting the red channel of image 1
% Output: ps0-2-c-1.png
img1_red = img1(:, :, 1);
imwrite(img1_red, 'output/ps0-2-c-1.png');

% Take the inner center square region of 100x100 pixels of monochrome version 
% of image 1 and insert them into the center of monochrome version of image 2
% Output: Store the new image created as ps0-3-a-1.png

img1_mono = rgb2gray(img1);
img2_mono = rgb2gray(img2);

[h1, w1] = size(img1_mono);
[h2, w2] = size(img2_mono);

img1_mono_center = img1_mono(h1 / 2 - 50 : h1 / 2 + 49, w1 / 2 - 50 : w1 / 2 \
                    + 49);
% imshow(img1_mono_center);
img2_replace = img2_mono;
img2_replace(h2 / 2 - 50 : h2 / 2 + 49, w2 / 2 - 50 : w2 / 2 \
            + 49) = img1_mono_center;
% imshow(img2_replace);
imwrite(img2_replace, 'output/ps0-3-a-1.png');

% What is the min and max of the pixel values of img1_green? What is the mean? 
% What is the standard deviation?  And how did you compute these?
img1_green_max = max(img1_green(:));
img1_green_min = min(img1_green(:));
img1_green_mean = mean(img1_green(:));
img1_green_std = std(img1_green(:));
printf('max:\t%d\nmin:\t%d\nmean:\t%d\nstd:\t%d\n', img1_green_max, \
        img1_green_min, 
        img1_green_mean, 
        img1_green_std);

% Subtract the mean from all pixels, then divide by standard deviation, then 
% multiply by 10 (if your image is 0 to 255) or by 0.05 (if your image ranges 
% from 0.0 to 1.0). Now add the mean back in. Output: ps0-4-b-1.png
img1_green_convert = (img1_green - img1_green_mean) / img1_green_std * 10 \
                     + img1_green_mean;
img1_green_convert = uint8(img1_green_convert);
% imshow(img1_green_convert);
imwrite(img1_green_convert, 'output/ps0-4-b-1.png');

% Shift img1_green to the left by 2 pixels. Output: ps0-4-c-1.png
img1_green_shift = img1_green(:, 3 : end);
% imshow(img1_green_shift);
imwrite(img1_green_shift, 'output/ps0-4-c-1.png');

% Subtract the shifted version of img1_green from the original, and save the 
% difference image. Output: ps0-4-d-1.png
img1_green_diff = uint8(img1_green(:, 1 : end - 2) - img1_green_shift);
% imshow(img1_green_diff);
imwrite(img1_green_diff, 'output/ps0-4-d-1.png');

% Take the original colored image (image 1) and start adding Gaussian noise to 
% the pixels in the green channel. Increase sigma until the noise is somewhat 
% visible.  Output: ps0-5-a-1.png, text response: What is the value of sigma 
% you had to use?
sigma = 10;
noise_gaussian = randn(size(img1_green)) .* sigma;
img1_green_noise = img1_green + noise_gaussian;
img1_noise_on_green = img1;
img1_noise_on_green(:, :, 2) = img1_green_noise;
imwrite(img1_noise_on_green, 'output/ps0-5-a-1.png');

% Now, instead add that amount of noise to the blue channel.Output: 
% ps0-5-b-1.png
img1_blue_noise = img1(:, :, 3) + noise_gaussian;
img1_noise_on_blue = img1;
img1_noise_on_blue(:, :, 3) = img1_blue_noise;
imwrite(img1_noise_on_blue, 'output/ps0-5-b-1.png');
% figure; imshow(img1_noise_on_green);
% figure; imshow(img1_noise_on_blue);

