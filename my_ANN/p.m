
v = var(X);
m = mean(X);
s = max(X);
for i = 1:size(X,1)
    % normalize training set
    %X(i,1:end) = (X(i,1:end) - m)./v;
    
    % scaling data set
    %X(i,1:end) = X(i,1:end)./s;
    
     X(i,1:end) = (X(i,1:end) - m)./s;
end

