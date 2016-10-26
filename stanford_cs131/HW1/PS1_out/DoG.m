clc;
clear all;
close all;

K = [1.0 1.2 1.4 1.6 1.8 2.0];
sigma = 1;
x = -100 : 100;

figure;

for k = K
	idx = find(k == K);
	gkSigma = 1 / sqrt(2 * pi) / (k * sigma) * exp((-x .^ 2) / 2 / ((k * sigma) ^ 2));
	
	subplot(6, 3, 3 * (idx - 1) + 1);
	plot(x, gkSigma);
	name = sprintf('1-D Gaussian with k = %f', k);
	title(name);
	
	gkSigmaDerivative = 1 / sqrt(2 * pi) / (k * sigma) * exp((-x .^ 2) / 2 / ((k * sigma) ^ 2)) \
		.* (-x / ((k * sigma) ^ 2));
		
	subplot(6, 3, 3 * (idx - 1) + 2);
	plot(x, gkSigmaDerivative);
	name = sprintf('1-D Gaussian 1st derivative with k = %f', k);
	title(name);
	
	gkSigma2ndDerivative = 1 / sqrt(2 * pi) / (k * sigma) * (exp((-x .^ 2) / 2 / ((k * sigma) ^ 2)) \
		.* ((-1 / ((k * sigma) ^ 2)) + (-x / ((k * sigma) ^ 2)) .^ 2));
		
	subplot(6, 3, 3 * (idx - 1) + 3);
	plot(x, gkSigma2ndDerivative);
	name = sprintf('1-D Gaussian 2nd derivative with k = %f', k);
	title(name);
end

figure;
for k = K
	idx = find(k == K);
	gSigma = 1 / sqrt(2 * pi) / (sigma) * exp((-x .^ 2) / 2 / ((sigma) ^ 2));
	gkSigma = 1 / sqrt(2 * pi) / (k * sigma) * exp((-x .^ 2) / 2 / ((k * sigma) ^ 2));
	D = (gkSigma - gSigma) / (k * sigma - sigma);
	
	subplot(6, 3, 3 * (idx - 1) + 3);
	plot(x, D);
	name = sprintf('Difference of Gaussian with k = %f', k);
	title(name);
end


