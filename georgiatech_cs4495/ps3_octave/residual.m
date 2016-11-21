function d = residual(pt2d, pt3d, M)
    if(size(pt2d, 1) ~= size(pt3d, 1))
        printf('unmatched 2d - 3d\n');
        return;
    end
    
    pt2d_h = [pt2d ones(size(pt2d, 1), 1)];
    pt3d_h = [pt3d ones(size(pt3d, 1), 1)];
    
    d = sqrt(sumsq((pt2d_h' - M * pt3d_h')(:)));
end