pkg load image;

clc;
clear all;
close all;

img = imread('flower.bmp');
img = double(rgb2gray(img));

[U, S, V] = svd(img);
top10Singulars = diag(S)(1 : 10);
fprintf('Top 10 singular values are: %d\n', top10Singulars);

% plot the top 10 Singulars
figure(1);
plot(S);

% reconstruct the image
svdImage = U * S * V';

% reconstruct the image with k = 10;
k = 10;
svdImage10 = U(:, 1 : k) * S(1 : k, 1 : k) * V(:, 1 : k)';

% reconstruct the image with k = 50;
k = 50;
svdImage50 = U(:, 1 : k) * S(1 : k, 1 : k) * V(:, 1 : k)';

% reconstruct the image with k = 100;
k = 100;
svdImage100 = U(:, 1 : k) * S(1 : k, 1 : k) * V(:, 1 : k)';

% show the images
figure(2);	
subplot(3, 2, 1); 
subimage(uint8(img));
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
title('original')

subplot(3, 2, 2); 
subimage(uint8(svdImage));
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
title('svd reconstruction');

subplot(3, 2, 3);
subimage(uint8(svdImage10));
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
title('k = 10');

subplot(3, 2, 4);
subimage(uint8(svdImage50));
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
title('k = 50');

subplot(3, 2, 5);
subimage(uint8(svdImage100));
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
title('k = 100');