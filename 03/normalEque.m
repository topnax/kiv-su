
function theta = normalEque(X, y)
    X = [ones(size(X, 1), 1), X];
    theta = pinv(X)*y;
end