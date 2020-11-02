% costFunction has only one parameter: theta
% options is the structure of gradient descent settings
function [theta, thetaHistory, J_history] = gradientDescent(costFunction, initialTheta, options, X, y)
  % store y length
  m = length(y)

  % Initialize some useful values
  theta = initialTheta;
  J_history = zeros(options.iters, 1);
  thetaHistory = zeros(options.iters, 3);
  sumError = zeros(length(theta), 1);

  for iter = 1:options.iters
    predict = linRegPredict(X, theta);
    
    for i=1:length(theta)
      sumError(i) = sum((predict - y).* X(:,i));
    end
      
    theta = theta - (options.alpha / m) * sumError;
    
    % store current theta into theta history
    thetaHistory(i, :) = theta;
    
    % store current cost into J_history
    J_history(iter) = costFunction(theta);
  end

end
