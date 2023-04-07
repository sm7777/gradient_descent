% learning rate = lambda
% starting point = w_start
% maximum number of steps = N_max
% termination tolerance = toler

lambda = 0.1;


w1_new = w1_old - lambda * dfdw1(w1, w2);
w2_new = w2_old - lambda * dfdw2(w1, w2);