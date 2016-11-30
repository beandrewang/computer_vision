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

[u, v] = basic_lk(img1, img2);
figure; imshow(img1, []); hold on; quiver(u, v);
print('output/ps5-1-a-1.png');

%% - the base Shift0  and  ShiftR5U5 as ps5-1-a-2.png
img2 = double(imread('input/TestSeq/ShiftR5U5.png'));
[u, v] = basic_lk(img1, img2);
figure; imshow(img1, []); hold on; quiver(u, v);
print('output/ps5-1-a-2.png');
