% ps1
pkg load image;  % Octave only

clc;
close all;
clear all;


%% 1-a
img = imread(fullfile('input', 'ps1-input0.png'));  % already grayscale
%% TODO: Compute edge image img_edges
img_edges = edge(img, 'Canny');
figure; imshow(img_edges)
% save as output/ps1-1-a-1.png
imwrite(img_edges, fullfile('output', 'ps1-1-a-1.png'));  

%% 2-a
[H, theta, rho] = hough_lines_acc(img_edges);  % defined in hough_lines_acc.m
%% TODO: Plot/show accumulator array H, save as output/ps1-2-a-1.png
hough_line_acc_img = imadjust(mat2gray(H));
figure; 
imshow(hough_line_acc_img, 'XData', theta, 'YData', rho, ...
    'InitialMagnification', 'fit');
title('accumulator array H');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca, hot);

%% 2-b
peaks = hough_peaks(H, 15);  % defined in hough_peaks.m
%% TODO: Highlight peak locations on accumulator array, 
% save as output/ps1-2-b-1.png
figure;
imshow(H, [], 'XData', theta, 'YData', rho,'InitialMagnification', 'fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(theta(peaks(:,2)), rho(peaks(:,1)),'s','color','white');
print('output/ps1-2-b-1.png');

%% TODO: Rest of your code here
hough_lines_draw(img, 'output/ps1-2-c-1.png', peaks, rho, theta);


%% Use ps1-input0-noise.png - same image as before, but with noise. Compute a 
% modestly smoothed version of this image by using a Gaussian filter. Make σ at
% least a few pixels big.
img_noise = imread('input/ps1-input0-noise.png');
% figure, imshow(img_noise);

% smooth it
gauss_f = fspecial('gaussian', 9, 4);
img_smoothed = imfilter(img_noise, gauss_f, 'symmetric');
% figure, imshow(img_smoothed);

% save the smoothed img to output/ps1-3-a-1.png
imwrite(img_smoothed, 'output/ps1-3-a-1.png');

% find the edge
img_noise_edges = edge(img_noise, 'canny', 6);
img_smoothed_edges = edge(img_smoothed, 'sobel');
%figure, imshow(img_noise_edges);
figure, imshow(img_smoothed_edges);
imwrite(img_noise_edges, 'output/ps1-3-b-1.png');
imwrite(img_smoothed_edges, 'output/ps1-3-b-2.png');

% hough transform
[H, theta, rho] = hough_lines_acc(img_smoothed_edges);

peaks = hough_peaks(H, 20, 'Threshold', 0.4 * max(H(:)));  
figure;
imshow(H, [], 'XData', theta, 'YData', rho,'InitialMagnification', 'fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(theta(peaks(:,2)), rho(peaks(:,1)),'s','color','white');
print('output/ps1-3-c-1.png');

hough_lines_draw(img_noise, 'output/ps1-3-c-2.png', peaks, rho, theta);


img = imread('input/ps1-input1.png');
figure, imshow(img);

img_mono = rgb2gray(img);
figure, imshow(img_mono);

% smooth the image
gauss_f = fspecial('gaussian', 9, 4);
img_smoothed = imfilter(img_mono, gauss_f, 'symmetric');
figure, imshow(img_smoothed);
imwrite(img_smoothed, 'output/ps1-4-a-1.png');

% find the edge
img_edges = edge(img_smoothed, 'canny', 6);
figure, imshow(img_edges);
imwrite(img_edges, 'output/ps1-4-b-1.png');


% find the lines
[H, theta, rho] = hough_lines_acc(img_edges);
peaks = hough_peaks(H, 6, 'Threshold', 0.5 * max(H(:)));
figure;
imshow(H, [], 'XData', theta, 'YData', rho, 'InitialMagnification', 'fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(theta(peaks(:, 2)), rho(peaks(:, 1)), 's', 'color', 'green');
print('output/ps1-4-c-1.png');

hough_lines_draw(img_mono, 'output/ps1-4-c-2.png', peaks, rho, theta);


