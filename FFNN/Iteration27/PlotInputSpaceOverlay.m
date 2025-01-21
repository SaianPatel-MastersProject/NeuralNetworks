%% Script to overlay a run with the input space

% Load Run Struct
load('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP01_20\2025_FYP01_20_D2_R02.mat')

% Load layers
runStruct = Utilities.fnLoadLayer(runStruct, 'PE');
runStruct = Utilities.fnLoadLayer(runStruct, 'VE');

%%
% Call the plotter
fnInputSpaceOverlay(TrainingData, runStruct.data(and(runStruct.data.lapNumber > 0, runStruct.data.lapNumber < 7), :), [1:8]);