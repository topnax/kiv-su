
% This function should initialize and train the parameters as column vector and return it
% as a theta parameter. The theta will be passed to predict function
% theta history should be 2xN matrix of theta values in each of 1 to N iterations
function [theta, theta_history, j_history] = train(X, y, init_theta, alpha, iterations)
%TODO
  theta = init_theta;

  % init values  
  train_length = length(y);  
  theta_history = zeros(train_length, 2);
  j_history = zeros(train_length, 1);
    
  for c = 1:iterations
    h = predict(X, theta);
   
    % compute t1 & t2
    t_1 = theta(1) - alpha * (1 / train_length) * sum(h - y);
    t_2 = theta(2) - alpha * (1 / train_length) * sum((h - y) .* X(:, 2));
    
    theta(1) = t_1;
    theta(2) = t_2;
    
    % compute the current cost and store it in j_history
    j_history(c) = computeCost(X, y, theta);
   
    % store the theta in theta_history
    theta_history(c,:) = theta;
  end
end
