function IAV = integAbsVal(sig)
 %==============================================================
 % integAbsVal(sig) returns the 'integral of abslute value' of signals
 % which are rows of matrix 'sig'. the output IAV is a column vector
 
%==========================================================
% seprate data & labels
% uncomment following code when the input is labeld data
% p = size(sig,1);
% q = size(sig,2);
% label_vec = sig(1:p,q);
% sig = sig(1:p,1:q-1);
%===================================================

 %===============================================================
 % N is total number of samples in signal
 N = size(sig,2);
 % compute sum of each signal(each signal is along the row of "sig" matrix)
 % "sum" is a column vector containing the sum of all exmples
 sum_sig = sum(sig,2);
 %compute integral of abslute value
 IAV = sum_sig./N;
end