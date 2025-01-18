%% Script to overlay a run with the input space

% Load Run Struct
load('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP01_13\2025_FYP01_13_D6_R03.mat')

% Load layers
runStruct = Utilities.fnLoadLayer(runStruct, 'PE');
runStruct = Utilities.fnLoadLayer(runStruct, 'VE');

%%
% Call the plotter
fnInputSpaceOverlay(TrainingData, runStruct.data, [1:7]);