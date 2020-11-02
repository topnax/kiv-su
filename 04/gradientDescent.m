% costFunction has only one parameter: theta
% options is the structure of gradient descent settings
function [theta, thetaHistory, J_history] = gradientDescent(costFunction, initialTheta, options)

  % Initialize some useful values
  theta = initialTheta;
  theta_back = initialTheta;
  J_history = [];
  thetaHistory = [];
  iter = 1;
  while 1 
    
    [J, grad] =  costFunction(theta);
         
    new_theta = theta - (options.alpha) * (grad);

    % store current theta into theta history
    thetaHistory(iter, :) = new_theta;
    
    % store current cost into J_history
    J_history(iter) = J;

     if isfield(options, "iters")
        if options.iters <= iter 
            printf("iters condition fulfilled (%d)\n", iter);
            break;
        end
    end   

    if isfield(options, "minThetaDiff")
        minThetaDiff = max(abs(new_theta - theta));
        if minThetaDiff < options.minThetaDiff
            printf("minThetaDiff condition fulfilled (%d) after %d iterations.\n", minThetaDiff, iter);
            break;
        end
    end

    if isfield(options, "minCost")
        if J < options.minCost
            printf("minCost condition fulfilled (%d) after %d iterations.\n", J, iter);
            break;
        end
    end

    theta = new_theta;
    iter = iter + 1;
  end
end
