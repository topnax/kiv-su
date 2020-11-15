function plotDecisionBoundary(theta, X, y)
%TODO
%PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
%the decision boundary defined by theta
%   PLOTDECISIONBOUNDARY(theta, X,y) plots the data points with + for the 
%   positive examples and o for the negative examples. X is assumed to be 
%   Mx3 matrix, where the first column is an all-ones column for the intercept.
solve([1 2 1], [-3 1 1])
% Plot Data
plotData(X(:,2:3), y);
hold on

        
    y1 = solve([1 -2 0], theta);
    y2 = solve([1 2 0], theta);
    y1
    y2
    %TODO plot decision boundary here
    z = X * theta;
    plot([-2 2], [y1 y2]);
    % Legend, specific for the exercise
    legend('Admitted', 'Not admitted', 'Decision Boundary')
hold off

end
