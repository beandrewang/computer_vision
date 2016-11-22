function epipolar_line_draw(imgb, F, pta, ptb, save)
    
    % convert the points to homogenous coordinate
    pta = [pta, ones(size(pta, 1), 1)];
    ptb = [ptb, ones(size(ptb, 1), 1)];

    %% draw the epipolar line in the img
    lb = F * pta';
    
    pbul = [1; 1; 1];   % the point at up left
    pbbl = [size(imgb, 1); 1; 1];   % the point at bottom left
    pbur = [1; size(imgb, 2); 1];    % the point at up right
    pbbr = [size(imgb, 1); size(imgb, 2); 1]; % the point at bottom right
    x = 1 : size(imgb, 2);
    
    figure;
    imshow(imgb);
    for i = 1 : size(lb, 2)
        %% get the left and right boundaries of the image b 
        ll = cross(pbul, pbbl); % the left boundary line
        pbl = cross(lb(:, i), ll); % the intersection of epipolar line and left boundary line
             
        lr = cross(pbur, pbbr); % the right boundary line        
        pbr = cross(lb(:, i), lr); % the intersection of epipolar line and right boundary line
        
        y = pbr(2) + (x - pbr(1)) * (pbl(2) - pbr(2)) / (pbl(1) - pbr(1));
        hold on;
        plot(x, y, 'color', 'green');
    end
    print(save);
end