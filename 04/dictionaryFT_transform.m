% This function should create one/hot vektor for each string in X matrix
% X is the matrix where each row is a single string
% X_trans is the matrix where each row is one-hot vector for single input string 
function [X_trans] = dictionaryFT_transform (X, model)
  X_trans = zeros(size(X, 1),size(model,1) + 1);
  
  for iter = 1:size(X, 1)
    val = X(iter,:);
    % find index of the val in the model
    index = find(strcmp(val, model));

    if length(index) == 0
      % not found
      X_trans(iter, 1) = 1;
    else 
      % found
      X_trans(iter, index+1) = 1;
    endif
  endfor
  
end
