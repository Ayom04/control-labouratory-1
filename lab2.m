clear;
clc;
close all;

num = [5];
den = [1, 2, 5];
G = tf(num,den);

t = 0:0.01:10;
u_ramp = t;

subplot(2,1,1);
[y_ramp, t_out] = lsim(G, u_ramp, t);
plot(t, u_ramp, 'r--', 'LineWidth', 1.5); hold on;
plot(t, y_ramp, 'b', 'LineWidth', 1.5);
grid on;
title('System Response to a Ramp Input');
xlabel('Time (seconds)');
ylabel('Amplitude');
legend('Ramp Input (u = t)', 'System Output (y)', 'Location','northwest');

u_sine = sin(2*t);
y_sine = lsim(G, u_sine, t);
subplot(2,1,2);
plot(t, u_sine, 'r--', 'LineWidth', 1.5); hold on;
plot(t, y_sine, 'b', 'LineWidth', 1.5);
grid on;
title('System Response to a Sinusoidal Input u=sin(2t)');
xlabel('Time (seconds)');
ylabel('Amplitude');
legend('Sine Input', 'System Output (y)', 'Location','southwest');
