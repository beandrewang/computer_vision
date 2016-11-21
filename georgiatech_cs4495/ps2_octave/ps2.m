% ps2
clc;
clear all;
close all;

pkg load image;  % Octave only


%% 1-a
% Read images
L = im2double(imread(fullfile('input', 'pair0-L.png')));
R = im2double(imread(fullfile('input', 'pair0-R.png')));

% Compute disparity
D_L = disparity_ssd(L, R);
%D_R = disparity_ssd(R, L);

% TODO: Save output images (D_L as output/ps2-1-a-1.png and D_R as 
% output/ps2-1-a-2.png)
% Note: They may need to be scaled/shifted before saving to show results 
% properly
figure, imshow(D_L, []);
print('output/ps2-1-a-1.png');
%figure, imshow(D_R, []);
%print('output/ps2-1-a-2.png');


%{
% TODO: Rest of your code here
L = im2double(rgb2gray(imread('input/pair1-L.png')));
R = im2double(rgb2gray(imread('input/pair1-R.png')));
D_L = disparity_ssd(L, R);
figure, imshow(D_L, []);
print('output/ps2-2-a-1.png');
D_R = disparity_ssd(R, L);
figure, imshow(D_R, []);
print('output/ps2-2-a-2.png');
%}
