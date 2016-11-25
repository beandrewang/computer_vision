function s = non_maximal_suppression(P)
    %% margin x margin non-maximal suppression
    margin = 5;
    maximal = max(P(:));
    s = [];
    [h, w] = size(P);
    
    while(maximal ~= 0)
        [r, c] = find(P == maximal);
        r = r(1); c = c(1);
        s = [s; [r, c]];
        P(max([r - floor(margin / 2), 1]) : min([floor(r + margin / 2), h]), ...
          max([c - floor(margin / 2), 1]) : min([floor(c + margin / 2), w])) = 0;
        maximal = max(P(:));
    end
end
