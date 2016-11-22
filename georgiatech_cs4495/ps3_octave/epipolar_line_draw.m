function epipolar_line_draw(imgb, F, pta, ptb, save)
    
    % convert the points to homogenous coordinate
    pta = [pta, ones(size(pta, 1), 1)];
    ptb = [ptb, ones(size(ptb, 1), 1)];
    
    pbul = [1; 1; 1];   % the point at up left
    pbbl = [1; size(imgb, 1); 1];   % the point at bottom left
    pbur = [size(imgb, 2); 1; 1];    % the point at up right
    pbbr = [size(imgb, 2); size(imgb, 1); 1]; % the point at bottom right
    ll = cross(pbul, pbbl); % the left boundary line
    lr = cross(pbur, pbbr); % the right boundary line  
    x = 1 : size(imgb, 2);
    
    figure;
    imshow(imgb);
    for i = 1 : size(pta, 1)
        %% the epipolar line in image b
        lb = F * pta(i, :)';
        %% get the left and right boundaries of the image b 
        pbl = cross(lb, ll); % the intersection of epipolar line and left boundary line
        pbr = cross(lb, lr); % the intersection of epipolar line and right boundary line
        
        %% convert to inhomogeneous
        pbl = [pbl(1) / pbl(3); pbl(2) / pbl(3)];
        pbr = [pbr(1) / pbr(3); pbr(2) / pbr(3)];
        
        %% plot
        y = pbr(2) + (x - pbr(1)) * (pbl(2) - pbr(2)) / (pbl(1) - pbr(1));
        hold on;
        plot(ptb(:, 1), ptb(:, 2), 's');
        hold on;
        plot(x, y, 'color', 'green');
    end
    print(save);
end