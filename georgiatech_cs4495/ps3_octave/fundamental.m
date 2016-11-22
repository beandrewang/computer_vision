function F = fundamental(a, b)
    %% computing the fundamental matrix by least square
    if(size(a, 1) ~= size(b, 1))
        printf('number of points mismatch\n');
        return;
    end
    
    if(size(a, 1) < 8)
        printf('8 points needed at least\n')
        return;
    end
    
    ah = [a ones(size(a, 1), 1)];
    bh = [b ones(size(b, 1), 1)];
    
    A = zeros(size(a, 1), 8);
    c = -ones(size(a, 1), 1);
    
    for i = 1 : size(a, 1)
        A(i, :) = [b(i, 1) * ah(i, :) b(i, 2) * ah(i, :) a(i, :)];
    end
    
    F = A \ c;
    F = [F; 1];
    F = reshape(F, 3, 3)';
    
    [U D V] = svd(F);
    D(3, 3) = 0;
    F = U * D * V';
end
