function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Computes cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 


m = length(y); % number of training examples

hyp = sigmoid( X * theta ); % define the hypothesis function

theta_reg = [0;theta(2:end)];  % create a vector excluding first value of theta such that 0 is always in the first place to ensure correct integration in algorithm

J = (1 / m) * ( -y' * log(hyp) - (1 - y)' * log(1 -hyp) ) + ( lambda / (2*m) ) * theta_reg' * theta_reg;

grad = (1 / m) * ( X' * (hyp-y) + lambda * theta_reg );


% =============================================================

end
