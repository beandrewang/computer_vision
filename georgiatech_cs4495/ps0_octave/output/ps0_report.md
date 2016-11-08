> Which looks more like what you’d expect a monochrome image to look like? Would
> you expect a computer vision algorithm to work on one better than the other?

The red monochrome seems look more like as what I expected. No, I don't expect 
an algorithm to work on one better than the other, I want like they worked on
both as the same result. 

> What is the min and max of the pixel values of img1_green? What is the mean? 
> What is the standard deviation?  And how did you compute these?

max: 237
min: 1
mean: 52.5592
std: 42.2787

```matlab
img1_green_max = max(img1_green(:));
img1_green_min = min(img1_green(:));
img1_green_mean = mean(img1_green(:));
img1_green_std = std(img1_green(:));
printf('max:\t%d\nmin:\t%d\nmean:\t%d\nstd:\t%d\n', img1_green_max, \
        img1_green_min, 
        img1_green_mean, 
        img1_green_std);

```

> What do negative pixel values mean anyways?

The negative pixel values mean the intensity of the right pixel is bigger than 
the current pixel's. 

> Which looks better? Why?

The blue with noise looks better. 
Because the blue channel is much big than the green channel. So the SNR is 
smaller than the green channel. 



