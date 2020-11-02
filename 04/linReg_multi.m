
%% Initialization

%% Clear and Close Figures
clear ; close all; clc

%% ================ Feature Normalization ================

fprintf('Loading data ...\n');

%% Load Data
data = load('data1.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

plotData(X, y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];

[theta, theta_history, J_history] = train(X, y);

plotThetaJ(X,y, theta, @linRegCost);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n')

% TODO Estimate the price of a 1650 sq-ft, 3 br house

size = 1650;
bedrooms = 3;

size = (size - mu(1)) / sigma(1);
bedrooms = (bedrooms - mu(2)) / sigma(2);


price = linRegPredict([1 size bedrooms], theta);

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);
			
			
			
%TODO Compute theta with normal equations and predict the same price

%% ================ Normal Equations ================
fprintf('\n');

fprintf('Solving with normal equations...\n');

%% Load Data
data = load('data1.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% train and predict by normal equations here
theta = normalEquation(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% TODO Estimate the price of a 1650 sq-ft, 3 br house

% no need for feature scaling, just plug in the house properties
price = linRegPredict([1 1650 3], theta);
fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);
