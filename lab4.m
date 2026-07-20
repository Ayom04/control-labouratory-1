clear; 
clc; 
close all;

syms t s
syms y(t) u(t)

ode = diff(y, t, 2) + 3*diff(y, t, 1) + 2*y == u(t);

syms Y U
ode_laplace = s^2*Y + 3*s*Y + 2*Y == U;

H_sym = 1 / (s^2 + 3*s + 2);
disp(H_sym);

U_step = 1/s;
Y_step_sym = H_sym * U_step;

y_step_time_sym = ilaplace(Y_step_sym, s, t);
disp(y_step_time_sym);

num_num = [1];
den_num = [1, 3, 2];
sys_tf = tf(num_num, den_num);

t_vec = 0:0.05:6;
y_numeric_from_sym = double(subs(y_step_time_sym, t, t_vec));

[y_numeric_tf, t_out] = step(sys_tf, t_vec);

figure;
plot(t_vec, y_numeric_from_sym, 'ro', 'MarkerSize', 6, 'DisplayName', 'Symbolic Solution (ilaplace)');
hold on;
plot(t_out, y_numeric_tf, 'b-', 'LineWidth', 2, 'DisplayName', 'Numeric Solution (step)');
grid on;
title('Comparison of Symbolic and Numeric Step Responses');
xlabel('Time (seconds)');
ylabel('Amplitude');
legend('Location', 'southeast');

sys_zpk = zpk(sys_tf);
fprintf('--- Step 8: Zero-Pole-Gain (zpk) Representation ---\n');
disp(sys_zpk);

poles = pole(sys_tf);
zeros = zero(sys_tf);
disp(poles);
disp(zeros);
