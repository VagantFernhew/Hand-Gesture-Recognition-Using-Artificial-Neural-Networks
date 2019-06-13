function saen = SampEn(data)
 r = 0.2*std(data);
 N = length(data);
 correl = zeros(1,2);
 dataMat = zeros(2+1,N-2);
 for i = 1:2+1
    dataMat(i,:) = data(i:N-2+i-1);
 end
 for m = 2:2+1
    count = zeros(1,N-2);
    tempMat = dataMat(1:m,:); 
    for i = 1:N-m
        dist = max(abs(bsxfun(@minus,tempMat(:,i+1:N-2),tempMat(:,i))));
        D = (dist < r);
        count(i) = sum(D)/(N-2);
    end
    correl(m-2+1) = sum(count)/(N-2);
end
saen = log(correl(1)/correl(2));
end