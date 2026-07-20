%% Experiment 1: Introduction to MATLAB and Simulink for Control System Modeling
% Systems Engineering Department, University of Lagos
% Control Theory I Lab

clear; clc; close all;

%% Step 2: Define transfer function G(s) = 10 / (s^2 + 4s + 10)
num = [10];
den = [1 4 10];
G = tf(num, den);
disp('Transfer Function G(s):');
G

%% Step 3: Plot unit step response
figure(1);
step(G);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Unit Step Response of G(s) = 10/(s^2+4s+10)');
grid on;

%% Step 4: Plot impulse response and compare
figure(2);
impulse(G);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Unit Impulse Response of G(s) = 10/(s^2+4s+10)');
grid on;

% Optional: overlay both for visual comparison
figure(3);
step(G); hold on;
impulse(G);
legend('Step Response', 'Impulse Response');
title('Step vs Impulse Response Comparison');
grid on;
