%% Import Neural Network
net = importNetworkFromONNX("SteeringModel_Iteration4.onnx", "InputDataFormats", "BC");

%% Import Reference Run

% matFilePath = 'D:\Users\Saian\Workspace\Data\+ProcessedData\2024\FYP12_09\2024_FYP12_09_D4_R02.mat';
% lap = 12;

matFilePath = 'D:\Users\Saian\Workspace\Data\+ProcessedData\2024\FYP12_23\2024_FYP12_23_D1_R01.mat';
lap = 0;

% Read in a run .mat file
load(matFilePath);

% Get the runID
runID = runStruct.metadata.runID;

% Read in CTE layers if they exist
CTEmatFilePath = strrep(matFilePath, '.mat', '_CTE.mat');

if isfile(CTEmatFilePath)

    % Load the CTE layer
    load(CTEmatFilePath)

    % Join CTE layer to the data for the run
    runStruct.data = addvars(runStruct.data, dataCTE.CTE, 'NewVariableNames', 'CTE');
    runStruct.data = addvars(runStruct.data, dataCTE.closestWaypointX, 'NewVariableNames', 'closestWaypointX');
    runStruct.data = addvars(runStruct.data, dataCTE.closestWaypointY, 'NewVariableNames', 'closestWaypointY');


end

% Read in VE layers if they exist
VEmatFilePath = strrep(matFilePath, '.mat', '_VE.mat');

if isfile(VEmatFilePath)

    % Load the CTE layer
    load(VEmatFilePath)

    % Join CTE layer to the data for the run
    runStruct.data = addvars(runStruct.data, dataVE.vError, 'NewVariableNames', 'vError');
    runStruct.data = addvars(runStruct.data, dataVE.refVel, 'NewVariableNames', 'refVel');
    runStruct.data = addvars(runStruct.data, dataVE.rCurvature, 'NewVariableNames', 'rCurvature');


end

% Read in ProMoD layers if they exist
ProMoDmatFilePath = strrep(matFilePath, '.mat', '_ProMoD.mat');

if isfile(ProMoDmatFilePath)

    % Load the CTE layer
    load(ProMoDmatFilePath)

    % Join CTE layer to the data for the run
    runStruct.data = addvars(runStruct.data, dataProMoD.MSteer, 'NewVariableNames', 'MSteer');

end

% filter by lap
runStruct.data = runStruct.data(runStruct.data.lapNumber == lap, :);

%% Run the sim
NN_Sim_Data = [runStruct.data.time - runStruct.data.time(1)];

for i = 1:size(runStruct.data, 1)

    CTE = runStruct.data.CTE(i);
    dCTEcol = [0; diff(runStruct.data.CTE)];
    dCTE = dCTEcol(i);
    curvature = 1./runStruct.data.rCurvature(i);
    dCuravtureCol = [0; diff(1./runStruct.data.rCurvature)];
    dCurvature = dCuravtureCol(i);
    yawRateCol = [0; runStruct.data.steerAngle(2:end) * -1.5];
    yawRateCol(abs(yawRateCol) < 0.01 ) = 0;
    yawRate = yawRateCol(i);

    input_i = [CTE, dCTE, curvature, dCurvature, yawRate];

    steeringOutput_i = predict(net, input_i);

    % Populate the array
    NN_Sim_Data(i,2:6) = input_i;
    NN_Sim_Data(i,7) = steeringOutput_i;

end

%% Plotting results
figure;
% subplot(5,1,1)
plot(NN_Sim_Data(:,1), runStruct.data.steerAngle)
hold on
plot(NN_Sim_Data(:,1), NN_Sim_Data(:,7))
xlabel('Time (s)')
ylabel('steerAngle')
