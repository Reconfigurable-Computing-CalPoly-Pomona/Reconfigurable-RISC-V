% Benjamin Kueffler
% Generates a noisy signal and outputs to a file
clear all;
close all;
pkg load signal;

% Number of bytes
b = 4;
% Number of samples
n = 60000 / b;
k = 0:(n - 1);

% Frequency
w = 2;

% Variance of noise
var = .1;

% Clean Signal
d = 2 * sin(2 * pi * w * (k / n));

% Noisy Signal
xa = int32(1000 * (d + randn([1,n]) * sqrt(var)))';

% Start a wall-clock timer
tic();

% Perform median filter for verification
xf = medfilt1(xa, 3);

% Record the time it took to perform the median filter
elapsed_time = toc();

printf("Medfilt1 process time: %f ms.\n", elapsed_time * 1000);
save gen_signal.txt xa -ascii;
save verif_signal.txt xf -ascii;

figure(1)
hold on;
plot(k, xa)
plot(k, xf)

