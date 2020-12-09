function [theta] =  normalEqn(X, y, options)
    theta = zeros(size(X, 2), 1);
    
    L = options.lambda .* eye(size(X, 2));
    L(1) = 0;

    % no need for feature scaling
    theta = pinv((X') * X + L) * X' * y;
end
