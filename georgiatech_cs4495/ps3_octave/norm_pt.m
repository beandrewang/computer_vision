function [normpt T] = norm_pt(pt)
    cu = mean(pt(:));
    cv = mean(pt(:));
    
    s = 1 / std(pt(:));
    
    T = [s 0 0; 0 s 0; 0 0 1] * [1 0 -cu; 0 1 -cv; 0 0 1];
    normpt = T * [pt ones(size(pt, 1), 1)]';
    normpt = normpt(1 : 2, :)';
end