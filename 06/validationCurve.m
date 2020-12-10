function [lambda_vec, error_train, error_val] = ...
    validationCurve(X, y, Xval, yval, trainFunc)
%VALIDATIONCURVE Generate the train and validation errors needed to
%plot a validation curve that we can use to select lambda
%   [lambda_vec, error_train, error_val] = ...
%       VALIDATIONCURVE(X, y, Xval, yval) returns the train
%       and validation errors (in error_train, error_val)
%       for different values of lambda. You are given the training set (X,
%       y) and validation set (Xval, yval).
%

% Selected values of lambda (you should not change this)
lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

% You need to return these variables correctly.
error_train = zeros(length(lambda_vec), 1);
error_val = zeros(length(lambda_vec), 1);

options.alpha = 0.2;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return training errors in 
%               error_train and the validation errors in error_val. The 
%               vector lambda_vec contains the different lambda parameters 
%               to use for each calculation of the errors, i.e, 
%               error_train(i), and error_val(i) should give 
%               you the errors obtained after training with 
%               lambda = lambda_vec(i)

for i = 1:length(lambda_vec),
    X_train = X(1:i, :);
    y_train = y(1:i);

    % load the lambda from the preset lambda_vec
    options.lambda = lambda_vec(i);

    % train the model
    theta = trainLinearReg(X_train, y_train, options);
    options.lambda = 0;

    error_train(i) = linRegCost(X_train, y_train, theta, options);  
    error_val(i) = linRegCost(Xval, yval, theta, options);
end;

% =========================================================================

end
