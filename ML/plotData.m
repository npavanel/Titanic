function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

pos = find(y==1); neg = find(y==0); % finds the indices of positive and negative examples in 

plot(X(pos,1), X(pos,2), 'k+', 'MarkerFaceColor', 'g'); % plots the positive examples by going to their indices and plotting the first and second column of the data matrix (the scores of their exams) against each other

plot(X(neg,1), X(neg,2), 'ko', 'MarkerFaceColor', 'r'); % same as above

% =========================================================================



hold off;

end
