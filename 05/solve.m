function [b] = solve(a, theta)
% b =((theta(1) * a(1)) + (theta(2) * a(2)) / theta(3)) * (-1);
b = ((theta(1) + theta(2) * a(2))) / (theta(3) * (-1));
end
