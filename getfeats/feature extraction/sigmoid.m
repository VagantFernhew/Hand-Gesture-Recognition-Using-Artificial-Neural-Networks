function g = sigmoid(z)
% SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.
% ===========================================
% uncomment the respective activation fucntion
% to use in ANN
g = 1.0 ./ (1.0 + exp(-z)); % sigmoid activation
%g = (exp(z) - exp(-z))./(exp(z) + exp(-z)); % tanh activation 
%g = relu(z);
end
