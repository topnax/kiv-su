% x refers to the population size in 10,000s
% y refers to the profit in $10,000s
%

%% Initialization
clear ; close all; clc


%% ======================= Part 2: Plotting =======================
fprintf('Plotting Data ...\n')
data = load('data.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples

plotData(X, y);
disp('Press enter to continue...')
pause;

X = [ones(size(X, 1), 1), X]; % Add a column of ones to x

%% =================== Part 3: Gradient descent ===================
fprintf('Running Gradient Descent ...\n')

iterations = 2000;
alpha = 0.01;
init_theta = zeros(2,1);

[theta, theta_history, j_history] = train(X, y, init_theta, alpha, iterations);
% print theta to screen
fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
hold off % don't overlay any more plots on this figure

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);
    
theta_norm = normalEque(X(:,2), y)

hold on; % keep previous plot visible
plot(X(:,2), X*theta_norm, '-m')
legend('Training data', 'Linear regression', 'LR using normalEque')




%% ============= Part 4: Visualizing J(theta_0, theta_1) =============
fprintf('Visualizing J(theta_0, theta_1) ...\n')

% Grid over which we will calculate J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = computeCost(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to 
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);

%TODO plot points for all iterations of gradient descent
% you should see how the points are getting closer to the center

plot(theta_history(:, 1), theta_history(:, 2), 'r.', 'MarkerSize', 10);


%%
%TODO compute theta by normal equations and visualize velue of J in GS iterations
% in comparison with NE
hold off;
figure;
plot(1:iterations, j_history, 'b.', 'MarkerSize', 10);
hold on;
norm_cost = computeCost(X, y, theta_norm);
plot(1:iterations, v=norm_cost*ones(1, iterations), 'r.', 'MarkerSize', 10);
legend('Gradient descent', 'Normal equations');
xlabel("Iterations"); ylabel('J');
title('Convergence graph');


% plot different alpha values

hold off;
figure;

iterations = 1000;
alpha = 0.01;
init_theta = zeros(2,1);

alphas = [0.01, 0.02, 0.009, 0.005, 0.008];
colors = [".c", ".r", ".b", ".k", ".m"];


for c = 1:length(alphas)
  [theta, theta_history, j_history] = train(X, y, init_theta, alphas(c), iterations);
  plot(1:iterations, j_history, colors(c), 'MarkerSize', 2);
  hold on;
end

hold on;
legend('alpha=0.01', 'alpha=0.02', 'alpha=0.009', 'alpha=0.005', 'alpha=0.008');
xlabel("Iterations"); ylabel('J');
title('Convergence graph');

pause;

