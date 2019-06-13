% initialization
%clear ; close all; clc
% load test data and trained weights
load('test_data');
load('trained_weights');
% call model
pred = predict(Theta1, Theta2, X);

fprintf('\nTest Set Accuracy: %f\n', mean(double(pred == y)) * 100);

