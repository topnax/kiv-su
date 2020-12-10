function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda, trainFunc)
%LEARNINGCURVE Generates the train and cross validation set errors needed 
%to plot a learning curve
%   [error_train, error_val] = ...
%       LEARNINGCURVE(X, y, Xval, yval, lambda) returns the train and
%       cross validation set errors for a learning curve. In particular, 
%       it returns two vectors of the same length - error_train and 
%       error_val. Then, error_train(i) contains the training error for
%       i examples (and similarly for error_val(i)).
%
%   In this function, you will compute the train and test errors for
%   dataset sizes from 1 up to m. In practice, when working with larger
%   datasets, you might want to do this in larger intervals.
%

% Number of training examples
m = size(X, 1)
n = size(Xval, 1)

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

options.lambda = lambda;
options.alpha = 0.001;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return training errors in 
%               error_train and the cross validation errors in error_val. 
%               i.e., error_train(i) and 
%               error_val(i) should give you the errors
%               obtained after training on i examples.
%

for i = 1:m
    % each iteration select from 1 to i that goes up to m    
	X_train = X(1:i, :);
	y_train = y(1:i);
	
	% calc the theta
	theta = trainFunc(X_train, y_train, options);	

	% compute train and cross validation errors 
	[J_train, _] = linRegCost(X_train, y_train, theta, options); 
	[J_val, _]= linRegCost(Xval, yval, theta,options);

    %storing the result 
    error_train(i) = J_train;  
    error_val(i) = J_val;
end

% =========================================================================

end
