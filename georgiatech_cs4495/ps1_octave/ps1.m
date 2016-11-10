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