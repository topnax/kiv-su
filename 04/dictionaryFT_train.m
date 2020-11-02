% Trains dictionary feature transformer
% it has to remember the indices of strings in vocabulary
% so the transformer can create a vector with single 1 on corresponding index
% X is the matrix where each row is a single string
function [model] = dictionaryFT_train (X)
    model = {};
    for iter = 1:length(X)
        val = X(iter,:);
        x = val(1,:)
        if ~ismember(val, model)
          model(length(model) + 1,:) = val(1,:);
        end
    end
end
