function [theta, theta_history, J_history] = train (X, y)

	%  Set options for fminunc
	% options = optimset('GradObj', 'on', 'MaxIter', 400);
	[m, n] = size(X);
	options.iters = 200;
	%options.iters = 400;
	options.alpha = 4;
    % options.alpha = 2;
	% Initialize fitting parameters
	initial_theta = zeros(n, 1);
	%  Run fminunc to obtain the optimal theta
	%  This function will return theta and the cost
    [J_history, grad] = logRegCost(X, y, initial_theta);
	[theta, theta_history, J_history] = gradientDescent(@(t)(logRegCost(X, y, t)), initial_theta, options);
    % unc_options = optimset("GradObj", "on", "MaxIter", 400);
    % theta_by_unc = fminunc(@(t)logRegCost(X, y, t), initial_theta, unc_options); 
end
