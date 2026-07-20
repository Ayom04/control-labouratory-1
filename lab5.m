clear; clc; close all;

A = [0, 1; -20, -4];
B = [0; 1];
C = [1, 0];
D = 0;

sys_ss = ss(A, B, C, D);
disp(sys_ss);

figure;
[y_ss, t_ss] = step(sys_ss);

plot(t_ss, y_ss, 'b-', 'LineWidth', 2.5, 'DisplayName', 'State Space Model');
hold on;

sys_tf = tf(sys_ss);
disp(sys_tf);

[y_tf, t_tf] = step(sys_tf, t_ss);

plot(t_tf, y_tf, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Transfer Function Model');
grid on;

title('Consistency Comparison: State Space vs. Transfer Function Step Response');
xlabel('Time (seconds)');
ylabel('Amplitude (Position)');
legend('Location', 'southeast');
