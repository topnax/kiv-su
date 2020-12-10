% J is the value of cost function
% grad is gradient of the cost function  with respect to parameters theta
% TODO
function [J, grad] = linRegCost(X, y, theta, options)

% Initialize some useful values
m = length(y); % number of training examples
J = 0;
h = linRegPredict(X, theta);

lambda = options.lambda;

% do not regularize the first theta parameter
theta_reg = [0;theta(2:end, :);];

% use lambda regularization parameter
J = (1 / (2 * m)) * sum((h - y) .^ 2) + (lambda / (2 * m)) * theta_reg' * theta_reg;

% add lambda
grad = (1 / m) * (X' * (h - y) + lambda * theta_reg);
grad = grad(:);

end
