% Benjamin Kueffler
% Plots the noisy and filtered signal for inspection
clear all;
close all;

% Number of samples
b = 4;
n = 60000 / b;
k = 0:(n - 1);

# Noisy Signal
xa = load("gen_signal.txt", "-ascii");

# Filtered Signal using octave medflt1 function
xf = load("verif_signal.txt", "-ascii");

# Filtered signal from processor memory
xo = load("median_bench_output_ascii.txt", "-ascii");

figure(1)
hold on;
xlabel('Sample (k)');ylabel('Value');title("Median Filter (n = 3) using medflt1")
xlim([1,n])
plot(k, xa)
plot(k, xf)
legend ({"Input", "medflt1 Output"}, "location", "northeast");

figure(2)
hold on;
xlabel('Sample (k)');ylabel('Value');title("Median Filter (n = 3) using RISC V processor")
xlim([1,n])
plot(k, xa)
plot(k, xo)
legend ({"Input", "RISC V Processor Output"}, "location", "northeast");
