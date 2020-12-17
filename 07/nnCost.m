%TODO
function [J grad] = nnCost(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOST Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOST(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));



% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in the main script
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function (one-hot vector).

% identity matrix of num_labels size
I = eye(num_labels);

% matrix x*num_labels filled with zeros
Y = zeros(m, num_labels);

% make sure to have ones on the diagonal
for i=1:m
  Y(i, :)= I(y(i), :);
end

% feedforwarding

% compute a1 (first layer)
a1 = [ones(m, 1) X];

% compute z2 and a2 (hidden layer)
z2 = a1 * Theta1';
a2 = [ones(size(z2, 1), 1) sigmoid(z2)];

% compute z3 then put it into the sigmoid function
z3 = a2 * Theta2';
a3 = sigmoid(z3);

% forwarded
h = a3;

% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients

p = sum(sum(Theta1(:, 2:end).^2, 2)) + sum(sum(Theta2(:, 2:end).^2, 2));

% calculate J as presented in the lectures - do not use for loops, do also compute sigma3 and sigma2
% use calculated penalty from the previous line

J = sum(sum((-Y) .* log(h) - (1 - Y) .* log(1 - h), 2)) / m + lambda * p / (2 * m);

sigma3 = a3 .- Y;
sigma2 = ((sigma3 * Theta2) .* sigmoidGradient([ones(size(z2, 1), 1) z2]))(:, 2:end);

% difference
delta1 = (sigma2' * a1);
delta2 = (sigma3' * a2);

%
% Part 3: Implement regularization with the cost function and gradients.
%
%

Theta1_grad = (delta1 ./ m) + [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)] * (lambda / m);
Theta2_grad = (delta2 ./ m) + [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)] * (lambda / m);

% =========================================================================
% Unroll gradients

grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
