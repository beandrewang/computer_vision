clc;
clear all;
close all;

pkg load image;

pt_3d = load('input/pts3d-norm.txt');
pt_2d = load('input/pts2d-norm-pic_a.txt');

M = projection(pt_3d, pt_2d);
printf('The matrix M you recovered from the normalized points is :\n');
disp(M);
uv = M * [pt_3d(end, :) 1]';
printf('\n');
printf('The <u, v> projection of the last point given your M matrix is <%f, %f>\n', uv(1), uv(2));
        
D = residual(pt_2d, pt_3d, M);
printf('\n');
printf('The residual between that projected location and the actual one given is : \n');
disp(D');

pt_3d = load('input/pts3d.txt');
pt_2d = load('input/pts2d-pic_b.txt');

k = [8 12 16];
times = 10;
D = Inf;
d = zeros(10, 3); 

for n = 1 : length(k)
    for i = 1 : times
        % randomly choose k points from the 2D list and their corresponding 3d
        % points
        r = randperm(size(pt_3d, 1));
        pt2d = pt_2d(r(1 : k(n)), :);
        pt3d = pt_3d(r(1 : k(n)), :);
        % Compute the projection matrix M on the chosen points.
        m = projection(pt3d, pt2d);
        % Pick 4 points not in your set of k and compute the average residual
        d(i, n) = residual(pt_2d(r(k(n) + 1 : k(n) + 4), :), pt_3d(r(k(n) + 1 : k(n) + 4), :), M);
        if(d(i, n) < D)
            D = d(i, n);
            M = m;
        end
    end
end

printf('\n');
printf('Average residual for each trial of each k (10x3)\n');
disp(d);

printf('\n');
printf('The best M matrix (3x4)\n');
disp(M);

C = -pinv(M(:, 1 : end - 1)) * M(:, end);
printf('\n');
printf('The location of the camera in real 3D world coordinates is: \n')
disp(C);

pta = load('input/pts2d-pic_a.txt');
ptb = load('input/pts2d-pic_b.txt');

[F, d] = fundamental(pta, ptb);
printf('\n');
printf('The fundamental matrix generated from your least squares function is: \n');
disp(F);

imga = imread('input/pic_a.jpg');
epipolar_line_draw(imga, F', ptb, pta, 'output/ps3-2-c-1.png');

imgb = imread('input/pic_b.jpg');
epipolar_line_draw(imgb, F, pta, ptb, 'output/ps3-2-c-2.png');


[normpta, Ta] = norm_pt(pta);
[normptb, Tb] = norm_pt(ptb);
F = fundamental(normpta, normptb);
printf('Ta: \n');
disp(Ta);
printf('Tb: \n');
disp(Tb);
printf('F: \n');
disp(F);

F = Tb' * F * Ta;
printf('F: \n');
disp(F);

% there might be something wrong with the F, the epipolar line is not better 
% than the original.
epipolar_line_draw(imga, F', ptb, pta, 'output/ps3-2-e-1.png');
epipolar_line_draw(imgb, F, pta, ptb, 'output/ps3-2-e-2.png');
