%reads in the image, converts it to grayscale, and converts the intensities
%from uint8 integers to doubles. (Brightness must be in 'double' format for
%computations, or else MATLAB will do integer math, which we don't want.)
pkg load image;
clc;
clear all;

dark = double(rgb2gray(imread('u2dark.png')));

%%%%%% Your part (a) code here: calculate statistics
[w, h] = size(dark);
average_gray = mean(mean(dark));
min_gray = min(min(dark));
max_gray = max(max(dark));

fprintf('average_gray: %d\n', average_gray);
fprintf('min_gray: %d\n', min_gray);
fprintf('max gray: %d\n', max_gray);

%%%%%% Your part (b) code here: apply offset and scaling
fixedimg = (dark - min_gray) * 255 / (max_gray - min_gray);

%displays the image
imshow(uint8(fixedimg));

%%%%%% Your part (c) code here: apply the formula to increase contrast,
% and display the image
contrasted = uint8(2 * (fixedimg - 128) + 128);
figure;
imshow(contrasted);
