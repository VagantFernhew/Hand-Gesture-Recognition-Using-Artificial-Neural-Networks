function  integEMG = integralEMG(sig)
%==========================================================
% Integrated EMG (IEMG) is a summation of the absolute value 
% of the EMG signal amplitude over the timesegment.
%=======================================================
% the function "integEMG = integralEMG(sig)" takes a 'sig' as input and compute 
% the Integrated EMG of signal, along each row of sig. output of function is a 
%column vector containing the Integrated EMG of signal .
%==========================================================
% seprate data & labels
% uncomment following code when the input is labeld data
% p = size(sig,1);
% q = size(sig,2);
% label_vec = sig(1:p,q);
% sig = sig(1:p,1:q-1);
%===================================================
% return following variable correctly
integEMG = zeros(size(sig,1),1);
%================================================
%=========compute integral of EMG=====================
abs_mat = abs(sig);
integEMG = sum(abs_mat,2);
end 