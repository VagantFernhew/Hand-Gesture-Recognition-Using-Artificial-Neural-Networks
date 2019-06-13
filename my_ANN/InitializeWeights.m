function [Theta1, Theta2] = InitializeWeights(x_in, h_in, y_in)
%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in
%incoming connections and L_out outgoing connections
%   W = RANDINITIALIZEWEIGHTS(L_in, L_out) randomly initializes the weights 
%   of a layer with L_in incoming connections and L_out outgoing 
%   connections. 
%
%   Note that W should be set to a matrix of size(L_out, 1 + L_in) as
%   the first column of W handles the "bias" terms
%

% You need to return the following variables correctly 
Theta1 = zeros(h_in, 1 + x_in);
Theta2 = zeros(y_in, 1 + h_in);

% ====================== YOUR CODE HERE ======================
% Instructions: Initialize W randomly so that we break the symmetry while
%               training the neural network.
%
% Note: The first column of W corresponds to the parameters for the bias unit
%
col1 = x_in +1;
col2 = h_in +1;

epsilon_init1 = 2.4495/sqrt(h_in + x_in);
epsilon_init2 = 2.4495/sqrt(y_in + h_in);
fac1 = 2*epsilon_init1;
fac2 = 2*epsilon_init2;

rng(0)
Theta1 = rand(h_in, col1).*fac1 - epsilon_init1;
Theta2 = rand(y_in, col2).*fac2 - epsilon_init2;
rng(0)
%W = rand(L_out, col)*2*(epsilon_init - epsilon_init);


% =========================================================================

end
