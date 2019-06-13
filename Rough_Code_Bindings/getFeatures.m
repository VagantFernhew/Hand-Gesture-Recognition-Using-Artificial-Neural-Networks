function [varian, waveLen,integEMG] = getFeatures(matrx)

%================================================
p = size(matrx,2);
q = size(matrx,1);
label_vec = matrx(1:q,p);
matrx = matrx(1:q,1:p-1);	


%============= return following variables correctly================
varian = zeros(size(matrx,1),1);
waveLen = zeros(size(matrx,1),1);
integEMG = zeros(size(matrx,1),1);

%=================================================================

N = size(matrx,2);
m = size(matrx,1);
%=========compute variance=====================
suqared = matrx.*matrx;
varian = sum(suqared,2)./(N-1);
%=========compute integral of EMG=====================
abs_mat = abs(matrx);
integEMG = sum(abs_mat,2);
%=========compute wave length of EMG==================
mat_low = matrx(1:end,1:N-1);
mat_high = matrx(1:end,2:end);
diff_mat = mat_high - mat_low;

waveLen = sum(abs(diff_mat),2);
%=================compute wilson amplitude===================
thre = Wampthreshold(abs(diff_mat));


end