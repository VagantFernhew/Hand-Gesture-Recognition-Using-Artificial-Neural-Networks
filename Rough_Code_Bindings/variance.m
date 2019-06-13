function var = variance(sig)
% the function "var = variance(matrx)" takes a matrix as input and compute 
% the variance along each row of column. output of function is a column vector
% containing the variance of each row of input matrix

%==========================================================
% seprate data & labels
% uncomment following code when the input is labeld data
% p = size(sig,1);
% q = size(sig,2);
% label_vec = sig(1:p,q);
% sig = sig(1:p,1:q-1);
%===================================================
%=================================================================

N = size(sig,2);
suqared = sig.*sig;
%compute variance
var = sum(suqared,2)./(N-1);
end