

%% Initialization
clear ; close all; clc
K = 3;  % desired number of dimensions to reduce
%% loading and visualizing raw data
fprintf('\nloading and visualizing raw data.....\n');
%load('train_d');
load('data');
plot(X(:,1));
title('raw EMG signal');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
%% feature Extraction and visualizing
fprintf('\nextracting features from raw data.....\n');
X = getfeats(X);
figure;
scatterplot(X',y');
title('scatter plot of four gestures');
legend('fist','finger sepread','wave in','wave out','Location','northwest');
fprintf('Program paused. Press enter to continue.\n');
pause;
%% feature Normalization
fprintf('\nfeature normalization.....\n');
X = featureNormalize(X);
figure;
scatterplot(X',y');
title('scatter plot with feature normalization');
legend('fist','finger sepread','wave in','wave out','Location','northwest');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
%% feature reduction (PCA)
fprintf('\napplying PCA.....\n');
[U, S] = pca(X);
Z = projectData(X, U, K);
figure;
scatterplot(Z,y');
title('scatter plot after PCA');
legend('fist','finger sepread','wave in','wave out','Location','northwest');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
%% **************Artificial Neural Network *******************
% INPUTS
%            X: training data set 
%               mxn order
%               m: training examples
%               n: fatures
%% Setup the parameters 
input_layer_size  = 3;  % 5 features(excluding bias)
hidden_layer_size = 7;   % 6 hidden units
num_labels = 4;          % 4 labels, from 1 to 4   
                          % (note that we have labeld 4 gestures)

%% =========== Part 1: Loading and Visualizing Data =============
%  We start  by first loading and visualizing the dataset. 
%  We will be working with a dataset that contains EMG signals reading.
%
X = Z;
% Load Training Data
fprintf('Loading and Visualizing Data ...\n')
% load variable X and y
%load('E:\FYP\my ANN\data\d_train_600s');
%load('train_data_reduced');
%load('train_data');

% normalize features
%X = normalizeFeat(X);


m = size(X, 1);
%X = [ones(m,1) X];
% Randomly select 100 data points to display
%sel = randperm(size(X, 1));
%sel = sel(1:100);

%displayData(X(sel, :));
% myPlot(X,y);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 2: Loading Parameters ================
% In this part , we load some pre-initialized 
% neural network parameters.

fprintf('\nLoading Saved Neural Network Parameters ...\n')
% ============================================================
x_in = input_layer_size;
h_in = hidden_layer_size;
y_in = num_labels;
[Theta1, Theta2] = InitializeWeights(x_in, h_in, y_in);

%=============================================================

% Load the weights into variables Theta1 and Theta2
% load('ini_weights');

% Unroll parameters 
nn_params = [Theta1(:) ; Theta2(:)];

%% ================ Part 3: Compute Cost (Feedforward) ================
%  To the neural network, you should first start by implementing the
%  feedforward part of the neural network that returns the cost only. You
%  should complete the code in nnCostFunction.m to return cost. After
%  implementing the feedforward to compute the cost, you can verify that
%  your implementation is correct by verifying that you get the same cost
%  as us for the fixed debugging parameters.
%
%  We suggest implementing the feedforward cost *without* regularization
%  first so that it will be easier for you to debug. Later, in part 4, you
%  will get to implement the regularized cost.
%
fprintf('\nFeedforward Using Neural Network ...\n')

% Weight regularization parameter (we set this to 0 here).
lambda = 0;

J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
                   num_labels, X, y, lambda);

fprintf(['Cost at initial parameters: %f '], J);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% =============== Part 4: Implement Regularization ===============
%  Once your cost function implementation is correct, you should now
%  continue to implement the regularization with the cost.
%

fprintf('\nChecking Cost Function (w/ Regularization) ... \n')

% Weight regularization parameter (we set this to 1 here).
lambda = 0.1;

J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
                   num_labels, X, y, lambda);

fprintf(['Cost at parameters : %f '], J);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% ================ Part 5: Sigmoid Gradient  ================
%  Before you start implementing the neural network, you will first
%  implement the gradient for the sigmoid function. You should complete the
%  code in the sigmoidGradient.m file.
%

fprintf('\nEvaluating sigmoid gradient...\n')

g = sigmoidGradient([-1 -0.5 0 0.5 1]);
fprintf('Sigmoid gradient evaluated at [-1 -0.5 0 0.5 1]:\n  ');
fprintf('%f ', g);
fprintf('\n\n');

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 6: Initializing Pameters ================
%  In this part , you will be starting to implment a two
%  layer neural network that classifies EMG signals. You will start by
%  implementing a function to initialize the weights of the neural network
%  (randInitializeWeights.m)

fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


%% =============== Part 7: Implement Backpropagation ===============
%  Once your cost matches up with , you should proceed to implement the
%  backpropagation algorithm for the neural network. You should add to the
%  code you've written in nnCostFunction.m to return the partial
%  derivatives of the parameters.
%
fprintf('\nChecking Backpropagation... \n');

%  Check gradients by running checkNNGradients
checkNNGradients;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% =============== Part 8: Implement Regularization ===============
%  Once your backpropagation implementation is correct, you should now
%  continue to implement the regularization with the cost and gradient.
%

fprintf('\nChecking Backpropagation (w/ Regularization) ... \n')

%  Check gradients by running checkNNGradients
lambda = 3;
checkNNGradients(lambda);

% Also output the costFunction debugging values
debug_J  = nnCostFunction(nn_params, input_layer_size, ...
                          hidden_layer_size, num_labels, X, y, lambda);

fprintf(['\n\nCost at (fixed) debugging parameters (w/ lambda = %f): %f ' ...
         '\n(for lambda = 3, this value should be about 0.576051)\n\n'], lambda, debug_J);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% =================== Part 8: Training NN ===================
%  You have now implemented all the code necessary to train a neural 
%  network. To train your neural network, we will now use "fmincg", which
%  is a function which works similarly to "fminunc". Recall that these
%  advanced optimizers are able to train our cost functions efficiently as
%  long as we provide them with the gradient computations.
%
fprintf('\nTraining Neural Network... \n')

%  After you have completed , change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 600);

%  You should also try different values of lambda
lambda = 0.1;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
%==================================================================
%initial_nn_params = 0.123*ones(size(nn_params));
initial_nn_params = 0.2*ones(size(nn_params));
%==================================================================
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;

%%===================== save  learned weights =====================
save('trained_weights','Theta1','Theta2');

%% ================= Part 9: Visualize Weights =================
%  You can now "visualize" what the neural network is learning by 
%  displaying the hidden units to see what features they are capturing in 
%  the data.

%fprintf('\nVisualizing Neural Network... \n')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%displayData(Theta1(:, 2:end));

%fprintf('\nProgram paused. Press enter to continue.\n');
%pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ================= Part 10: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy of ANN classifier : %f\n', mean(double(pred == y')) * 100);
%testClassifier;

%load('E:\FYP\my ANN\data\d_test_600s');
load('test_d');
X = featureNormalize(X);
[U, S] = pca(X);
Z = projectData(X, U, K);
X = Z;
pred = predict(Theta1, Theta2, X);

fprintf('\nTest Set Accuracy of ANN classifier: %f\n', mean(double(pred == y')) * 100 );

