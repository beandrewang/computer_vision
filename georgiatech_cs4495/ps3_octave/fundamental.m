function [F, d] = fundamental(a, b)
    %% computing the fundamental matrix by least square, F maps the epipolar line 
    % in image b associated with the points in image b
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
    
    K = 8;
    times = 30;
    distance = Inf;
    A = zeros(K, 8);
    c = -ones(K, 1);
    d = zeros(times, 1);

    for j = 1 : times
        r = randperm(size(ah, 1));
        aah = ah(r(1 : K), :);
        aa = a(r(1 : K), :);
        bb = b(r(1 : K), :);
        for i = 1 : K
            A(i, :) = [bb(i, 1) * aah(i, :) bb(i, 2) * aah(i, :) aa(i, :)];
        end
        
        f = A \ c;
        f = [f; 1];
        f = reshape(f, 3, 3)';
        
        [U D V] = svd(f);
        D(3, 3) = 0;
        f = U * D * V';
        
        d(j) = sumsq((bh * f * ah')(:));
        if(d(j) < distance)
            distance = d;
            F = f;
        end
    end
end
