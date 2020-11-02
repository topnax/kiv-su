% J is the value of cost function
% grad is gradient of the cost function  with respect to parameters theta
% TODO
function [J, grad] = linRegCost(X, y, theta)

% Initialize some useful values
m = length(y); % number of training examples
J = 0;
prediction = X * theta;

J = (1/2 * m) * (prediction - y).' * (prediction - y);


% =========================================================================

end
