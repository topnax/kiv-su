function [J, grad] = logRegCost(X, y, theta, options)
%TODO
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = logRegCost(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

m = size(X, 1);

% hypothesis

h = sigmoid(X * theta);
% J = - (1 / m) * sum(y .* log(h) + (1 - y) .* log(1 - h));
lambda = options.lambda;

J = (-1 / m) * sum(y .* log(h) + (1 - y) .* log(1 - h)) + lambda/(2 * m) * sum(theta(2:size(theta)).^2);

% do not regularize the first theta parameter
grad(1) = (1 / m) * sum((h - y) .* X(:, 1));

for i = 2 : size(grad)
    grad(i) = (1 / m) * sum((h - y) .* X(:, i)) + lambda / m * theta(i);
end


% =============================================================

end
