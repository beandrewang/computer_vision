function M = projection(pt3d, pt2d)
    %% get the projection matrix M from 3D to 2D
    
    if(size(pt3d, 1) < 6 || size(pt2d, 1) < 6)
        printf('at least 6 points needed!\n');
        return;
    end
    
    if(size(pt2d, 1) ~= size(pt3d, 1))
        printf('please check the number of points, 3dpoints : 2dpoints\n', ...
            size(pt2d, 1),
            size(pt3d, 1));
        return;
    end
    
    % convert the points to homgeneous coordinate
    pt3d_h = [pt3d ones(size(pt3d, 1), 1)];
    pt2d_h = [pt2d ones(size(pt2d, 1), 1)];
    
    % generate the matrix A and b
    A = zeros(2 * size(pt3d_h, 1), 11);
    b = zeros(2 * size(pt3d_h, 1), 1);
    for i = 1 : size(pt3d, 1)
        A(2 * i - 1, :) = [pt3d_h(i, :) zeros(1, 4) -(pt3d(i, :) .* pt2d(i, 1))];
        A(2 * i, :)     = [zeros(1, 4) pt3d_h(i, :) -(pt3d(i, :) .* pt2d(i, 2))];
        b(2 * i - 1)    = pt2d(i, 1);
        b(2 * i)        = pt2d(i, 2);
    end
    
    M = A \ b;
    M = [M; 1];
    
    M = reshape(M, 4, 3)';
end
