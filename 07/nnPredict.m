%TODO
function p = nnPredict(Theta1, Theta2, X)
%NNPREDICT Predict the label of an input given a trained neural network
%   p = NNPREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% predict based on the hypothesis
h_one = sigmoid([ones(m, 1) X] * Theta1');
h_two = sigmoid([ones(m, 1) h_one] * Theta2');

% assign into p, ignore the first returned value
[var, p] = max(h_two, [], 2);

% =========================================================================


end
