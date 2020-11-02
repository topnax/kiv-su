%TODO
function [theta, theta_history, J_history] = train (X, y)
	fprintf('Running gradient descent ...\n');
	% Choose some alpha value
	options.alpha = 0.1;
	options.iters = 200;
    options.minThetaDiff = 0.5;
%    options.minCost = 2e+13;

	% Init Theta and Run Gradient Descent 
	initTheta = zeros(size(X, 2), 1);
	[theta, theta_history, J_history] = gradientDescent(@(theta)(linRegCost(X, y, theta)), initTheta, options);
end
