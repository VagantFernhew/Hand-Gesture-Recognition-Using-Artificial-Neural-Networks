function MFL = maxFractalLen(sig)
%===================================================
% Maximum Fractal Length (MFL) is a feature, which can measure 
% EMG signal patterns at low level muscle contraction 
%==========================================================
% seprate data & labels
% uncomment following code when the input is labeld data
% p = size(sig,1);
% q = size(sig,2);
% label_vec = sig(1:p,q);
% sig = sig(1:p,1:q-1);
%===================================================
%============= return following variable correctly================
MFL= zeros(size(sig,1),1);
%============================================
%===================================================
N = size(sig,2);
m = size(sig,1);
%=========compute Maximum Fractal Length==================
mat_low = sig(1:m,1:N-1);
mat_high = sig(1:m,2:end);
diff_mat = mat_high - mat_low;
sum_abs = sum(abs(diff_mat),2);
MFL = log(sum_abs);


end