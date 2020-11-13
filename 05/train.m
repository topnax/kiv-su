function [theta, theta_history, J_history] = train (X, y)

	%  Set options for fminunc
	% options = optimset('GradObj', 'on', 'MaxIter', 400);
	[m, n] = size(X);
	options.iters = 400;
	options.alpha = 0.3;
	% Initialize fitting parameters
	initial_theta = zeros(n, 1);
	%  Run fminunc to obtain the optimal theta
	%  This function will return theta and the cost
    options = optimset("GradObj", "on", "MaxIter", 400, "alpha", 0.1);
    [J_history, grad] = logRegCost(X, y, initial_theta);
	[theta, theta_history, J_history] = gradientDescent(@(t)(logRegCost(X, y, t)), initial_theta, options);
    theta_by_unc = fminunc(@(t)logRegCost(X, y, t), initial_theta, option) 

end
