clear;
clc;
close all;

Fs = 100;
T = 1/Fs;
L = 2 * Fs;
t = (0:L-1)*T;

x = sin(2*pi*5*t) + 0.5*sin(2*pi*20*t);

Y= fft(x);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

figure;
subplot(2,1,1);
stem(f, P1, 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
grid on;
title('Magnitude Spectrum of Sampled Signal (Discrete Fourier Analysis)');
xlabel('Frequency (Hz)');
ylabel('|P1(f)|');
xlim([0 50]);

num = [1];
den = [0.1, 1];
G = tf(num, den);

w = logspace(-1, 2, 100);
[mag, phase] = freqresp(G, w);
mag_vector = squeeze(mag);
f_continuous = w / (2*pi);

subplot(2,1,2);
semilogx(f_continuous, mag_vector, 'r', 'LineWidth', 2);
grid on;
title('Continuous Frequency Response Magnitude of G(s) = 1/(0.1s + 1)');
xlabel('Frequency (Hz) - Logarithmic Scale');
ylabel('Magnitude (Absolute Units)');
