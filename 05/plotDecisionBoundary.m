function plotDecisionBoundary(theta, X, y)
%TODO
%PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
%the decision boundary defined by theta
%   PLOTDECISIONBOUNDARY(theta, X,y) plots the data points with + for the 
%   positive examples and o for the negative examples. X is assumed to be 
%   Mx3 matrix, where the first column is an all-ones column for the intercept.

% Plot Data
plotData(X(:,2:3), y);
hold on

    %TODO plot decision boundary here
    X
    z = theta * X;
    plot(x, z);
    % Legend, specific for the exercise
    legend('Admitted', 'Not admitted', 'Decision Boundary')
hold off

end
