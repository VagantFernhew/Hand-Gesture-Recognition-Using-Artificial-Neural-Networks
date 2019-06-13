function X = getENGFeats(data)

%rawEmg = data(1:end,1:(end - 1));
%y = data(1:end,end);
rawEmg = data;
%===================part 2:extracting features=============================
varr = variance(rawEmg);
rmsVal = rmsOfEMG(rawEmg);
IAV = integAbsVal(rawEmg);
integEMG = integralEMG(rawEmg);
MFL = maxFractalLen(rawEmg);
WL = waveLen(rawEmg);
X = [varr rmsVal IAV integEMG MFL WL];
% save features and label vector
%save('E:\FYP\EMG RawData\features','X','y');
%fprintf('features are saved in dir: E:\\FYP\\EMG RawData\\features\n');
%save('d','X','y');
end


