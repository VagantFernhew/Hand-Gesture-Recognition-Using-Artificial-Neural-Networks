
%==========================================================================
% this script read specified rows and columns from a csv data file, appends 
% it to existing csv file and save the updated file
%==========================================================================

%% Initialization
clear ; close all; clc

%=============initialize some important parameters===================
% by editing following parameters data can be read in different ways
% change the values according to your need

%reads only the range bounded by row offsets 'rowOffset' and 'endRow' and 
% column offsets 'colOffset' and 'endCol'
rowOffset = 1; 
colOffset = 4;  % select sensor 4
endRow = 600;
endCol = 4;
% intialize labels for 8 emg signals
labelVal = 1;
%=======================part 1: reading raw data========================

prompt = 'enter the path of data file to read\nfile = ';
file = input(prompt,'s');
% reading desired data file
fprintf('reading data from row 1-600 and column 1-8 .');
emgSignal = csvread(file,rowOffset,colOffset,[rowOffset,colOffset,endRow,endCol]);
fprintf('...............Done!\n\n');
fprintf('Program paused. Press enter to continue.\n\n');
pause;
%=====================part 2: labeling of data==============================
% class labeling
prompt1 = 'assign label to the data [1-4]\n label =  ';
label = input(prompt1);
label = label*labelVal;
labeld_data = [emgSignal; label];
fprintf('..................labeling is Done!\n\n')
fprintf('Program paused. Press enter to continue.\n\n');
pause;
%==================== part 3: saving labeld data=============================
% first load existing data
preData = load('new.csv');
newData = labeld_data';
updatedData = [preData; newData];
csvwrite('new.csv',updatedData);
fprintf('saving data ......Done\n');


































