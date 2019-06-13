function feats = features(X)
	varr = variance(X);
	rmsVal = rmsOfEMG(X);
	WL = waveLen(X);

	feats = [varr rmsVal WL];
end

function varr = variance(sig)

N = size(sig,2);
suqared = sig.*sig;
%compute variance
var = sum(suqared,2)./(N-1);
end

function rmsVal = rmsOfEMG(sig)
%===================================================
% return following variable correctly
rmsVal = zeros(size(sig,1),1);
%===============================================
N = size(sig,2);
suqared = sig.*sig;
%compute rms value
rmsVal = sqrt(sum(suqared,2)./N);

end

function WL = waveLen(sig)

%============= return following variable correctly================
waveLen = zeros(size(sig,1),1);
%===================================================
%===================================================
[m,N] = size(sig);
%=========compute wave length of EMG==================
mat_low = sig(1:m,1:N-1);
mat_high = sig(1:m,2:end);
diff_mat = mat_high - mat_low;

WL = sum(abs(diff_mat),2);


end