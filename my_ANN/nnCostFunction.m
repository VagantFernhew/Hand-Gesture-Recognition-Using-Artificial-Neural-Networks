function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(hidden_layer_size, input_layer_size );
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m

shape_y = eye(num_labels);   
y_matrix = shape_y(y,:) ;

%  implement feed forward NN-work

a1 = [ones(size(X,1),1) X(1:end , 1:end)];
zet_2 = a1*Theta1';
a2 = sigmoid(zet_2);
a2 = [ones(size(a2,1),1) a2(1:end,1:end) ];
zet_3 = a2*Theta2';
a3 = sigmoid(zet_3);
h = a3;

%============ unregularized cost formula====================

 % J =  -sum(sum(log(h).*y_matrix + log(1-h).*(1-y_matrix)))/m;
 
 % regularization term
reg_Theta1 = Theta1(1:end,2:end);
reg_Theta2 = Theta2(1:end,2:end);
s1 = sum(reg_Theta1.*reg_Theta1);
s2 = sum(reg_Theta2.*reg_Theta2);
s = sum(sum(s1) + sum(s2));
reg_term = (s*lambda)/(2*m);

J = reg_term -sum(sum(log(h).*y_matrix + log(1-h).*(1-y_matrix)))/m;

%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%delta1 = zeros(size(Theta1));
%delta2 = zeros(size(Theta2));
D1 = zeros(size(Theta1));
D2 = zeros(size(Theta2));

gPrime = sigmoid(zet_2).*(1 - sigmoid(zet_2));
del3 = h - y_matrix;
% ist column of Theta2 is excluded since it contains bias units
% which are not connected in backward direction
Theta2b = Theta2(1:end,2:end);
del2 = (del3*Theta2b).*gPrime;
delta2 = (del3')*a2;
delta1 = (del2')*a1;

D1 = delta1./m;
D2 = delta2./m;
Theta1_grad = D1;
Theta2_grad = D2;



%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
%D1(1:end,1) = delta1(1:end,1)./m ;
%D2(1:end,1) = delta2(1:end,1)./m ;
%D1(1:end,2:end) = D1(1:end,2:end) + delta1(1:end,2:end)./m  + (lambda.*Theta1(1:end,2:end))./m;
%D2(1:end,2:end) = D2(1:end,2:end) + delta2(1:end,2:end)./m  + (lambda.*Theta2(1:end,2:end))./m;

% calculate regularized gradient
p1 = (lambda/m)*[zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
p2 = (lambda/m)*[zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];
Theta1_grad = D1 + p1;
Theta2_grad = D2 + p2;





% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad =  [Theta1_grad(:) ; Theta2_grad(:)];


end
