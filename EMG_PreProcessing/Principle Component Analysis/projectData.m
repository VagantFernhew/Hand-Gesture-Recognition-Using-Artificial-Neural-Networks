function Z = projectData(X, U, K)
%PROJECTDATA Computes the reduced data representation when projecting only 
%on to the top k eigenvectors
%   Z = projectData(X, U, K) computes the projection of 
%   the normalized inputs X into the reduced dimensional space spanned by
%   the first K columns of U. It returns the projected examples in Z.
%
%INPUTS
%          X: normalized features
%          U: eigen vectors of X
%          K: first K eigen vectors in U(no.of dims to which X is projected)
%OUTPUTS
%          Z: projection of X in K dimensions

Z = zeros(size(X, 1), K);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the projection of the data using only the top K 
%               eigenvectors in U (first K columns). 
%               For the i-th example X(i,:), the projection on to the k-th 
%               eigenvector is given as follows:
%                    x = X(i, :)';
%                    projection_k = x' * U(:, k);
%

% when matrix X is multiply with the matrix U(matrix of eigenvectors of sigma matrix/ X'*X)
% we get the transformed matrix Z.
Z = X'*U(1:end, 1:K);
%Z = X*U(1:end, 1:K);



% =============================================================

end
