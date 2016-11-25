clc;
clear all;
close all;

pkg load image;

%% Write functions to compute both the X and Y gradients. Try your code on both 
%% transA and simA. To display the output, adjoin the two gradient images(X and 
%% Y) to make a new, twice as wide, single image (the "gradient-pair"). Since 
%% gradients have negative and positive values, you’ll need to produce an image 
%% that is gray for 0.0 and black is negative and white is positive.

%{
img = imread('input/transA.jpg');
[gx, gy] = gradient(img);

gxy_adjoin = [gx gy];
figure; imshow(gxy_adjoin, []);
print('output/ps4-1-a-1.png');

img = imread('input/simA.jpg');
[gx, gy] = gradient(img);

gxy_adjoin = [gx gy];
figure; imshow(gxy_adjoin, []);
print('output/ps4-1-a-2.png');
%}

%% Write code to compute the Harris value. You can try the weights just equal 
%% to 1. But it might work better with a smoother Gaussian that is higher at the
%% middle and falls off gradually. Your output is a scalar function. Apply to 
%% transA, transB, simA, and simB. (To display the output reasonably you will 
%% have to scale the image values to be in a range of 0-255 or 0.0 to 1.0, 
%% depending upon how you deal with images.)

% transA image with Harris corners marked as  ps4-1-c-1.png
img = imread('input/transA.jpg');
R = harris_detector(img);
figure; imshow(R, []);
print('output/ps4-1-b-1.png');

corners = harris_corner(R);
figure; imshow(img);
hold on; plot(corners(:, 2), corners(:, 1), 'o');
print('output/ps4-1-c-1.png');

% transB image with Harris corners marked as  ps4-1-c-2.png
img = imread('input/transB.jpg');
R = harris_detector(img);
figure; imshow(R, []);
print('output/ps4-1-b-2.png');

corners = harris_corner(R);
figure; imshow(img);
hold on; plot(corners(:, 2), corners(:, 1), 'o');
print('output/ps4-1-c-2.png');

% simA    image with Harris corners marked as  ps4-1-c-3.png
img = imread('input/simA.jpg');
R = harris_detector(img);
figure; imshow(R, []);
print('output/ps4-1-b-3.png');

corners = harris_corner(R);
figure; imshow(img);
hold on; plot(corners(:, 2), corners(:, 1), 'o');
print('output/ps4-1-c-3.png');

% simB    image with Harris corners marked as  ps4-1-c-4.png
img = imread('input/simB.jpg');
R = harris_detector(img);
figure; imshow(R, []);
print('output/ps4-1-b-4.png');

corners = harris_corner(R);
figure; imshow(img);
hold on; plot(corners(:, 2), corners(:, 1), 'o');
print('output/ps4-1-c-4.png');


