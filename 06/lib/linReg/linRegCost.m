% J is the value of cost function
% grad is gradient of the cost function  with respect to parameters theta
% TODO
function [J, grad] = linRegCost(X, y, theta, lambda)

% Initialize some useful values
m = length(y); % number of training examples
J = 0;
prediction = linRegPredict(X, theta);

% excluded the first theta value
theta1 = [0 ; theta(2:end, :)];


J = (1 / (2 * m)) * (prediction - y)' * (prediction - y)  + (lambda.lambda * (theta1' * theta1));
grad = (1 / ( m)) * X' * (X * theta - y) + (lambda.lambda * theta1);

% =========================================================================

end
