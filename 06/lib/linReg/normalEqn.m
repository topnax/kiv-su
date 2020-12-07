function [theta] =  normalEqn(X, y)
  theta = zeros(size(X, 2), 1);
  
  % no need for feature scaling
  theta = pinv((X') * X) * X' * y;
end
