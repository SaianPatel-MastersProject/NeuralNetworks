%% Script to overlay a run with the input space

% Load Run Struct
load('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP01_20\2025_FYP01_20_D7_R01.mat')

% Load layers
runStruct = Utilities.fnLoadLayer(runStruct, 'PE');
runStruct = Utilities.fnLoadLayer(runStruct, 'KAP');

%%
% Call the plotter
fnInputSpaceOverlay(trainingData, runStruct.data(and(runStruct.data.lapNumber > 0, runStruct.data.lapNumber < 5), :), [1:8]);