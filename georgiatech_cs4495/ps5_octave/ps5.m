clc;
clear all;
close all;

pkg load image;

%% Lucas Kanade Optical Flow

%% The images showing the x and y displacements either as images
%% (make sure you scale them so you can values) or as arrows
%% when computing motion between :
%% - The base Shift0 and ShiftR2 as ps5-1-a-1.png

img1 = double(imread('input/TestSeq/Shift0.png'));
img2 = double(imread('input/TestSeq/ShiftR2.png'));
[u, v] = basic_lk(img1, img2, 5);
figure; quiver(u, v);
saveas(1, 'output/ps5-1-a-1.png', 'png');

%% - the base Shift0  and  ShiftR5U5 as ps5-1-a-2.png
img2 = double(imread('input/TestSeq/ShiftR5U5.png'));
[u, v] = basic_lk(img1, img2, 9);
figure; quiver(u, v);
saveas(2, 'output/ps5-1-a-2.png', 'png');
