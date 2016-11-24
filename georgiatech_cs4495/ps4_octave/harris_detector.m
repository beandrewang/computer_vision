function R = harris_detector(img)
    win = [2 3 2; 1 8 1; 2 3 2]; % guassian like window
    Ix_win = zeros(size(win));
    Iy_win = zeros(size(win));
    R = zeros(size(img));
    alpha = 0.04;
    
    [gx, gy] = gradient(img);
    
    gx = [zeros(size(gx, 1), 1) gx zeros(size(gx, 1), 1)];
    gx = [zeros(1, size(gx, 2)); gx; zeros(1, size(gx, 2))];
    
    gy = [zeros(size(gy, 1), 1) gy zeros(size(gy, 1), 1)];
    gy = [zeros(1, size(gy, 2)); gy; zeros(1, size(gy, 2))];
    
    for j = 1 : size(gx, 1) - 2
        for i = 1 : size(gx, 2) - 2
            cx = i + 1;
            cy = j + 1;
            Ix_win = [gx(cy - 1, cx - 1) gx(cy - 1, cx) gx(cy - 1, cx + 1); ...
                      gx(cy, cx - 1) gx(cy, cx) gx(cy, cx + 1); ...
                      gx(cy + 1, cx - 1) gx(cy + 1, cx) gx(cy + 1, cx + 1)];
            Iy_win = [gy(cy - 1, cx - 1) gy(cy - 1, cx) gy(cy - 1, cx + 1); ...
                      gy(cy, cx - 1) gy(cy, cx) gy(cy, cx + 1); ...
                      gy(cy + 1, cx - 1) gy(cy + 1, cx) gy(cy + 1, cx + 1)];
            
            M = zeros(2, 2);
            for n = 1 : 9
                M = M + win(:)(n) * [Ix_win(:)(n) ^ 2 Ix_win(:)(n) * Iy_win(:)(n);
                             Ix_win(:)(n) * Iy_win(:)(n) Iy_win(:)(n) ^ 2];
            end
            R(cy - 1, cx - 1) = det(M) - alpha * (trace(M) .^ 2);
        end
    end
end
