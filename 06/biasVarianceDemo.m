
%% Initialization
clear ; close all; clc

%% add libs
addpath('./lib/linReg');
addpath('./lib/logReg');
addpath('./lib/visualize');
addpath('./lib');

%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset. 
%  The following code will load the dataset into your environment and plot
%  the data.
%

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

% Load from ex5data1: 
% You will have X, y, Xval, yval, Xtest, ytest in your environment
load ('data1.mat');

% m = Number of examples
m = size(X, 1);

% Plot training data
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =========== Part 2: Regularized Linear Regression Cost =============
%  You should now implement the cost function for regularized linear 
%  regression. 
%

theta = [1 ; 1];
options.lambda = 0.05;
J = linRegCost([ones(m, 1) X], y, theta, options);

fprintf(['Cost at theta = [1 ; 1]: %f '...
         '\n(this value should be about 303.993192)\n'], J);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =========== Part 3: Regularized Linear Regression Gradient =============
%  You should now implement the gradient for regularized linear 
%  regression.
%

theta = [1 ; 1];
[J, grad] = linRegCost([ones(m, 1) X], y, theta, options);

fprintf(['Gradient at theta = [1 ; 1]:  [%f; %f] '...
         '\n(this value should be about [-15.303016; 598.250744])\n'], ...
         grad(1), grad(2));

fprintf('Program paused. Press enter to continue.\n');
pause;


%% =========== Part 4: Train Linear Regression =============
%  Once you have implemented the cost and gradient correctly, the
%  trainLinearReg function will use your cost function to train 
%  regularized linear regression.
% 
%  Write Up Note: The data is non-linear, so this will not give a great 
%                 fit.
%

%  Train linear regression with lambda = 0
options.lambda = 0;
options.alpha = 0.0022;
theta = trainLinearReg([ones(m, 1) X], y, options);
thetaNE = normalEqn([ones(m, 1) X], y, options);

%  Plot fit over the data
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
hold on;
plot(X, [ones(m, 1) X]*theta, 'LineWidth', 2);
plot(X, [ones(m, 1) X]*thetaNE, 'color', 'r', 'LineWidth', 2);
legend('data', 'Gradient descent', 'Normal equations');
hold off;

fprintf('Program paused. Press enter to continue.\n');
pause;


%% =========== Part 5: Learning Curve for Linear Regression =============
%  Next, you should implement the learningCurve function. 
%
%

lambda = 0;
[error_train, error_val] = ...
    learningCurve([ones(m, 1) X], y, ...
                  [ones(size(Xval, 1), 1) Xval], yval, ...
                  lambda, @trainLinearReg);

% we can see that when using less than 6 training examples the model is not trained well and the error increases as the number of training examples decreases
plot(1:m, error_train, 1:m, error_val);
title('Learning curve for linear regression')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 150])
[error_train, error_val] = ...
    learningCurve([ones(m, 1) X], y, ...
                  [ones(size(Xval, 1), 1) Xval], yval, ...
                  lambda, @normalEqn);

% same applies for LR by normal equations;
figure;
plot(1:m, error_train, 1:m, error_val);
title('Learning curve for linear regression by normal equations')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 150])

fprintf('# Training Examples\tTrain Error\tCross Validation Error\n');
for i = 1:m
    fprintf('  \t%d\t\t%f\t%f\n', i, error_train(i), error_val(i));
end

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =========== Part 6: Feature Mapping for Polynomial Regression =============
%

p = 8;

% Map X onto Polynomial Features and Normalize
X_poly = polyFeatures(X, p);
[X_poly, mu, sigma] = featureNormalize(X_poly);  % Normalize
X_poly = [ones(m, 1), X_poly];                   % Add Ones

% Map X_poly_test and normalize (using mu and sigma)
X_poly_test = polyFeatures(Xtest, p);
X_poly_test = bsxfun(@minus, X_poly_test, mu);
X_poly_test = bsxfun(@rdivide, X_poly_test, sigma);
X_poly_test = [ones(size(X_poly_test, 1), 1), X_poly_test];         % Add Ones

% Map X_poly_val and normalize (using mu and sigma)
X_poly_val = polyFeatures(Xval, p);
X_poly_val = bsxfun(@minus, X_poly_val, mu);
X_poly_val = bsxfun(@rdivide, X_poly_val, sigma);
X_poly_val = [ones(size(X_poly_val, 1), 1), X_poly_val];           % Add Ones

fprintf('Normalized Training Example 1:\n');
fprintf('  %f  \n', X_poly(1, :));

fprintf('\nProgram paused. Press enter to continue.\n');
pause;



%% =========== Part 7: Learning Curve for Polynomial Regression =============
%  Now, you will get to experiment with polynomial regression with multiple
%  values of lambda. The code below runs polynomial regression with 
%  lambda = 0. You should try running the code with different values of
%  lambda to see how the fit and learning curve change.
%

options.lambda = 0;
options.alpha = 0.2;
[theta] = trainLinearReg(X_poly, y, options);

% Plot training data and fit

% polynomial (we previously plotted linear) regression
figure(1);
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
plotFit(min(X), max(X), mu, sigma, theta, p, 'b');
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
title (sprintf('Polynomial Regression Fit (lambda = %f)', options.lambda));

figure;
[error_train, error_val] = ...
    learningCurve(X_poly, y, X_poly_val, yval, lambda, @trainLinearReg);
plot(1:m, error_train, 1:m, error_val);

% from my observations changing lambda did not change this graph in a significant way
% i tried values 0, 10, 20, 100.
title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', options.lambda));
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 100])
legend('Train', 'Cross Validation')

figure;
[error_train, error_val] = ...
    learningCurve(X_poly, y, X_poly_val, yval, lambda, @normalEqn);
plot(1:m, error_train, 1:m, error_val);

% from my observations changing lambda did not change this graph in a significant way
% i tried values 0, 10, 20, 100
% As the number of training examples increase we can see a trend - the error is increases. The model seems to become more and more overtrained.
title(sprintf('Polynomial Regression Learning Curve NE (lambda = %f)', options.lambda));
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 100])
legend('Train', 'Cross Validation')

fprintf('Polynomial Regression (lambda = %f)\n\n', lambda);
fprintf('# Training Examples\tTrain Error\tCross Validation Error\n');
for i = 1:m
    fprintf('  \t%d\t\t%f\t%f\n', i, error_train(i), error_val(i));
end

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =========== Part 8: Validation for Selecting Lambda =============
%  You will now implement validationCurve to test various values of 
%  lambda on a validation set. You will then use this to select the
%  "best" lambda value.
%

[lambda_vec, error_train, error_val] = ...
    validationCurve(X_poly, y, X_poly_val, yval, @trainLinearReg);

% we can see that with the regularization parameter equal to zero the error is enormous and even a with small value set to this parameter the model is trained much better.
close all;
plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');
title('Validation curve for gradient descent');

figure;

% same applies to NE
[lambda_vec, error_train, error_val] = ...
    validationCurve(X_poly, y, X_poly_val, yval, @normalEqn);
plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');
title('Validation curve for normal equations');

fprintf('lambda\t\tTrain Error\tValidation Error\n');
for i = 1:length(lambda_vec)
	fprintf(' %f\t%f\t%f\n', ...
            lambda_vec(i), error_train(i), error_val(i));
end

fprintf('Program paused. Press enter to continue.\n');
pause;

options.lambda = 4;
options.alpha = 0.2;
theta = trainLinearReg(X_poly, y, options);
error = (X_poly_test*theta) - ytest;
error_test = (1 / (2*size(Xtest,1))) * (transpose(error) * error)
% Plot training data and fit

% by looking at the following graphs we can observe that changing the regularization parameter the trained model changes in a noticeable way
figure;
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
plotFit(min(X), max(X), mu, sigma, theta, p, 'r');

options.lambda = 0;
theta0 = trainLinearReg(X_poly, y, options);
plotFit(min(X), max(X), mu, sigma, theta0, p, 'g');

options.lambda = 10;
theta10 = trainLinearReg(X_poly, y, options);
plotFit(min(X), max(X), mu, sigma, theta10, p, 'b');

options.lambda = 40;
theta40 = trainLinearReg(X_poly, y, options);
plotFit(min(X), max(X), mu, sigma, theta40, p, 'm');

legend('data', 'lambda = 4', 'lambda = 0', 'lambda = 10', 'lambda = 40');
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
title ('Polynomial Regression Fit');
