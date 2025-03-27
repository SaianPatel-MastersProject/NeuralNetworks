%% Script to overlay a run with the input space

% Load Run Struct
load('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP03_24\2025_FYP03_24_D4_R08.mat')

% Load layers
runStruct = Utilities.fnLoadLayer(runStruct, 'PE');
runStruct = Utilities.fnLoadLayer(runStruct, 'KAP');

%%
% Call the plotter
fnInputSpaceOverlay(TrainingDataINT, runStruct.data(and(runStruct.data.lapNumber > 0, runStruct.data.lapNumber < 4), :), [1:5]);