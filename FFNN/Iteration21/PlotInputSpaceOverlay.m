%% Script to overlay a run with the input space

% Load Run Struct
load('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP01_13\2025_FYP01_13_D6_R02.mat')

% Load layers
runStruct = Utilities.fnLoadLayer(runStruct, 'PE');
runStruct = Utilities.fnLoadLayer(runStruct, 'VE');

%%
% Call the plotter
fnInputSpaceOverlay(TrainingData, runStruct.data(and(runStruct.data.lapNumber > 1, runStruct.data.lapNumber < 6), :), [1:9]);