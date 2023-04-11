% learning rate = lambda
% starting point = w_start
% maximum number of steps = N_max
% termination tolerance = toler

disp('Inputs:');
lambda = input('Learning Rate (lambda): ');
%w1_value = input('w1 starting point: ');
%w2_value = input('w2 starting point: ');
%f_input = input('Enter a function f(w1,w2): ', 's');

w1_value = 5;
w2_value = 5;
f_input = 'w1.^2 +1*w1.*w2 + 2*w2.^2';


f = str2func(['@(w1, w2) ' f_input]);

syms w1 w2;

partd_w1 = diff(f(w1, w2), w1);
partd_w2 = diff(f(w1, w2), w2);

N_max = 1000;
toler = 1e-6;
n_to_coverge = 0;

w1_history = zeros(1);
w2_history = zeros(1);

w1_history(1) = w1_value;
w2_history(1) = w2_value;

for i = 1:N_max

    dfdw1 = double(subs(partd_w1, [w1,w2], [w1_value, w2_value]));
    dfdw2 = double(subs(partd_w2, [w1, w2], [w1_value, w2_value]));

    w1_new = w1_value - lambda * dfdw1;
    w2_new = w2_value - lambda * dfdw2;
    
    gradient_norm = norm(w1_new, w2_new); %calculates Euclidean distance

    w1_value = w1_new;
    w2_value = w2_new;

    w1_history(end+1) = w1_value;
    w2_history(end+1) = w2_value;

    if(gradient_norm <= toler)
        break;
    end

    n_to_coverge = n_to_coverge + 1;
    
end

z = given_function(w1_value, w2_value);

disp(['Learning Rate: lambda = ', num2str(lambda)]);
disp(['Maximum Number of Steps = ', num2str(N_max)]);
disp(['Termination Tolerance = ', num2str(toler)]);
disp(['Minimum:']);
disp(['w1 = ', num2str(w1_value)]);
disp(['w2 = ', num2str(w2_value)]);
disp(['F(w1,w2) = ', num2str(z)]);
disp(['Number of steps: ', num2str(n_to_coverge)]);

plot(w1_history, w2_history);
xlabel('w1');
ylabel('w2');

[w1_plot, w2_plot] = meshgrid(-5:0.1:5);
w3 = given_function(w1_plot, w2_plot);
surf(w1_plot, w2_plot, w3, 'EdgeColor', 'k', 'FaceAlpha', 0.5);
xlabel('w1');
ylabel('w2');
zlabel('f(w1,w2)');
title('Plot of f = w1.^2 + 1*w1.*w2 + 2*w2.^2');

hold on
plot3(w1_history, w2_history, given_function(w1_history, w2_history), 'r', 'LineWidth', 2);
hold off
