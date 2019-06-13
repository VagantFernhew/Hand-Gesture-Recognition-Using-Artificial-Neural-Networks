function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%INPUTS
%          X: 
%OUTPUTS
%          U: eigenvectors of covariance matrix of X
%          S: eigenvalues of covariance matrix of X 
% 
[m, n] = size(X);
U = zeros(n);
S = zeros(n);
%
sigma_matrx = (X*(X'))./m ;
%sigma_matrx = ((X')*X)./m ;
[U, S, V] = svd(sigma_matrx);
% =========================================================================

end
