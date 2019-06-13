function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
first = find(y==1); second = find(y == 2); third = find(y == 3);
% Plot Examples
plot(X(first, 1), X(first, 2), 'k+','LineWidth', 2,'MarkerSize', 7);
plot(X(second, 1), X(second, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
plot(X(third, 1), X(third, 2), 'c*');


% =========================================================================


hold off;

end
