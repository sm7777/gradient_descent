% learning rate = lambda
% starting point = w_start
% maximum number of steps = N_max
% termination tolerance = toler

lambda = 0.01;
w1 = 5;
w2 = 5;
N_max = 1000;
toler = 1e-6;
n_to_coverge = 0;

w1_history = zeros(1);
w2_history = zeros(1);

w1_history(1) = w1;
w2_history(1) = w2;

for i = 1:N_max

    w1_new = w1 - lambda * dfdw1(w1, w2);
    w2_new = w2 - lambda * dfdw2(w1, w2);
    
    gradient_norm = norm(w1_new, w2_new); %calculates Euclidean distance

    w1 = w1_new;
    w2 = w2_new;

    w1_history(end+1) = w1;
    w2_history(end+1) = w2;

    if(gradient_norm <= toler)
        break;
    end

    n_to_coverge = n_to_coverge + 1;
    
end

z = given_function(w1, w2);

disp(['Learning Rate: lambda = ', num2str(lambda)]);
disp(['Maximum Number of Steps = ', num2str(N_max)]);
disp(['Termination Tolerance = ', num2str(toler)]);
disp(['Minimum:']);
disp(['w1 = ', num2str(w1)]);
disp(['w2 = ', num2str(w2)]);
disp(['F(w1,w2) = ', num2str(z)]);
disp(['Number of iterations: ', num2str(n_to_coverge)]);

plot(w1_history, w2_history);
xlabel('w1');
ylabel('w2');

[w1_plot, w2_plot] = meshgrid(-5:0.1:5);
z = given_function(w1_plot, w2_plot);
surf(w1_plot, w2_plot, z);
xlabel('w1');
ylabel('w2');
zlabel('f(w1,w2)');
title('Plot of f = w1.^2 + 1*w1.*w2 + 2*w2.^2');

hold on
plot3(w1_history, w2_history, given_function(w1_history, w2_history), 'r', 'LineWidth', 2);
hold off
