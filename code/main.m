% learning rate = lambda
% starting point = w_start
% maximum number of steps = N_max
% termination tolerance = toler

lambda = 0.1;
w1 = 5;
w2 = 5;
N_max = 10000;
toler = 1e-6;
n_to_coverge = 0;

for i = 1:N_max

    w1_new = w1 - lambda * dfdw1(w1, w2);
    w2_new = w2 - lambda * dfdw2(w1, w2);
    
    gradient_norm = norm(w1_new, w2_new); %calculates Euclidean distance

    w1 = w1_new;
    w2 = w2_new;

    if(gradient_norm <= toler)
        break;
    end

    n_to_coverge = n_to_coverge + 1;
    
end

disp(['Learning Rate: lambda = ', num2str(lambda)]);
disp(['Maximum Number of Steps = ', num2str(N_max)]);
disp(['Termination Tolerance = ', num2str(toler)]);
disp(['Minimum: w1 = ', num2str(w1), ', w2 = ', num2str(w2)]);
disp(['Number of iterations: ', num2str(n_to_coverge)]);