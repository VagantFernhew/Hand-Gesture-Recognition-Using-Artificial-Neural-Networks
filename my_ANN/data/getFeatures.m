% ==========================================================================
% this script extracts features from raw labeld data. each row of 
% matrix repesent asignal.
% Integrated EMG (IEMG) is a summation of the absolute value 
% of the EMG signal amplitude over the timesegment.
% 
% ==========================================================================

% Initialization
clear ; close all; clc
% =================part 1: loading raw data=================================
% load raw emg data and seprate label vector from data
rawData = 'E:\FYP\EMG RawData\data';
load(rawData)
rawEmg = data(1:end,1:(end - 1));
y = data(1:end,end);
%===================part 2:extracting features=============================
varr = variance(rawEmg);
rmsVal = rmsOfEMG(rawEmg);
IAV = integAbsVal(rawEmg);
integEMG = integralEMG(rawEmg)
MFL = maxFractalLen(rawEmg)
WL = waveLen(rawEmg)
X = [varr rmsVal IAV integEMG MFL WL];
% save features and label vector
save('E:\FYP\EMG RawData\features','X','y');
fprintf('features are saved in dir: E:\\FYP\\EMG RawData\\features\n');


