function  normFeat = normalizeFeat(X)
 
 % m, v and maxVal are row vectors 
 % find mean of each example
 m = mean(X);
 % find variance of each example
 v = var(X);
 % find the maximum value in each example
 maxVal = max(X);  
 
 for i = 1:size(X,1)
     % feature normalizing
     %X(i,1:end) = (X(i,1:end) - m)./v;
     % feature scaling
     X(i,1:end) = (X(i,1:end) - m)./maxVal;
 end
 normFeat = X;


end