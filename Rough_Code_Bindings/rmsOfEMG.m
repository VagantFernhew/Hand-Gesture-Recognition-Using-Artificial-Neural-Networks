function rmsVal = rmsOfEMG(sig)
% the function "rmsVal = rmsOfEMG(matrx)" takes a matrix mat as input and compute 
% the rms value of each row(the rows contains raw emg signals) of matrix. output 
% of function is a column vector containing the rms value  of each(signal) 
% row of input matrix
%==========================================================

%==========================================================
% seprate data & labels
% uncomment following code when the input is labeld data
% p = size(sig,1);
% q = size(sig,2);
% label_vec = sig(1:p,q);
% sig = sig(1:p,1:q-1);
%===================================================
% return following variable correctly
rmsVal = zeros(size(sig,1),1);
%===========================================================

N = size(sig,2);
suqared = sig.*sig;
%compute rms value
rmsVal = sqrt(sum(suqared,2)./N);
end