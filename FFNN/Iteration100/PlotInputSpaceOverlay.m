%% Script to overlay a run with the input space

% Load Run Struct
load('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_21\2025_FYP04_21_D3_R07.mat')

% Load layers
runStruct = Utilities.fnLoadLayer(runStruct, 'PE');
runStruct = Utilities.fnLoadLayer(runStruct, 'KAP');

%%
% Call the plotter
fnInputSpaceOverlay(trainingData, runStruct.data((runStruct.data.lapNumber == 4), :), [1:5]);