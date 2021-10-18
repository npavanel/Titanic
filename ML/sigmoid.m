function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.


g = 1 ./ ( 1 + exp(-z) ); % this computes the sigmoid of an integer, or of every value in a vector or matrix


% =============================================================

end
