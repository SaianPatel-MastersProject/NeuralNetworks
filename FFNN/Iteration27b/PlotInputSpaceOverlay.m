%% Script to overlay a run with the input space

% Load Run Struct
load('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP01_20\2025_FYP01_20_D3_R02.mat')

% Load layers
runStruct = Utilities.fnLoadLayer(runStruct, 'PE');
runStruct = Utilities.fnLoadLayer(runStruct, 'VE');

%%
% Call the plotter
fnInputSpaceOverlay(trainingData, runStruct.data(and(runStruct.data.time > 12.7, runStruct.data.time < 30), :), [1:2]);