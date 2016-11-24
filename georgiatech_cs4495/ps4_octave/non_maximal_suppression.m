function s = non_maximal_suppression(P)
    %% 5x5 non-maximal suppression
    maximal = max(P(:));
    s = [];
    while(maximal ~= 0)
        [r, c] = find(P == maximal);
        s = [s; [r, c]];
        P(r - 2 : r + 2, c - 2 : c + 2) = 0;
        maximal = max(P(:));
    end
end