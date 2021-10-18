%% Kaggle Titanic Project - Five Feature Regularized Dual Term Classification
% hey

%% Initialization
clear ; close all; clc

%% Load Data
%  The first five columns contains the X values and the sixth column
%  contains the label (y).

data = load('train_five_feat.txt');
X = [data(:, [1, 2, 3, 4, 5])]; y = data(:, 6);

%plotData(X, y);

% Put some labels
%hold on;

% Labels and Legend
%xlabel('Passenger Class')
%ylabel('Sex (Female(0))')

% Specified in plot order
%legend('y = 1', 'y = 0')
%hold off;


%% =========== Regularized Logistic Regression ============
%  In this part, you are given a dataset with data points that are not
%  linearly separable. However, you would still like to use logistic
%  regression to classify the data points.
%
%  To do so, you introduce more features to use -- in particular, you add
%  polynomial features to our data matrix (similar to polynomial
%  regression).
%

% Add Polynomial Features


X = mapFeature( X(:,1), X(:,2), X(:,3), X(:,4), X(:,5) );

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1
lambda = 1;

% Compute and display initial cost and gradient for regularized logistic
% regression
[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros) - first five values only:\n');

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

% Compute and display cost and gradient
% with all-ones theta and lambda = 10
test_theta = ones(size(X,2),1);
[cost, grad] = costFunctionReg(test_theta, X, y, 10);

fprintf('\nCost at test theta (with lambda = 10): %f\n', cost);
fprintf('Gradient at test theta - first five values only:\n');

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ============= Regularization and Accuracies =============
%  In this part, you will get to try different values of lambda and
%  see how regularization affects the decision coundart
%
%  Try the following values of lambda (0, 1, 10, 100).
%
%  How does the decision boundary change when you vary lambda? How does
%  the training set accuracy vary?
%

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1 (you should vary this)
lambda = 15;

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% Plot Boundary
%plotDecisionBoundary(theta, X, y);
%hold on;
%title(sprintf('lambda = %g', lambda))

% Labels and Legend
%xlabel('Passenger Class')
%ylabel('Sex (Female(0))')

%legend('y = 1', 'y = 0', 'Decision boundary')
%hold off;

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

%% ============== Predict ==============
%  This part of the code uses the learned parameters to predict the outcomes
%  on unseen data. The logistic regression model is used to
%  predict the probability that an array of Titanic passengers
%  will survive.

% load in testing data
test_data = load('test_five_feat.txt');

testX = [test_data(:, [1, 2, 3, 4, 5])];

% Add Polynomial Features

testX = mapFeature( testX(:,1), testX(:,2), testX(:,3), testX(:,4), testX(:,5) );

% predict survivability for testing data
p2 = predict(theta, testX);

% save new predict data
save titanic_predictions.txt p2 -ascii;


