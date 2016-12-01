function [u, v] = basic_lk(img1, img2, win_size)

	u = zeros(size(img1));
	v = u;

	% blur the images
	guass_size = 5; gauss_sigma = 3;
	gauss = fspecial('gaussian', guass_size, gauss_sigma);
	img_smoothed1 = imfilter(img1, gauss);
	img_smoothed2 = imfilter(img2, gauss);
	
	sobel = fspecial('sobel');
	Iy = imfilter(img_smoothed1, sobel);
	Ix = imfilter(img_smoothed1, -sobel');
	It = img2 - img1;
	
	IxIx = Ix .^ 2;
	IxIy = Ix .* Iy;
	IyIy = Iy .^ 2;
	IxIt = Ix .* It;
	IyIt = Iy .* It;
	
	win = ones(win_size, win_size);
	
	IxIx_win = imfilter(IxIx, win);
	IxIy_win = imfilter(IxIy, win);
	IyIy_win = imfilter(IyIy, win);
	IxIt_win = imfilter(IxIt, win);
	IyIt_win = imfilter(IyIt, win);
	
	for i = 1 : size(img1, 1)
		for j = 1 : size(img1, 2)
			dir = [IxIx_win(i, j), IxIy_win(i, j); ...
			     IxIy_win(i, j), IyIy_win(i, j)] \ ...
			   -[IxIt_win(i, j); IyIt_win(i, j)];
			u(i, j) = dir(1);
			v(i, j) = dir(2);
		end
	end
end

